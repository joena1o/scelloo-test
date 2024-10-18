import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_blog_app/core/config/get_it_setup.dart';
import 'package:scelloo_blog_app/features/home_screen/data/models/post_model.dart';
import 'package:scelloo_blog_app/features/home_screen/data/repository/home_repository.dart';
import 'package:scelloo_blog_app/helper/exception_handler.dart';
import 'package:scelloo_blog_app/utils/dialog_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomePost>((event, emit) async {
      emit(HomeLoadingPostState());
      try{
        final result = await homeRepository.getAllPosts();
        emit(HomeLoadedState(posts: result));
      }catch(e){
        final message = handleExceptionWithMessage(e);
        emit(HomeFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
