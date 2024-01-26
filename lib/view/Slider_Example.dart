import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/switch/switch_bloc.dart';
import 'package:flutterbloc/bloc/switch/switch_state.dart';

import '../bloc/switch/switch_event.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch, onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                            DisbleorEnableNotification());
                      });
                    }),
              ],
            ),
            SizedBox(height: 20,),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  width: 300,
                  height: 300,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(height: 20,),
            BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Slider(value: state.slider, onChanged: (value) {
                    print(value);
                    context.read<SwitchBloc>().add(SliderEve(slider: value));
                  });
                })
          ],
        ),
      ),
    );
  }
}
