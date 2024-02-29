import 'package:echowake/app/app.locator.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();

  String get name => hasNameInput ? nameInputValue! : '';
  String get email => hasEmailInput ? emailInputValue! : '';
  String get password => hasPasswordInput ? passwordInputValue! : '';
  String get confirmPassword =>
      hasConfirmPasswordInput ? confirmPasswordInputValue! : '';

  void signUp() async {
    if (password == confirmPassword) {
      try {
        final userCredential =
            await _authService.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final appUser = AppUser(
          name: name,
          email: email,
          photoURL: userCredential.user!.photoURL,
          postCount: 0,
          followerCount: 0,
          followingCount: 0,
          createdAt: DateTime.now(),
        );

        await _databaseService.addAppUser(
          uid: userCredential.user!.uid,
          appUser: appUser,
        );

        final updatedAppUser = appUser.copyWith(id: userCredential.user!.uid);

        _authService.setAppUser(updatedAppUser);
        _authService.setUser(userCredential.user!);

        // 회원가입 성공 후 로그인 페이지로 돌아가기
        _navigationService.back();
      } catch (e) {
        print('회원가입 실패: $e');
        // 회원가입 실패 시 사용자에게 알림
        _snackbarService.showSnackbar(
          message: '회원가입 실패: 이메일과 비밀번호를 확인해주세요.',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      // 비밀번호와 비밀번호 확인이 일치하지 않을 때
      _snackbarService.showSnackbar(
        message: '비밀번호가 일치하지 않습니다.',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
