import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_blog_app/core/config/get_it_setup.dart';
import 'package:scelloo_blog_app/features/post_page/data/model/comment_model.dart';
import 'package:scelloo_blog_app/features/post_page/data/repository/post_repository.dart';
import 'package:scelloo_blog_app/helper/exception_handler.dart';
import 'package:scelloo_blog_app/utils/dialog_services.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async{
      emit(PostLoading());
      try{
        final result = await postRepository.getAllPosts(event.id);
        emit(PostLoaded(comments: result));
      }catch(e){
        final message = handleExceptionWithMessage(e);
        emit(PostLoadFailed(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
