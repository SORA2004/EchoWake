// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:echowake/models/post.dart' as _i20;
import 'package:echowake/ui/views/audio_player/audio_player_view.dart' as _i10;
import 'package:echowake/ui/views/edit_profile/edit_profile_view.dart' as _i14;
import 'package:echowake/ui/views/home/home_view.dart' as _i2;
import 'package:echowake/ui/views/image/image_view.dart' as _i17;
import 'package:echowake/ui/views/likes/likes_view.dart' as _i13;
import 'package:echowake/ui/views/login/login_view.dart' as _i4;
import 'package:echowake/ui/views/main/main_view.dart' as _i5;
import 'package:echowake/ui/views/my_page/my_page_view.dart' as _i16;
import 'package:echowake/ui/views/profile/profile_view.dart' as _i8;
import 'package:echowake/ui/views/search/search_view.dart' as _i9;
import 'package:echowake/ui/views/signup/signup_view.dart' as _i6;
import 'package:echowake/ui/views/sound_downloaded/sound_downloaded_view.dart'
    as _i12;
import 'package:echowake/ui/views/sound_recorded/sound_recorded_view.dart'
    as _i11;
import 'package:echowake/ui/views/startup/startup_view.dart' as _i3;
import 'package:echowake/ui/views/upload/upload_view.dart' as _i7;
import 'package:echowake/ui/views/user/user_view.dart' as _i15;
import 'package:echowake/ui/views/user_player/user_player_view.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i21;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const mainView = '/main-view';

  static const signupView = '/signup-view';

  static const uploadView = '/upload-view';

  static const profileView = '/profile-view';

  static const searchView = '/search-view';

  static const audioPlayerView = '/audio-player-view';

  static const soundRecordedView = '/sound-recorded-view';

  static const soundDownloadedView = '/sound-downloaded-view';

  static const likesView = '/likes-view';

  static const editProfileView = '/edit-profile-view';

  static const userView = '/user-view';

  static const myPageView = '/my-page-view';

  static const imageView = '/image-view';

  static const userPlayerView = '/user-player-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    mainView,
    signupView,
    uploadView,
    profileView,
    searchView,
    audioPlayerView,
    soundRecordedView,
    soundDownloadedView,
    likesView,
    editProfileView,
    userView,
    myPageView,
    imageView,
    userPlayerView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i5.MainView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i6.SignupView,
    ),
    _i1.RouteDef(
      Routes.uploadView,
      page: _i7.UploadView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i8.ProfileView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i9.SearchView,
    ),
    _i1.RouteDef(
      Routes.audioPlayerView,
      page: _i10.AudioPlayerView,
    ),
    _i1.RouteDef(
      Routes.soundRecordedView,
      page: _i11.SoundRecordedView,
    ),
    _i1.RouteDef(
      Routes.soundDownloadedView,
      page: _i12.SoundDownloadedView,
    ),
    _i1.RouteDef(
      Routes.likesView,
      page: _i13.LikesView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i14.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.userView,
      page: _i15.UserView,
    ),
    _i1.RouteDef(
      Routes.myPageView,
      page: _i16.MyPageView,
    ),
    _i1.RouteDef(
      Routes.imageView,
      page: _i17.ImageView,
    ),
    _i1.RouteDef(
      Routes.userPlayerView,
      page: _i18.UserPlayerView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.MainView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.MainView(),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignupView(),
        settings: data,
      );
    },
    _i7.UploadView: (data) {
      final args = data.getArgs<UploadViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.UploadView(
            key: args.key, onUploadComplete: args.onUploadComplete),
        settings: data,
      );
    },
    _i8.ProfileView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ProfileView(),
        settings: data,
      );
    },
    _i9.SearchView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SearchView(),
        settings: data,
      );
    },
    _i10.AudioPlayerView: (data) {
      final args = data.getArgs<AudioPlayerViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.AudioPlayerView(key: args.key, post: args.post),
        settings: data,
      );
    },
    _i11.SoundRecordedView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SoundRecordedView(),
        settings: data,
      );
    },
    _i12.SoundDownloadedView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SoundDownloadedView(),
        settings: data,
      );
    },
    _i13.LikesView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.LikesView(),
        settings: data,
      );
    },
    _i14.EditProfileView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.EditProfileView(),
        settings: data,
      );
    },
    _i15.UserView: (data) {
      final args = data.getArgs<UserViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.UserView(key: args.key, userId: args.userId),
        settings: data,
      );
    },
    _i16.MyPageView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.MyPageView(),
        settings: data,
      );
    },
    _i17.ImageView: (data) {
      final args = data.getArgs<ImageViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ImageView(
            key: args.key, username: args.username, imageUrl: args.imageUrl),
        settings: data,
      );
    },
    _i18.UserPlayerView: (data) {
      final args = data.getArgs<UserPlayerViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i18.UserPlayerView(key: args.key, post: args.post),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class UploadViewArguments {
  const UploadViewArguments({
    this.key,
    required this.onUploadComplete,
  });

  final _i19.Key? key;

  final void Function() onUploadComplete;

  @override
  String toString() {
    return '{"key": "$key", "onUploadComplete": "$onUploadComplete"}';
  }

  @override
  bool operator ==(covariant UploadViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.onUploadComplete == onUploadComplete;
  }

  @override
  int get hashCode {
    return key.hashCode ^ onUploadComplete.hashCode;
  }
}

class AudioPlayerViewArguments {
  const AudioPlayerViewArguments({
    this.key,
    required this.post,
  });

  final _i19.Key? key;

  final _i20.Post post;

  @override
  String toString() {
    return '{"key": "$key", "post": "$post"}';
  }

  @override
  bool operator ==(covariant AudioPlayerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.post == post;
  }

  @override
  int get hashCode {
    return key.hashCode ^ post.hashCode;
  }
}

class UserViewArguments {
  const UserViewArguments({
    this.key,
    required this.userId,
  });

  final _i19.Key? key;

  final String userId;

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId"}';
  }

  @override
  bool operator ==(covariant UserViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userId == userId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userId.hashCode;
  }
}

