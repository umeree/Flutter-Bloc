

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_event.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_state.dart';
import 'package:flutterbloc/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    on<CaptureImage>(captureImage);
    on<ImageFromGallery>(imageFromGallery);
  }
  void captureImage(CaptureImage event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.captureImage();
    emit(state.copyWith(file: file));
  }
  void imageFromGallery(ImageFromGallery event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.imageFromGallery();
    emit(state.copyWith(file: file));
  }
}