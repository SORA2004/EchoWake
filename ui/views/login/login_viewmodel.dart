import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/ui/views/login/login_view.form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();

  String get email => hasEmailInput ? emailInputValue! : '';
  String get password => hasPasswordInput ? passwordInputValue! : '';

  Future<void> signInWithGoogle() async {
    User? user = await _signInWithGoogle();
    if (user != null) {
      // 로그인 성공
      print('Google 로그인 성공: ${user.displayName}');
      // 메인으로 이동
      _navigationService.replaceWithMainView();
    } else {
      // 로그인 실패
      print('Google 로그인 실패');
    }
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // 사용자가 로그인을 취소한 경우

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _authService.signInWithCredential(credential);

      final appUser = AppUser(
        name: googleUser.displayName ?? 'Google User',
        email: googleUser.email,
        photoURL: googleUser.photoUrl,
        postCount: 0,
        followerCount: 0,
        followingCount: 0,
        createdAt: DateTime.now(),
      );

      await _databaseService.addAppUser(
          uid: userCredential.user!.uid, appUser: appUser);

      final updatedAppUser = appUser.copyWith(id: userCredential.user!.uid);

      _authService.setAppUser(updatedAppUser);
      _authService.setUser(userCredential.user!);

      return userCredential.user;
    } catch (error) {
      print('Google 로그인 실패: $error');
      return null;
    }
  }

  Future<void> login() async {
    try {
      setBusy(true);

      final userCredential = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final appUser =
          await _databaseService.getAppUser(userCredential.user!.uid);

      _authService.setAppUser(appUser);
      _authService.setUser(userCredential.user!);

      //메인으로 이동
      _navigationService.replaceWithMainView();
    } catch (e) {
      print('로그인 실패: $e');

      // 스낵바
      _snackbarService.showSnackbar(
        message: '로그인 실패: 이메일과 비밀번호를 확인해주세요.',
        duration: const Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  void navigateToSignUp() {
    // 회원가입으로 이동
    _navigationService.navigateToSignupView();
  }

  Future<void> resetPassword() async {
    try {
      await _authService.resetPassword(email: email);

      _snackbarService.showSnackbar(
        message: '비밀번호 재설정 링크가 이메일로 전송되었습니다.',
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      print('비밀번호 재설정 실패: $e');

      _snackbarService.showSnackbar(
        message: '비밀번호 재설정 실패: 이메일을 확인해주세요.',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
