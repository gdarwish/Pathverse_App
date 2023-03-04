import 'package:equatable/equatable.dart';
import 'package:pathverse_app/models/comment.dart';
import 'package:pathverse_app/models/post.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object?> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> commentList;
  const CommentLoaded(this.commentList);
}

class CommentError extends CommentState {
  final String? message;
  const CommentError(this.message);
}
