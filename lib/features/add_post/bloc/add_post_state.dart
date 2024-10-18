part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState extends Equatable {}

final class AddPostInitial extends AddPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AddPostLoadingState extends AddPostState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostAddedState extends AddPostState {
  PostAddedState({required this.post});
  final PostModel post;
  @override
  List<Object> get props => [post];
}

class AddPostFailedState extends AddPostState {
  AddPostFailedState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
