import 'package:equatable/equatable.dart';
import 'package:pathverse_app/models/post.dart';

abstract class UserPostState extends Equatable {
  const UserPostState();

  @override
  List<Object?> get props => [];
}

class UserPostInitial extends UserPostState {}

class UserPostLoading extends UserPostState {}

class UserPostLoaded extends UserPostState {
  final List<Post> userPostList;
  const UserPostLoaded(this.userPostList);
}

class UserPostError extends UserPostState {
  final String? message;
  const UserPostError(this.message);
}
