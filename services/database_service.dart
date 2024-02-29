import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echowake/models/app_user.dart';
import 'package:echowake/models/post.dart';
import 'package:echowake/models/post_like.dart';
import 'package:echowake/models/user_follow.dart';
import 'package:echowake/utils/field.dart';
import 'package:echowake/utils/tables.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAppUser({
    required String uid,
    required AppUser appUser,
  }) async {
    await _firestore.collection(Tables.users).doc(uid).set(appUser.toJson());
  }

  Future<AppUser> getAppUser(String uid) async {
    final doc = await _firestore.collection(Tables.users).doc(uid).get();
    return AppUser.fromDoc(doc);
  }

  // 유저 데이터 스트림
  Stream<AppUser> streamAppUser(String uid) {
    return _firestore
        .collection(Tables.users)
        .doc(uid)
        .snapshots()
        .map((doc) => AppUser.fromDoc(doc));
  }

  // 유저 정보 업데이트
  Future<void> updateAppUser(
    AppUser appUser,
  ) async {
    await _firestore
        .collection(Tables.users)
        .doc(appUser.id!)
        .update(appUser.toJson());
  }

  Future<void> addPost(Post post) async {
    await _firestore.collection(Tables.posts).add(post.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamPosts() {
    return _firestore
        .collection(Tables.posts)
        .orderBy(Field.createdAt, descending: true)
        .snapshots();
  }

  Future<List<Post>> getUserPosts(String userId) async {
    final querySnapshot = await _firestore
        .collection(Tables.posts)
        .where(Field.userId, isEqualTo: userId)
        .orderBy(Field.createdAt, descending: true)
        .get();

    final posts = querySnapshot.docs.map((doc) => Post.fromDoc(doc)).toList();
    return posts;
  }

  // 포스트 삭제
  Future<void> deletePost(String postId) async {
    await _firestore.collection(Tables.posts).doc(postId).delete();
  }

  // 조회수 증가
  Future<void> increaseViewCount(String postId) async {
    await _firestore.collection(Tables.posts).doc(postId).update(
      {Field.viewCount: FieldValue.increment(1)},
    );
  }

  // 유저 포스트수 증가
  Future<void> increaseUserPostCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.postCount: FieldValue.increment(1)},
    );
  }

  // 유저 포스트수 감소
  Future<void> decreaseUserPostCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.postCount: FieldValue.increment(-1)},
    );
  }

  // 좋아요 데이터 가져오기
  Future<PostLike?> getPostLike(String userId, String postId) async {
    final querySnapshot = await _firestore
        .collection(Tables.postLikes)
        .where(Field.userId, isEqualTo: userId)
        .where(Field.postId, isEqualTo: postId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return null;
    }

    final postLike = PostLike.fromDoc(querySnapshot.docs.first);
    return postLike;
  }

  // 좋아요 데이터 추가
  Future<String> addPostLike(PostLike postLike) async {
    final ref =
        await _firestore.collection(Tables.postLikes).add(postLike.toJson());
    return ref.id;
  }

  // 좋아요 데이터 삭제
  Future<void> deletePostLike(PostLike postLike) async {
    await _firestore.collection(Tables.postLikes).doc(postLike.id).delete();
  }

  // 포스트 좋아요 수 증가
  Future<void> increasePostLikeCount(String postId) async {
    await _firestore.collection(Tables.posts).doc(postId).update(
      {Field.likeCount: FieldValue.increment(1)},
    );
  }

  // 포스트 좋아요 수 감소
  Future<void> decreasePostLikeCount(String postId) async {
    await _firestore.collection(Tables.posts).doc(postId).update(
      {Field.likeCount: FieldValue.increment(-1)},
    );
  }

  // 유저 팔로우 가져오기
  Future<UserFollow?> getUserFollow(String userId, String followId) async {
    final querySnapshot = await _firestore
        .collection(Tables.userFollows)
        .where(Field.userId, isEqualTo: userId)
        .where(Field.followId, isEqualTo: followId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      final userFollow = UserFollow.fromDoc(querySnapshot.docs.first);
      return userFollow;
    }
  }

  // 유저 팔로우 추가
  Future<String> addUserFollow(UserFollow userFollow) async {
    final ref = await _firestore
        .collection(Tables.userFollows)
        .add(userFollow.toJson());
    return ref.id;
  }

  // 유저 팔로우 삭제
  Future<void> deleteUserFollow(UserFollow userFollow) async {
    await _firestore.collection(Tables.userFollows).doc(userFollow.id).delete();
  }

  // 유저 팔로우 수 증가
  Future<void> increaseUserFollowingCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.followingCount: FieldValue.increment(1)},
    );
  }

  // 유저 팔로우 수 감소
  Future<void> decreaseUserFollowingCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.followingCount: FieldValue.increment(-1)},
    );
  }

  // 유저 팔로워 수 증가
  Future<void> increaseUserFollowerCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.followerCount: FieldValue.increment(1)},
    );
  }

  // 유저 팔로워 수 감소
  Future<void> decreaseUserFollowerCount(String userId) async {
    await _firestore.collection(Tables.users).doc(userId).update(
      {Field.followerCount: FieldValue.increment(-1)},
    );
  }
}
