import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/models/user_follow.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserViewModel extends StreamViewModel<AppUser> {
  final String userId;

  UserViewModel({required this.userId}) {
    _getUserFollow();
  }

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();

  String get myId => _authService.user!.uid;

  UserFollow? _userFollow;
  UserFollow? get userFollow => _userFollow;

  bool get isMyFollow => _userFollow != null;

  String get username => data?.name ?? '사용자';

  String get photoURL =>
      data?.photoURL ??
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  @override
  Stream<AppUser> get stream => _streamAppuser();

  // 유저 데이터 받아올것
  Stream<AppUser> _streamAppuser() {
    return _databaseService.streamAppUser(userId);
  }

  Future<void> _getUserFollow() async {
    _userFollow = await _databaseService.getUserFollow(myId, userId);
    rebuildUi();
  }

  // 팔로우 토글
  Future<void> toggleFollow() async {
    if (_userFollow == null) {
      final userFollow = UserFollow(
        userId: myId,
        followId: userId,
      );

      final refId = await _databaseService.addUserFollow(userFollow);
      _userFollow = userFollow.copyWith(id: refId);

      // 나는 팔로일 증가
      await _databaseService.increaseUserFollowingCount(myId);
      // 상대방은 팔로워 증가
      await _databaseService.increaseUserFollowerCount(userId);
    } else {
      await _databaseService.deleteUserFollow(_userFollow!);
      _userFollow = null;

      // 나는 팔로우 감소
      await _databaseService.decreaseUserFollowingCount(myId);
      // 상대방은 팔로워 감소
      await _databaseService.decreaseUserFollowerCount(userId);
    }
  }

  void navigateToImageView() {
    _navigationService.navigateToImageView(
      username: username,
      imageUrl: photoURL,
    );
  }
}
