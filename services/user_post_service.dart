import 'package:echowake/models/post.dart';

class UserPostService {
  final List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<Post> get _shuffledPosts {
    final shuffledPosts = _posts.toList()..shuffle();
    return shuffledPosts;
  }

  void addPosts(List<Post> posts) {
    _posts.clear();
    _posts.addAll(posts);
  }

  bool _isShuffle = false;
  bool get isShuffle => _isShuffle;

  void toggleShuffle() {
    _isShuffle = !_isShuffle;
  }

  Post getPostById(String postId) {
    return _posts.firstWhere((post) => post.id == postId);
  }

  Post? getPreviousPostById(String postId) {
    final posts = _isShuffle ? _shuffledPosts : _posts;

    final index = posts.indexWhere((post) => post.id == postId);
    if (index == -1) {
      return null;
    } else if (index == 0) {
      return posts.last;
    } else {
      return posts[index - 1];
    }
  }

  Post? getNextPostById(String postId) {
    final posts = _isShuffle ? _shuffledPosts : _posts;

    final index = posts.indexWhere((post) => post.id == postId);
    if (index == -1) {
      return null;
    } else if (index == _posts.length - 1) {
      return posts.first;
    } else {
      return posts[index + 1];
    }
  }
}
