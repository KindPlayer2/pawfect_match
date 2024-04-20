import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawfect_match/authenticationScreen/login_screen.dart';
import 'package:pawfect_match/homeScreen/home_screen.dart';
import 'package:pawfect_match/models/person.dart' as personModel;

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<User?> firebaseCurrentUser;

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar("Profile Image", "You have successfully picked an image");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();

    return downloadUrlOfImage;
  }

  createNewUserAccount(
    File imageProfile,
    String name,
    String age,
    String email,
    String password,
    String phone,
    String city,
    String country,
    String genderPreference,
    String publishedDateTime,
    String height,
    String weight,
    String gender,
    String drink,
    String smoke,
    String children,
    String profession,
    String income,
    String living,
    String breed,
    String size,
    String nationality,
    String language,
    String education,
    String religion,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

      personModel.Person personInstance = personModel.Person(
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: urlOfDownloadedImage,
        name: name,
        age: int.parse(age),
        email: email,
        password: password,
        phone: phone,
        city: city,
        country: country,
        genderPreference: genderPreference,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
        height: height,
        weight: weight,
        gender: gender,
        drink: drink,
        smoke: smoke,
        children: children,
        profession: profession,
        income: income,
        living: living,
        breed: breed,
        size: size,
        nationality: nationality,
        language: language,
        education: education,
        religion: religion,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar("Account Creation Successfull", "Congrats");
      Get.to(HomeScreen());
    } catch (errorMsg) {
      Get.snackbar("Account Creation Failed", "Error Occured: $errorMsg");
    }
  }

  loginUser(String emailUser, String passwordUser) async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailUser, password: passwordUser);

      Get.snackbar("Loggin in Successful", "You have logged in successfully");
    }
    catch(errorMsg)
    {
      Get.snackbar("Login unsuccessful", "Error occurred: $errorMsg");
    }
  }

  checkIfUserIsLoggedIn(User? currentUser)
  {
    if(currentUser == null)
    {
      Get.to(LoginScreen());
    }
    else
    {
      Get.to(HomeScreen());
    }
  }

  @override
  void onReady(){
    //TODO: implement onReady
    super.onReady();

    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
  }
}
