import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/theme/dark_theme.dart';
import 'package:myapp/core/theme/light_theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final LightTheme lightTheme;
  final DarkTheme darkTheme;

  ThemeBloc(this.lightTheme, this.darkTheme)
      : super(ThemeState(
    themeData: lightTheme.theme,
    isDark: false,
  )) {
    on<ToggleTheme>((event, emit) {
      if (state.isDark) {
        emit(ThemeState(
          themeData: lightTheme.theme,
          isDark: false,
        ));
      } else {
        emit(ThemeState(
          themeData: darkTheme.theme,
          isDark: true,
        ));
      }
    });
  }
}
