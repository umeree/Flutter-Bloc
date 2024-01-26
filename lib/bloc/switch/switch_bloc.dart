
import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/switch/switch_event.dart';
import 'package:flutterbloc/bloc/switch/switch_state.dart';



class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<DisbleorEnableNotification>(_enableordisablenotification);
    on<SliderEve>(_slider);
  }
  void _enableordisablenotification(DisbleorEnableNotification events, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _slider(SliderEve event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}

