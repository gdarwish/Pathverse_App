import 'package:pathverse_app/models/post.dart';
import 'package:pathverse_app/services/api_service.dart';

class ApiRepository {
  final _provider = ApiService();

  Future<List<Post>?> fetchPostList() {
    return _provider.fetchPostList();
  }
}

class NetworkError extends Error {}
