part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState{}

final class PostLoaded extends PostState{
  PostLoaded({required this.comments});
  final List<PostComment> comments;
}

final class PostLoadFailed extends PostState{
  PostLoadFailed({required this.errorMessage});
  final String errorMessage;
}
