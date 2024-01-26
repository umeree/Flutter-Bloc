

import 'package:equatable/equatable.dart';
abstract class SwitchEvent extends Equatable{
  SwitchEvent();

  @override
  List<Object> get props => [];
}
class DisbleorEnableNotification extends SwitchEvent{}
class SliderEve extends SwitchEvent{
  double slider;
  SliderEve({required this.slider});

  @override
  List<Object> get props => [slider];
}