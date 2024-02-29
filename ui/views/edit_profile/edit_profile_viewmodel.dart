import 'dart:developer';
import 'dart:io';

import 'package:echowake/app/app.locator.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/services/storage_service.dart';
import 'package:echowake/ui/views/edit_profile/edit_profile_view.form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends FormViewModel {
  EditProfileViewModel() {
    _name = _authService.appUser?.name ?? '';
    _selectedGender = _authService.appUser!.gender ?? "남자";
    _photoURL = _authService.appUser?.photoURL;
    _nameController.text = _name;
  }

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _databaseService = locator<DatabaseService>();
  final _storageService = locator<StorageService>();

  AppUser get appUser => _authService.appUser!;

  late String _name;
  String get name => _name;

  File? _image;
  File? get image => _image;

  List<String> genderOptions = ["남자", "여자", "알리고 싶지 않음"];
  String _selectedGender = "남자";
  String get selectedGender => _selectedGender;

  String? _photoURL;

  void setSelectedGender(String? gender) {
    if (gender != null) {
      _selectedGender = gender;
      rebuildUi();
    }
  }

  String get bioInput => hasBioInput ? bioInputValue! : '';
  String get emailInput => hasEmailInput ? emailInputValue! : '';

  final TextEditingController _nameController = TextEditingController();

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);

      rebuildUi();
    } else {
      print('No image selected.');
    }
  }

  Future<void> showEditDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('이름 편집'),
          content: TextField(
            controller: _nameController,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                _name = _nameController.text;

                Navigator.pop(context);
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );

    rebuildUi();
  }

  Future<void> save() async {
    setBusy(true);

    // save database
    await _saveProfileInfo();

    setBusy(false);

    _navigationService.back();
  }

  Future<void> _saveProfileInfo() async {
    try {
      final user = _authService.user;

      // 이미지를 스토리지에 저장하고 URL을 받아옵니다.
      if (_image != null) {
        _photoURL = await _storageService.uploadPhotoUrl(
          photoURLPath: _image!.path,
          uid: user!.uid,
        );
      }

      // 유저정보 업데이트
      final appUser = _authService.appUser!;
      final updatedAppUser = appUser.copyWith(
        name: _name,
        bio: bioInput,
        email: emailInput,
        photoURL: _photoURL,
        gender: selectedGender,
        updatedAt: DateTime.now(),
      );

      _authService.setAppUser(updatedAppUser);
      await _databaseService.updateAppUser(updatedAppUser);
    } catch (e) {
      log("Firestore 저장 에러: $e");
    }
  }

  void goBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }
}
