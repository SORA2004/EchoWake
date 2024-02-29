import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel() {
    loadProfileInfo();
  }

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  File? _image;
  File? get image => _image;

  String _userName = "사용자 이름";
  String get userName => _userName;

  String _userBio = "";
  String _userEmail = "";
  String _selectedGender = "";

  int _followers = 0;
  int get followers => _followers;

  int _following = 0;
  int get following => _following;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);

      rebuildUi();
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    // 이미지 업로드 로직 구현 필요
    return '업로드된 이미지 URL';
  }

  Future<void> updateProfileInfo() async {
    String imageUrl = '';
    if (_image != null) {
      imageUrl = await uploadImageToStorage(_image!);
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'userName': _userName,
        'userBio': _userBio,
        'userEmail': _userEmail,
        'selectedGender': _selectedGender,
        'imageUrl': imageUrl,
      });
    }
  }

  Future<void> saveProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', _userName);
    prefs.setString('userBio', _userBio);
    prefs.setString('userEmail', _userEmail);
    prefs.setString('selectedGender', _selectedGender);
  }

  Future<void> loadProfileInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

        _userName = userData['userName'] ?? _userName;
        _userBio = userData['userBio'] ?? _userBio;
        _userEmail = userData['userEmail'] ?? _userEmail;
        _selectedGender = userData['selectedGender'] ?? _selectedGender;
        if (userData['imageUrl'] != null && userData['imageUrl'].isNotEmpty) {
          // 이미지 URL을 사용하여 _image 처리
        }

        rebuildUi();
      }
    }
  }

  Future<void> navigateToEditProfile() async {
    final result = await _navigationService.navigateToEditProfileView();

    if (result != null) {
      _userName = result['userName'];
      _userBio = result['userBio'];
      _userEmail = result['userEmail'];
      _selectedGender = result['selectedGender'];
      _image = result['image'];

      saveProfileInfo();

      rebuildUi();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
