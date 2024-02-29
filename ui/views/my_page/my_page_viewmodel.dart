import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyPageViewModel extends StreamViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();

  String get userId => _authService.user!.uid;

  @override
  Stream get stream => _streamAppuser();

  // 유저 데이터 스트림
  Stream<AppUser> _streamAppuser() {
    return _databaseService.streamAppUser(userId);
  }

  void navigateToEditProfileView() {
    _navigationService.navigateToEditProfileView();
  }

  void signOut() => _authService.signOut();
}
