import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/models/post.dart';
import 'package:echowake/services/database_service.dart';
import 'package:echowake/services/post_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<Post>> {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _postService = locator<PostService>();

  void navigateToSearch() {
    _navigationService.navigateToSearchView();
  }

  @override
  Stream<List<Post>> get stream => streamPost();

  Stream<List<Post>> streamPost() {
    return _databaseService.streamPosts().map(
      (event) {
        final posts = event.docs.map((doc) => Post.fromDoc(doc)).toList();
        _postService.addPosts(posts);
        return posts;
      },
    );
  }
}
