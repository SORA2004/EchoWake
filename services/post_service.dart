import 'package:echowake/models/post.dart';

class PostService {
  final List<Post> _posts = []; // _posts 초기화, 중복 선언 제거

  List<Post> get posts => _posts;

  // getPostById 메서드 수정
  Post? getPostById(String postId) {
    try {
      return _posts.firstWhere((post) => post.id == postId);
    } catch (e) {
      return null; // 해당하는 Post가 없을 경우 null 반환
    }
  }

  // Shuffle 상태에 따라 Post 리스트를 반환
  List<Post> get _shuffledPosts {
    final shuffledPosts = _posts.toList()..shuffle();
    return shuffledPosts;
  }

  // Post 리스트 추가
  void addPosts(List<Post> posts) {
    _posts.clear();
    _posts.addAll(posts);
  }

  bool _isShuffle = false;
  bool get isShuffle => _isShuffle;

  // Shuffle 상태 토글
  void toggleShuffle() {
    _isShuffle = !_isShuffle;
  }

  // 주어진 postId 이전의 Post 반환, Shuffle 모드 고려
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

  // 주어진 postId 다음의 Post 반환, Shuffle 모드 고려
  Post? getNextPostById(String postId) {
    final posts = _isShuffle ? _shuffledPosts : _posts;

    final index = posts.indexWhere((post) => post.id == postId);
    if (index == -1) {
      return null;
    } else if (index == posts.length - 1) {
      return posts.first;
    } else {
      return posts[index + 1];
    }
  }
}
