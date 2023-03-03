import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pathverse_app/bloc/comment/comment_event.dart';
import 'package:pathverse_app/bloc/comment/comment_state.dart';
import 'package:pathverse_app/services/api_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final String postId;
  CommentBloc({
    required this.postId,
  }) : super(CommentInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetCommentList>((event, emit) async {
      try {
        emit(CommentLoading());
        final comments = await apiRepository.fetchCommentList(postId: postId);
        if (comments != null) {
          emit(CommentLoaded(comments));
        } else {
          emit(const CommentError('Failed to fetch data.'));
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
