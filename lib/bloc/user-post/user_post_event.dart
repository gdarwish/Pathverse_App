import 'package:equatable/equatable.dart';

abstract class UserPostEvent extends Equatable {
  const UserPostEvent();

  @override
  List<Object> get props => [];
}

class GetUserPostList extends UserPostEvent {}
