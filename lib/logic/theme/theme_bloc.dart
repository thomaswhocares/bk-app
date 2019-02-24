import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';

import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState.initial();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ThemeChangeEvent event,
  ) async* {
    if (event is ChangeDarkTheme){
      yield ThemeState( themeData: ThemeState.dark().themeData );
    }else if(event is ChangeLightTheme){
      yield ThemeState( themeData: ThemeState.light().themeData);
    }
  }
}
