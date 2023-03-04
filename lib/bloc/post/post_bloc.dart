import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathverse_app/bloc/post/post_event.dart';
import 'package:pathverse_app/bloc/post/post_state.dart';
import 'package:pathverse_app/services/api_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetPostList>((event, emit) async {
      try {
        emit(PostLoading());
        final posts = await apiRepository.fetchPostList();
        if (posts != null) {
          emit(PostLoaded(posts));
        } else {
          emit(const PostError('Failed to fetch data.'));
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
