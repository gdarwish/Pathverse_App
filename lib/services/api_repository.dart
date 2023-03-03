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
}

class NetworkError extends Error {}
