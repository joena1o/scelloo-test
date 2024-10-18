part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingPostState extends HomeState{}

class HomeLoadedState extends HomeState {
  const HomeLoadedState({required this.posts});
  final List<PostModel>? posts;
  @override
  List<Object> get props => [posts!];
}

class HomeFailedState extends HomeState {
  const HomeFailedState({required this.errorMessage});
  final String errorMessage;
}