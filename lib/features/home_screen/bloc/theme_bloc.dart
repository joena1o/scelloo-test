import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeDark()) {
    on<ToggleTheme>((ToggleTheme event, Emitter<ThemeState> emit) {
      if (event.mode == 'l') {
        emit(ThemeLight());
      }else if(event.mode == 's') {
        emit(ThemeSystem());
      }
     else{
        emit(ThemeDark());
      }
    });
  }
}
