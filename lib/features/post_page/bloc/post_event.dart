part of 'post_bloc.dart';

@immutable
sealed class PostEvent extends Equatable {}

final class FetchPostEvent extends PostEvent{
  final String id;
  FetchPostEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
