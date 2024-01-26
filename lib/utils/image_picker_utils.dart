import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  XFile? file;
  ImagePicker _imagePicker = ImagePicker();

 Future<XFile?> captureImage() async{
   final file = await _imagePicker.pickImage(source: ImageSource.camera);
   return file;
 }
  Future<XFile?> imageFromGallery() async{
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}