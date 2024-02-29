import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/models/post.dart';
import 'package:echowake/models/post_like.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/services/post_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AudioPlayerViewModel extends BaseViewModel {
  final String postId;
  bool _showMiniPlayer = false;

  final AudioPlayer player = AudioPlayer();
  late PlayerState _playerState;

  //스트림 구독을 위한 변수
  late StreamSubscription _playSubscription;
  late StreamSubscription _playerSubscription;
  late StreamSubscription _playerDuration;
  late StreamSubscription? _positionSubscription;

  late Post _post;
  Post get post => _post;

  bool get isShuffle => _postService.isShuffle;
  // 미니 플레이어 표시 여부를 결정하는 getter
  bool get showMiniPlayer => _showMiniPlayer;

  AudioPlayerViewModel({
    required this.postId,
  }) {
    // 볼륨 낮추기
    player.setVolume(0.5);
    _playerState = player.state;

    // post 가져오기
    var post = _postService.getPostById(postId);
    if (post == null) {
      // post가 없는 경우에 대한 처리
      _snackbarService.showSnackbar(
        message: '존재하지 않는 포스트입니다.',
        duration: const Duration(seconds: 2),
      );
      // TODO: 존재하지 않는 Post에 대한 처리를 구현하세요.
      // 아래는 임시 객체 생성 예시입니다. 실제 앱에 맞게 수정하세요.
      // 존재하지 않는 Post에 대한 처리
      _post = Post(
        title: 'Unknown',
        audioUrl: '', // 오디오 URL이 없는 경우 빈 문자열 또는 기본 오디오 URL 제공
        thumbnailUrl: '', // 썸네일 이미지 URL이 없는 경우 빈 문자열 또는 기본 이미지 URL 제공
        name: '', // 게시물의 이름/제목이 없는 경우 'Unknown' 또는 다른 기본 값 제공
        createdAt: DateTime.now(), // 생성 날짜에 대한 기본값으로 현재 시간을 사용
        downloadCount: 0, // 다운로드 횟수의 기본값으로 0 사용
        likeCount: 0, // 좋아요 횟수의 기본값으로 0 사용
        userId: 'unknown', // 사용자 ID가 없는 경우 'unknown' 또는 다른 기본값 제공
        viewCount: 0, // 조회수의 기본값으로 0 사용
        // 다른 필요한 필드에 대해서도 적절한 기본값을 설정하세요.
      );
    } else {
      _post = post; // 존재하는 Post를 설정합니다.
    }

    // Player 설정 및 재생
    if (_post.audioUrl.isNotEmpty) {
      player.play(UrlSource(_post.audioUrl));
    }

    // Player 상태 구독
    _playSubscription = player.onPlayerStateChanged.listen((PlayerState state) {
      _playerState = state;
      notifyListeners();
    });

    _playerSubscription = player.onPlayerComplete.listen((event) {
      _playerState = PlayerState.stopped;
      playNext();
    });

    _playerDuration = player.onDurationChanged.listen((duration) {
      _duration = duration;
      notifyListeners();
    });

    _positionSubscription = player.onPositionChanged.listen((position) {
      _position = position;
      notifyListeners();
    });

    // 조회수 증가
    _increaseViewCount();

    _getPostLike();

    _likeCount = _post.likeCount;
  }

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();
  final _postService = locator<PostService>();
  final _snackbarService = locator<SnackbarService>();

  PostLike? _postLike;
  bool get isMyLike => _postLike != null;

  late int _likeCount;
  int get likeCount => _likeCount;

  Duration? _duration;
  Duration? get duration => _duration;

  Duration? _position;
  Duration? get position => _position;

  bool get _isPlaying => _playerState == PlayerState.playing;
  bool get isPlaying => _isPlaying;

  bool get _isPaused => _playerState == PlayerState.paused;
  bool get isPaused => _isPaused;

  double get sliderValue => (position != null &&
      duration != null &&
      position!.inMilliseconds > 0 &&
      position!.inMilliseconds < duration!.inMilliseconds)
      ? position!.inMilliseconds / duration!.inMilliseconds
      : 0.0;

  String get playingTime => position != null
      ? '${position!.inMinutes}:${position!.inSeconds.remainder(60).toString().padLeft(2, '0')}'
      : '0:00';

  String get totlaTime => duration != null
      ? '${duration!.inMinutes}:${duration!.inSeconds.remainder(60).toString().padLeft(2, '0')}'
      : '0:00';

  Future<void> togglePlay() async {
    if (_isPlaying) {
      await player.pause();
    } else {
      await player.resume();
    }
  }

  // 미니 플레이어를 표시하거나 숨기는 메서드
  void toggleMiniPlayer() {
    _showMiniPlayer = !_showMiniPlayer;
    notifyListeners(); // UI를 업데이트하기 위해 리스너에게 상태 변경을 알림
  }

  // initialise 메서드를 정의해야 합니다. 이 메서드는 초기화 로직을 포함합니다.
  void initialise() {
    // 초기화 로직을 추가하세요.
  }

  Future<void> playPrevious() async {
    // 재생시간이 6초 이상이면 처음부터 재생
    if (_position != null && _position!.inSeconds > 6) {
      await _stop();
      await player.play(UrlSource(_post.audioUrl));

      rebuildUi();
      return;
    }

    // 재생시간이 6초 미만이면 이전 음악 재생
    final post = _postService.getPreviousPostById(_post.id!);

    if (post != null) {
      _post = post;
      _likeCount = _post.likeCount;
      _postLike = null;

      await _stop();
      await player.play(UrlSource(_post.audioUrl));

      await _getPostLike();
      rebuildUi();

      await _increaseViewCount();
    } else {
      _snackbarService.showSnackbar(
        message: '첫번째 음악입니다.',
        title: '확인',
        duration: const Duration(seconds: 2),
      );
    }
  }

  Future<void> playNext() async {
    final post = _postService.getNextPostById(_post.id!);

    if (post != null) {
      _post = post;
      _likeCount = _post.likeCount;
      _postLike = null;

      await _stop();
      await player.play(UrlSource(_post.audioUrl));

      await _getPostLike();
      rebuildUi();

      await _increaseViewCount();
    } else {
      _snackbarService.showSnackbar(
        message: '마지막 음악입니다.',
        title: '확인',
        duration: const Duration(seconds: 2),
      );
    }
  }

  Future<void> _stop() async {
    await player.stop();

    _position = Duration.zero;
  }

  void onChanged(double value) {
    if (duration == null) {
      return;
    }

    final position = value * duration!.inMilliseconds;
    player.seek(Duration(milliseconds: position.round()));
  }

  Future<void> _increaseViewCount() async {
    // 조회수 증가
    await _databaseService.increaseViewCount(_post.id!);
  }

  Future<void> _getPostLike() async {
    // 좋아요 데이터 가져오기
    final postLike = await _databaseService.getPostLike(
      _authService.user!.uid,
      _post.id!,
    );
    _postLike = postLike;
    rebuildUi();
  }

  Future<void> toggleLike() async {
    if (_postLike == null) {
      // 좋아요 데이터 추가
      final postLike = PostLike(
        userId: _authService.user!.uid,
        postId: _post.id!,
      );
      final ref = await _databaseService.addPostLike(postLike);
      _postLike = postLike.copyWith(id: ref);

      // 유저 포스트 좋아요 수 증가
      await _databaseService.increasePostLikeCount(_post.id!);
      _likeCount++;
    } else {
      // 좋아요 데이터 삭제
      await _databaseService.deletePostLike(_postLike!);
      _postLike = null;

      // 유저 포스트 좋아요 수 감소
      await _databaseService.decreasePostLikeCount(_post.id!);
      _likeCount--;
    }

    rebuildUi();
  }

  void toggleShuffle() {
    _postService.toggleShuffle();
    _snackbarService.showSnackbar(
      message: _postService.isShuffle ? '음악을 무작위로 재생합니다' : '음악을 순서대로 재생합니다',
      title: '확인',
      duration: const Duration(seconds: 2),
    );

    rebuildUi();
  }

  Future<void> navigateToUserView(String userId) async {
    await _stop();
    _navigationService.navigateToUserView(userId: userId);
  }

  @override
  void dispose() {
    player.dispose();

    _playSubscription.cancel();
    _playerSubscription.cancel();
    _playerDuration.cancel();
    _positionSubscription?.cancel();

    super.dispose();
  }
}
