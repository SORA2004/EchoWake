import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://echowake-b5331.appspot.com');

  Future<String> uploadAudio({
    required String audioPath,
    required String userId,
    String? audioExtension,
  }) async {
    // Firebase Storage에 동영상 파일 업로드
    // 파일 확장자는 getExtensionFromFileName 로 파일 네임을 넣어서 추출해서 가져오거나
    // 선택 확장자에서 aac 만 고정적으로 가져올 수 있게 해도 됩니다.
    final File audioFile = File(audioPath);

    final audioRef = _storage.ref(
        'audios/$userId/${DateTime.now().millisecondsSinceEpoch}.${audioExtension ?? 'aac'}');
    await audioRef.putFile(audioFile);

    final String audioUrl = await audioRef.getDownloadURL();

    return audioUrl;
  }

  Future<String> uploadThumbnail({
    required String thumbnailPath,
    required String userId,
  }) async {
    // Firebase Storage에 썸네일 이미지 파일 업로드
    final File thumbnailFile = File(thumbnailPath);

    final thumbnailRef = _storage
        .ref('thumbnails/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await thumbnailRef.putFile(thumbnailFile);
    final String thumbnailUrl = await thumbnailRef.getDownloadURL();

    return thumbnailUrl;
  }

  // Firebase Storage에 유저 프로필 이미지 파일 업로드
  Future<String> uploadPhotoUrl({
    required String photoURLPath,
    required String uid,
  }) async {
    final File image = File(photoURLPath);
    final photoRef = _storage.ref('profile_images/$uid.jpg');
    await photoRef.putFile(image);

    final String photoUrl = await photoRef.getDownloadURL();
    return photoUrl;
  }
}
