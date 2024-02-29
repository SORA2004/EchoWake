import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    _authService.init();

    if (_authService.hasLoggedInUser) {
      final appUser = await _databaseService.getAppUser(_authService.user!.uid);
      _authService.setAppUser(appUser);

      _navigationService.replaceWithMainView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
