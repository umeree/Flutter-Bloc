import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_event.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_state.dart';

class ImagePickerScren extends StatefulWidget {
  const ImagePickerScren({super.key});

  @override
  State<ImagePickerScren> createState() => _ImagePickerScrenState();
}

class _ImagePickerScrenState extends State<ImagePickerScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
      ),
      body:Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              if(state.file == null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        return context.read<ImagePickerBloc>().add(CaptureImage());
                      },
                      child: const CircleAvatar(child: Icon(Icons.camera)
                      ),
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: () {
                        return context.read<ImagePickerBloc>().add(ImageFromGallery());
                      },
                      child: Text("Pick from gallery"),
                    ),
                  ],
                );
          }
              else {
               return CircleAvatar(
                 radius: 100,
                 child: Image.file(File(state.file!.path.toString())),);
              }
        }),
      )
    );
  }
}