class ImageViewArguments {
  const ImageViewArguments({
    this.key,
    required this.username,
    required this.imageUrl,
  });

  final _i19.Key? key;

  final String username;

  final String imageUrl;

  @override
  String toString() {
    return '{"key": "$key", "username": "$username", "imageUrl": "$imageUrl"}';
  }

  @override
  bool operator ==(covariant ImageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.username == username &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return key.hashCode ^ username.hashCode ^ imageUrl.hashCode;
  }
}

class UserPlayerViewArguments {
  const UserPlayerViewArguments({
    this.key,
    required this.post,
  });

  final _i19.Key? key;

  final _i20.Post post;

  @override
  String toString() {
    return '{"key": "$key", "post": "$post"}';
  }

  @override
  bool operator ==(covariant UserPlayerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.post == post;
  }

  @override
  int get hashCode {
    return key.hashCode ^ post.hashCode;
  }
}

extension NavigatorStateExtension on _i21.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadView({
    _i19.Key? key,
    required void Function() onUploadComplete,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.uploadView,
        arguments:
            UploadViewArguments(key: key, onUploadComplete: onUploadComplete),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAudioPlayerView({
    _i19.Key? key,
    required _i20.Post post,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.audioPlayerView,
        arguments: AudioPlayerViewArguments(key: key, post: post),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSoundRecordedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.soundRecordedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSoundDownloadedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.soundDownloadedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLikesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.likesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserView({
    _i19.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userView,
        arguments: UserViewArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImageView({
    _i19.Key? key,
    required String username,
    required String imageUrl,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.imageView,
        arguments: ImageViewArguments(
            key: key, username: username, imageUrl: imageUrl),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserPlayerView({
    _i19.Key? key,
    required _i20.Post post,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userPlayerView,
        arguments: UserPlayerViewArguments(key: key, post: post),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadView({
    _i19.Key? key,
    required void Function() onUploadComplete,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.uploadView,
        arguments:
            UploadViewArguments(key: key, onUploadComplete: onUploadComplete),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAudioPlayerView({
    _i19.Key? key,
    required _i20.Post post,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.audioPlayerView,
        arguments: AudioPlayerViewArguments(key: key, post: post),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSoundRecordedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.soundRecordedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSoundDownloadedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.soundDownloadedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLikesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.likesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserView({
    _i19.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userView,
        arguments: UserViewArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithImageView({
    _i19.Key? key,
    required String username,
    required String imageUrl,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.imageView,
        arguments: ImageViewArguments(
            key: key, username: username, imageUrl: imageUrl),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserPlayerView({
    _i19.Key? key,
    required _i20.Post post,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userPlayerView,
        arguments: UserPlayerViewArguments(key: key, post: post),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
