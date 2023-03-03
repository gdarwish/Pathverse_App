import 'package:dio/dio.dart';
import 'package:pathverse_app/models/comment.dart';
import 'package:pathverse_app/models/post.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>?> fetchPostList() async {
    try {
      Response response = await _dio.get(_url);
      return (response.data as List)
          .map(
            (data) => Post.fromJson(data),
          )
          .toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }

  Future<List<Post>?> fetchUserPostList({required String userId}) async {
    try {
      Response response = await _dio
          .get('https://jsonplaceholder.typicode.com/users/$userId/posts');
      return (response.data as List)
          .map(
            (data) => Post.fromJson(data),
          )
          .toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }

  Future<List<Comment>?> fetchCommentList({required String postId}) async {
    try {
      Response response = await _dio
          .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');
      return (response.data as List)
          .map(
            (data) => Comment.fromJson(data),
          )
          .toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }
}
