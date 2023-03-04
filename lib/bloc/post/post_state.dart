import 'package:equatable/equatable.dart';
import 'package:pathverse_app/models/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> postList;
  const PostLoaded(this.postList);
}

class PostError extends PostState {
  final String? message;
  const PostError(this.message);
}
