//dieser Bloc ist aktuell nur für einen einzigen boolean ... 100% overkill aber juckt
import 'package:bkapp/logic/singleton.dart' as Singletons;
import 'dart:convert';
import 'package:bloc/bloc.dart';

//Events
abstract class BildungsuebersichtChangeState {}

class BildungsuebersichtToggleShowAgain extends BildungsuebersichtChangeState {}

//State
class BildungsuebersichtState {
  final bool dontShowAgain;

  const BildungsuebersichtState({this.dontShowAgain});

  factory BildungsuebersichtState.initial() => BildungsuebersichtState(dontShowAgain: false);

  BildungsuebersichtState.fromJson(Map<String, dynamic> json)
      : dontShowAgain = json['dontShowAgain'] ?? false;
  
  Map<String, dynamic> toJson() => {
        "dontShowAgain": dontShowAgain,
    };
}

//Bloc
class BildungsuebersichtBloc extends Bloc<BildungsuebersichtChangeState, BildungsuebersichtState> {
  @override
  BildungsuebersichtState get initialState {
    try {
      return BildungsuebersichtState.fromJson(json.decode(
          Singletons.SharedPreferenceProvider()
              .sharedPreferences
              .getString('splashScreenState')));
    } catch (e) {
      print(
          "Could not load Setting splashScreenState['dontShowAgain'] from sharedPreferences thats normal if no setting has been set. (\n" +
              e.toString()+
              "\n)");
      return BildungsuebersichtState.initial();
    }
  }

  @override
  Stream<BildungsuebersichtState> mapEventToState(
    BildungsuebersichtState currentState,
    BildungsuebersichtChangeState event,
  ) async* {
    if (event is BildungsuebersichtToggleShowAgain) {
      var splashState = BildungsuebersichtState(dontShowAgain: !currentState.dontShowAgain);
      Singletons.SharedPreferenceProvider()
          .sharedPreferences
          .setString('splashScreenState', json.encode(splashState.toJson()));
      yield splashState;
    }
  }
}
