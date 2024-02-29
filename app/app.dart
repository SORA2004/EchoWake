import 'package:echowake/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:echowake/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:echowake/ui/views/home/home_view.dart';
import 'package:echowake/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:echowake/ui/views/login/login_view.dart';
import 'package:echowake/ui/views/main/main_view.dart';
import 'package:echowake/ui/views/signup/signup_view.dart';
import 'package:echowake/ui/views/upload/upload_view.dart';
import 'package:echowake/ui/views/profile/profile_view.dart';
import 'package:echowake/ui/views/search/search_view.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/ui/views/audio_player/audio_player_view.dart';
import 'package:echowake/ui/views/sound_recorded/sound_recorded_view.dart';
import 'package:echowake/ui/views/sound_downloaded/sound_downloaded_view.dart';
import 'package:echowake/ui/views/likes/likes_view.dart';
import 'package:echowake/ui/views/edit_profile/edit_profile_view.dart';
import 'package:echowake/services/auth_service.dart';
import 'package:echowake/services/storage_service.dart';
import 'package:echowake/ui/views/user/user_view.dart';
import 'package:echowake/ui/views/my_page/my_page_view.dart';
import 'package:echowake/ui/dialogs/confirmation/confirmation_dialog.dart';
import 'package:echowake/services/post_service.dart';
import 'package:echowake/ui/views/image/image_view.dart';
import 'package:echowake/ui/views/user_player/user_player_view.dart';
import 'package:echowake/services/user_post_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: UploadView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: AudioPlayerView),
    MaterialRoute(page: SoundRecordedView),
    MaterialRoute(page: SoundDownloadedView),
    MaterialRoute(page: LikesView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: UserView),
    MaterialRoute(page: MyPageView),
    MaterialRoute(page: ImageView),
    MaterialRoute(page: UserPlayerView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: PostService),
    LazySingleton(classType: UserPostService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ConfirmationDialog),
// @stacked-dialog
  ],
)
class App {}
