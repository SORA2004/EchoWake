import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:echowake/app/app.locator.dart';
import 'package:echowake/models/post.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/services/storage_service.dart';
import 'package:echowake/ui/views/upload/upload_view.form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class UploadViewModel extends FormViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _storageService = locator<StorageService>();
  final _databaseService = locator<DatabaseService>();

  final ImagePicker _picker = ImagePicker();

  String? _thumbnailPath;
  String? get thumbnailPath => _thumbnailPath;

  String? _videoPath;
  String? get videoPath => _videoPath;

  String? _audioPath;
  String? get audioPath => _audioPath;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  final AudioPlayer _player = AudioPlayer();

  String get title => hasTitleInput ? titleInputValue! : '';

  StreamSubscription? _playSubscription;

  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'm4a', 'aac'],
    );

    if (result != null) {
      _audioPath = result.files.single.path;

      _playAudio();
    }
  }

  Future<void> toggleAudio() async {
    if (_isPlaying) {
      await _pauseAudio();
    } else {
      await _playAudio();
    }
  }

  Future<void> _playAudio() async {
    if (_audioPath != null) {
      await _player.play(DeviceFileSource(_audioPath!));

      _isPlaying = true;
      rebuildUi();

      _playSubscription = _player.onPlayerComplete.listen((event) {
        _isPlaying = false;

        rebuildUi();
      });
    }
  }

  Future<void> _pauseAudio() async {
    await _player.pause();

    _isPlaying = false;

    rebuildUi();
  }

  Future<void> pickThumbnailImage() async {
    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      _thumbnailPath = imageFile.path;

      rebuildUi();
    }
  }

  Future<void> uploadAndNavigate(VoidCallback onUploadComplete) async {
    setBusy(true);

    final uploadResult = await _uploadAudioAndThumbnail();

    if (uploadResult['success']) {
      final writeResult = await _writePost(
          uploadResult['audioUrl'], uploadResult['thumbnailUrl']);

      await _addUserPostCount();

      if (writeResult['success']) {
        //업로드후 화면 리프레쉬
        _clear();
        setBusy(false);
        onUploadComplete();
        // _navigationService.replaceWithMainView();
      } else {
        _snackbarService.showSnackbar(
          message: '쓰기에 실패했습니다.',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      _snackbarService.showSnackbar(
        message: '업로드에 실패했습니다.',
        duration: const Duration(seconds: 2),
      );
    }

    setBusy(false);
  }

  Future<void> _clear() async {
    await _player.release();

    _thumbnailPath = null;
    _audioPath = null;
    _videoPath = null;

    titleInputValue = '';
  }

  Future<Map<String, dynamic>> _uploadAudioAndThumbnail() async {
    final user = _authService.user;

    // 로그인한 사용자가 있고, 오디오 파일과 썸네일 이미지 파일이 있을 때
    if (user != null && _audioPath != null && _thumbnailPath != null) {
      try {
        // 업로드된 파일의 URL을 반환
        final audioUrl = await _storageService.uploadAudio(
          audioPath: _audioPath!,
          userId: user.uid,
          audioExtension: _getExtensionFromFileName(_audioPath!),
        );

        final thumbnailUrl = await _storageService.uploadThumbnail(
          thumbnailPath: _thumbnailPath!,
          userId: user.uid,
        );

        return {
          'success': true,
          'audioUrl': audioUrl,
          'thumbnailUrl': thumbnailUrl
        };
      } catch (error) {
        if (kDebugMode) {
          print('업로드 에러: $error');
        }
        return {'success': false};
      }
    } else {
      // 필요한 정보가 없거나 사용자가 로그인하지 않은 경우
      return {'success': false};
    }
  }

  // 확장자 추출
  String _getExtensionFromFileName(String fileName) {
    int dotIndex = fileName.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < fileName.length - 1) {
      return fileName.substring(dotIndex + 1).toLowerCase();
    }
    return '';
  }

  Future<String?> _generateThumbnail(String videoPath) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 150,
      quality: 75,
    );

    if (thumbnailPath != null) {
      _thumbnailPath = thumbnailPath;
    }

    rebuildUi();

    return thumbnailPath;
  }

  Future<Map<String, dynamic>> _writePost(
      String audioUrl, String thumbnailUrl) async {
    try {
      // 로그인 없이 업로드 테스트 하실 때에는 if문 부분을 주석처리 해주시고
      // uid 에 임의로 넣으신 후 테스트 하시면 됩니다.

      final appUser = _authService.appUser!;

      final post = Post(
        userId: appUser.id!,
        name: appUser.name,
        title: title,
        audioUrl: audioUrl,
        thumbnailUrl: thumbnailUrl,
        photoURL: appUser.photoURL,
        likeCount: 0,
        viewCount: 0,
        downloadCount: 0,
        createdAt: DateTime.now(),
      );

      await _databaseService.addPost(post);

      return {'success': true};
    } catch (e) {
      return {'success': false};
    }
  }

  // 유저 포스트수 증가
  Future<void> _addUserPostCount() async {
    final user = _authService.user!;

    await _databaseService.increaseUserPostCount(user.uid);
  }

  @override
  void dispose() {
    _player.dispose();
    _playSubscription?.cancel();

    super.dispose();
  }
}
