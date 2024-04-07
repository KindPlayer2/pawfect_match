// Import necessary packages
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Define the AuthenticationController class
class AuthenticationController extends GetxController {
  // Create a static instance of AuthenticationController
  static AuthenticationController authController = Get.find();

  // Declare a reactive File variable to hold the picked image file
  late Rx<File?> pickedFile;

  // Getter to get the current value of pickedFile
  File? get profileImage => pickedFile.value;

  // Declare a variable to hold the image file picked from the gallery
  XFile? imageFile;

  // Method to pick an image file from the gallery
  pickImageFileFromGallery() async {
    // Pick the image file from the gallery
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    // Check if an image file was picked
    if (imageFile != null) {
      // Show a snack bar message indicating success
      Get.snackbar("Profile Image", "You have successfully picked an image");

      // Assign the picked image file to pickedFile
      pickedFile = Rx<File?>(File(imageFile!.path));
    }
  }
}
