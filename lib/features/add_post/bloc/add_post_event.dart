part of 'add_post_bloc.dart';

@immutable
sealed class AddPostEvent extends Equatable {}

class AddingPostEvent extends AddPostEvent{
  final String title;
  final String body;

  AddingPostEvent({required this.title, required this.body});
  @override
  // TODO: implement props
  List<Object?> get props => [title, body];
}