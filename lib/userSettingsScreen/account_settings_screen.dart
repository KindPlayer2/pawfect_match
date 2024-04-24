import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawfect_match/controllers/authentication_controller.dart';
import 'package:pawfect_match/global.dart';
import 'package:pawfect_match/homeScreen/home_screen.dart';
import 'package:pawfect_match/widgets/custom_text_field_widget.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlsList = [];
  double val = 0;

  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController =
      TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController =
      TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController hasChildrenTextEditingController =
      TextEditingController();
  TextEditingController professionTextEditingController =
      TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController =
      TextEditingController();
  TextEditingController hasDogTextEditingController = TextEditingController();
  TextEditingController favouriteBreedTextEditingController =
      TextEditingController();
  TextEditingController sizeOfDogTextEditingController =
      TextEditingController();

  //background
  TextEditingController nationalityTextEditingController =
      TextEditingController();
  TextEditingController languageSpokenTextEditingController =
      TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController religionextEditingController = TextEditingController();

  //personal info
  String name = ' ';
  String age = ' ';
  String phone = ' ';
  String city = ' ';
  String country = ' ';
  String genderPrefernce = ' ';

  //Appearance
  String height = ' ';
  String weight = ' ';
  String gender = ' ';

  //Life style
  String drink = ' ';
  String smoke = ' ';
  String children = ' ';
  String profession = ' ';
  String income = ' ';
  String living = ' ';
  String hasDog = ' ';
  String breed = ' ';
  String size = ' ';

  //bckground
  String nationality = ' ';
  String language = ' ';
  String education = ' ';
  String religion = ' ';

  chooseImage() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image.add(File(PickedFile!.path));
    });
  }

  uploadImages() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });

      var refImages = FirebaseStorage.instance.ref().child(
          "images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

      await refImages.putFile(img).whenComplete(() async {
        await refImages.getDownloadURL().then((urlImage) {
          urlsList.add(urlImage);

          i++;
        });
      });
    }
  }

  retrieveUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          //personal info
          name = snapshot.data()!["name"];
          nameTextEditingController.text = name;
          age = snapshot.data()!["age"].toString();
          ageTextEditingController.text = age;
          phone = snapshot.data()!["phone"];
          phoneTextEditingController.text = phone;
          city = snapshot.data()!["city"];
          cityTextEditingController.text = city;
          country = snapshot.data()!["country"];
          countryTextEditingController.text = country;
          genderPrefernce = snapshot.data()!["genderPrefernce"];
          genderTextEditingController.text = genderPrefernce;

          //Appearance
          height = snapshot.data()!["height"];
          heightTextEditingController.text = height;
          weight = snapshot.data()!["weight"];
          weightTextEditingController.text = weight;
          gender = snapshot.data()!["gender"];
          genderTextEditingController.text = gender;

          //Life style
          drink = snapshot.data()!["drink"];
          drinkTextEditingController.text = drink;
          smoke = snapshot.data()!["smoke"];
          smokeTextEditingController.text = smoke;
          children = snapshot.data()!["children"];
          hasChildrenTextEditingController.text = children;
          profession = snapshot.data()!["profession"];
          professionTextEditingController.text = profession;
          income = snapshot.data()!["income"];
          incomeTextEditingController.text = income;
          living = snapshot.data()!["living"];
          livingSituationTextEditingController.text = living;
          breed = snapshot.data()!["breed"];
          favouriteBreedTextEditingController.text = breed;
          size = snapshot.data()!["size"];
          sizeOfDogTextEditingController.text = size;

          //bckground
          nationality = snapshot.data()!["nationality"];
          nationalityTextEditingController.text = nationality;
          language = snapshot.data()!["language"];
          languageSpokenTextEditingController.text = language;
          education = snapshot.data()!["education"];
          educationTextEditingController.text = education;
          religion = snapshot.data()!["religion"];
          religionextEditingController.text = religion;
        });
      }
    });
  }

  updateUserDataToFirestoreDatabase(
    String name,
    String age,
    String phone,
    String city,
    String country,
    String genderPreference,
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
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
            content: SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text("Uploading images please wait ...")
              ],
            ),
          ),
        ));
      },
    );

    await uploadImages();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .update({
      'name': name,
      'age': int.parse(age),
      'phone': phone,
      'city': city,
      'country': country,
      'genderPrefernce': genderPrefernce,
      'height': height,
      'weight': weight,
      'gender': gender,
      'drink': drink,
      'smoke': smoke,
      'children': children,
      'profession': profession,
      'income': income,
      'living': living,
      'breed': breed,
      'size': size,
      'nationality': nationality,
      'language': language,
      'education': education,
      'religion': religion,
      'urlImage1': urlsList[0].toString(),
      'urlImage2': urlsList[1].toString(),
      'urlImage3': urlsList[2].toString(),
      'urlImage4': urlsList[3].toString(),
      'urlImage5': urlsList[4].toString(),
    });

    Get.snackbar(
        "Updated details", "your account has been updated successfully");

    Get.to(HomeScreen());

    setState(() {
      uploading = false;
      _image.clear();
      urlsList.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "Choose 5 Images",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          next
              ? Container()
              : IconButton(
                  onPressed: () {
                    if (_image.length == 5) {
                      setState(() {
                        uploading = true;
                        next = true;
                      });
                    } else {
                      Get.snackbar("5 images", "please choose five images");
                    }
                  },
                  icon: Icon(
                    Icons.navigate_next_outlined,
                    size: 36,
                  ),
                ),
        ],
      ),
      body: next
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),

                    //name
                    CustomTextFieldWidget(
                      //name
                      editingController: nameTextEditingController,
                      lableText: "Name",
                      iconData: Icons.abc,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //age
                    CustomTextFieldWidget(
                      //age
                      editingController: ageTextEditingController,
                      lableText: "Age",
                      iconData: Icons.numbers,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Phone
                    CustomTextFieldWidget(
                      //Phone
                      editingController: phoneTextEditingController,
                      lableText: "Phone",
                      iconData: Icons.phone,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //city
                    CustomTextFieldWidget(
                      //city
                      editingController: cityTextEditingController,
                      lableText: "City",
                      iconData: Icons.location_city,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Country
                    CustomTextFieldWidget(
                      //Country
                      editingController: countryTextEditingController,
                      lableText: "Country",
                      iconData: Icons.flag,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Gender preference
                    CustomTextFieldWidget(
                      //gender preference
                      editingController:
                          lookingForInaPartnerTextEditingController,
                      lableText: "Gender preference",
                      iconData: Icons.favorite,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //appearance

                    const Text(
                      "Appearance",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),

                    //height
                    CustomTextFieldWidget(
                      //height
                      editingController: heightTextEditingController,
                      lableText: "height",
                      iconData: Icons.insert_chart,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //weight
                    CustomTextFieldWidget(
                      //weight
                      editingController: weightTextEditingController,
                      lableText: "weight",
                      iconData: Icons.table_chart,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Gender
                    CustomTextFieldWidget(
                      //Gender
                      editingController: genderTextEditingController,
                      lableText: "Gender",
                      iconData: Icons.attribution_sharp,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //lifestyle

                    const Text(
                      "Lifestyle: ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),

                    //drink
                    CustomTextFieldWidget(
                      //drink
                      editingController: drinkTextEditingController,
                      lableText: "Do you drink?",
                      iconData: Icons.water_drop,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //smoke
                    CustomTextFieldWidget(
                      //smoke
                      editingController: smokeTextEditingController,
                      lableText: "Do you smoke?",
                      iconData: Icons.smoking_rooms_rounded,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //has children
                    CustomTextFieldWidget(
                      //has children
                      editingController: hasChildrenTextEditingController,
                      lableText: "Do you have children?",
                      iconData: Icons.child_care,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //profession
                    CustomTextFieldWidget(
                      //Profession
                      editingController: professionTextEditingController,
                      lableText: "Profession",
                      iconData: Icons.badge,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //income
                    CustomTextFieldWidget(
                      //income
                      editingController: incomeTextEditingController,
                      lableText: "Income",
                      iconData: Icons.euro,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //living situation
                    CustomTextFieldWidget(
                      //living situation
                      editingController: livingSituationTextEditingController,
                      lableText: "Living situation",
                      iconData: Icons.house,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //dog breed
                    CustomTextFieldWidget(
                      //dog breed
                      editingController: favouriteBreedTextEditingController,
                      lableText: "Dog Breed",
                      iconData: Icons.pets,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //size of dog
                    CustomTextFieldWidget(
                      //soze of sog
                      editingController: sizeOfDogTextEditingController,
                      lableText: "Size of Dog",
                      iconData: Icons.height,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //background

                    const Text(
                      "Background:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),

                    //nationality
                    CustomTextFieldWidget(
                      //nationality
                      editingController: nationalityTextEditingController,
                      lableText: "Nationality",
                      iconData: Icons.flag,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Language spoken
                    CustomTextFieldWidget(
                      //Language spoken
                      editingController: languageSpokenTextEditingController,
                      lableText: "Language Spoken",
                      iconData: Icons.abc,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Education
                    CustomTextFieldWidget(
                      //Education
                      editingController: educationTextEditingController,
                      lableText: "Education",
                      iconData: Icons.grade,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Religion
                    CustomTextFieldWidget(
                      //Religion
                      editingController: religionextEditingController,
                      lableText: "Religion",
                      iconData: Icons.church,
                      isObscure: false,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // Add padding here
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width - 36,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (nameTextEditingController.text.trim().isNotEmpty &&
                              ageTextEditingController.text.trim().isNotEmpty &&
                              phoneTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              cityTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              countryTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              lookingForInaPartnerTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              heightTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              weightTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              genderTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              drinkTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              smokeTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              hasChildrenTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              professionTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              incomeTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              livingSituationTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              favouriteBreedTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              sizeOfDogTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              nationalityTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              languageSpokenTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              educationTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              religionextEditingController.text
                                  .trim()
                                  .isNotEmpty) {
                            _image.length > 0
                                ? await updateUserDataToFirestoreDatabase(
                                    nameTextEditingController.text.trim(),
                                    ageTextEditingController.text.trim(),
                                    phoneTextEditingController.text.trim(),
                                    cityTextEditingController.text.trim(),
                                    countryTextEditingController.text.trim(),
                                    lookingForInaPartnerTextEditingController
                                        .text
                                        .trim(),
                                    heightTextEditingController.text.trim(),
                                    weightTextEditingController.text.trim(),
                                    genderTextEditingController.text.trim(),
                                    drinkTextEditingController.text.trim(),
                                    smokeTextEditingController.text.trim(),
                                    professionTextEditingController.text.trim(),
                                    hasChildrenTextEditingController.text
                                        .trim(),
                                    incomeTextEditingController.text.trim(),
                                    livingSituationTextEditingController.text
                                        .trim(),
                                    favouriteBreedTextEditingController.text
                                        .trim(),
                                    sizeOfDogTextEditingController.text.trim(),
                                    nationalityTextEditingController.text
                                        .trim(),
                                    languageSpokenTextEditingController.text
                                        .trim(),
                                    educationTextEditingController.text.trim(),
                                    religionextEditingController.text.trim())
                                : null;
                          } else {
                            Get.snackbar("A field is empty",
                                "Please fill in all the text fields");
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Update Account",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: GridView.builder(
                    itemCount: _image.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Container(
                              color: Colors.white30,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    if (_image.length < 6) {
                                      !uploading ? chooseImage() : null;
                                    } else {
                                      setState(() {
                                        uploading == true;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    _image[index - 1],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
