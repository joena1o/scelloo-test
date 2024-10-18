import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_blog_app/core/config/get_it_setup.dart';
import 'package:scelloo_blog_app/features/home_screen/data/models/post_model.dart';
import 'package:scelloo_blog_app/features/home_screen/data/repository/home_repository.dart';
import 'package:scelloo_blog_app/helper/exception_handler.dart';
import 'package:scelloo_blog_app/utils/dialog_services.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  final HomeRepository homeRepository;
  AddPostBloc({required this.homeRepository}) : super(AddPostInitial()) {
    on<AddingPostEvent>((event, emit) async {
      emit(AddPostLoadingState());
      try{
        final result = await homeRepository.addPost({
          "title": event.title,
          "body": event.body
        });
        emit(PostAddedState(post: result));
        getIt<DialogServices>().showMessage("Post was uploaded successfully");
      }catch(e){
        final message = handleExceptionWithMessage(e);
        emit(AddPostFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
