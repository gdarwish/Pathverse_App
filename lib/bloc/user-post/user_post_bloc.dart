import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pathverse_app/bloc/post/post_event.dart';
import 'package:pathverse_app/bloc/user-post/user_post_event.dart';
import 'package:pathverse_app/bloc/user-post/user_post_state.dart';
import 'package:pathverse_app/services/api_repository.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostState> {
  final String userId;

  UserPostBloc({
    required this.userId,
  }) : super(UserPostInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetUserPostList>((event, emit) async {
      try {
        emit(UserPostLoading());
        final userPosts = await apiRepository.fetchUserPostList(userId: userId);
        if (userPosts != null) {
          emit(UserPostLoaded(userPosts));
        } else {
          emit(const UserPostError('Failed to fetch data.'));
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
