import 'package:pathverse_app/models/comment.dart';
import 'package:pathverse_app/models/post.dart';
import 'package:pathverse_app/services/api_service.dart';

class ApiRepository {
  final _provider = ApiService();

  Future<List<Post>?> fetchPostList() {
    return _provider.fetchPostList();
  }

  Future<List<Post>?> fetchUserPostList({required String userId}) {
    return _provider.fetchUserPostList(userId: userId);
  }

  Future<List<Comment>?> fetchCommentList({required String postId}) {
    return _provider.fetchCommentList(postId: postId);
  }
}

class NetworkError extends Error {}
