import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:pawfect_match/authenticationScreen/login_screen.dart";
import "package:pawfect_match/controllers/authentication_controller.dart";
import "package:pawfect_match/widgets/custom_text_field_widget.dart";

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({super.key});

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {
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

  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 209, 171, 125), // Top Color
                  Color.fromARGB(255, 189, 147, 104), // Middle Color
                  Color.fromARGB(255, 96, 68, 47), // Bottom Color
                ],
                stops: [
                  // Adjust these stops for the distribution of colors
                  0.1,
                  0.5,
                  0.9,
                ], // Adjust these stops for the distribution of colors
              ),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),

                    const Text(
                      "Create your account",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Tell us about yourself",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),

                    authenticationController.imageFile == null
                        ? const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage("images/avatar.png"),
                            backgroundColor: Colors.black,
                          )
                        :

                        //authenticationController.imageFile != null ?
                        Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: FileImage(
                                  File(
                                    authenticationController.imageFile!.path,
                                  ),
                                ),
                              ),
                            ),
                          ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await authenticationController
                                .pickImageFileFromGallery();

                            setState(() {
                              authenticationController.imageFile;
                            });
                          },
                          icon: Icon(Icons.add_a_photo),
                        )
                      ],
                    ),

                    const SizedBox(height: 30),

                    //name
                    CustomTextFieldWidget(
                      editingController: nameTextEditingController,
                      lableText: "Name",
                      iconData: Icons.abc,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),
                    // Age
                    CustomTextFieldWidget(
                      editingController: ageTextEditingController,
                      lableText: "Age",
                      iconData: Icons.numbers,
                      isObscure: false,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    // Email
                    CustomTextFieldWidget(
                      editingController: emailTextEditingController,
                      lableText: "Email",
                      iconData: Icons.email_outlined,
                      isObscure: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    // Password
                    CustomTextFieldWidget(
                      editingController: passwordTextEditingController,
                      lableText: "Password",
                      iconData: Icons.lock_outline,
                      isObscure: true,
                    ),
                    const SizedBox(height: 15),
                    // Phone
                    CustomTextFieldWidget(
                      editingController: phoneTextEditingController,
                      lableText: "Phone",
                      iconData: Icons.phone,
                      isObscure: false,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    // City
                    CustomTextFieldWidget(
                      editingController: cityTextEditingController,
                      lableText: "City",
                      iconData: Icons.location_city,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),
                    // Country
                    CustomTextFieldWidget(
                      editingController: countryTextEditingController,
                      lableText: "Country",
                      iconData: Icons.flag,
                      isObscure: false,
                    ),
                    //Gender
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Gender preference",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.favorite, color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        value: lookingForInaPartnerTextEditingController
                                .text.isEmpty
                            ? null
                            : lookingForInaPartnerTextEditingController.text,
                        onChanged: (String? newValue) {
                          lookingForInaPartnerTextEditingController.text =
                              newValue!;
                        },
                        items: <String>['Male', 'Female', 'Open to Any']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    //appearance

                    const Text(
                      "Appearance",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Height
                    CustomTextFieldWidget(
                      editingController: heightTextEditingController,
                      lableText: "Height (cm)",
                      iconData: Icons.insert_chart,
                      isObscure: false,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    const SizedBox(height: 15),
                    // Weight
                    CustomTextFieldWidget(
                      editingController: weightTextEditingController,
                      lableText: "Weight (kg)",
                      iconData: Icons.table_chart,
                      isObscure: false,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    const SizedBox(height: 15),
                    // Gender
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Gender",
                          prefixIcon: Icon(Icons.attribution_sharp,
                              color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        value: genderTextEditingController.text.isEmpty
                            ? null
                            : genderTextEditingController.text,
                        onChanged: (String? newValue) {
                          genderTextEditingController.text = newValue!;
                        },
                        items: <String>['Male', 'Female', 'Prefer not to say']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Lifestyle
                    const Text(
                      "Lifestyle: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Drink
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Do you drink?",
                          prefixIcon:
                              Icon(Icons.water_drop, color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        value: drinkTextEditingController.text.isEmpty
                            ? null
                            : drinkTextEditingController.text,
                        onChanged: (String? newValue) {
                          drinkTextEditingController.text = newValue!;
                        },
                        items: <String>['Yes', 'No', 'Occasionally']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Smoke
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Do you smoke?",
                          prefixIcon: Icon(Icons.smoking_rooms_rounded,
                              color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        value: smokeTextEditingController.text.isEmpty
                            ? null
                            : smokeTextEditingController.text,
                        onChanged: (String? newValue) {
                          smokeTextEditingController.text = newValue!;
                        },
                        items: <String>['Yes', 'No', 'Occasionally']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Has children
                    CustomTextFieldWidget(
                      editingController: hasChildrenTextEditingController,
                      lableText: "Do you have children?",
                      iconData: Icons.child_care,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),
                    // Profession
                    CustomTextFieldWidget(
                      editingController: professionTextEditingController,
                      lableText: "Profession",
                      iconData: Icons.badge,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),
                    // Income
                    CustomTextFieldWidget(
                      editingController: incomeTextEditingController,
                      lableText: "Income",
                      iconData: Icons.euro,
                      isObscure: false,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Living situation
                    CustomTextFieldWidget(
                      editingController: livingSituationTextEditingController,
                      lableText: "Living situation",
                      iconData: Icons.house,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),
                    // Dog breed
                    CustomTextFieldWidget(
                      editingController: favouriteBreedTextEditingController,
                      lableText: "Dog Breed",
                      iconData: Icons.pets,
                      isObscure: false,
                    ),
                    const SizedBox(height: 15),

                    //Size of dog
                    CustomTextFieldWidget(
                      editingController: sizeOfDogTextEditingController,
                      lableText: "How big is your dog?",
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
                          color: Color.fromARGB(255, 0, 0, 0),
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
                          if (authenticationController.imageFile != null) {
                            if (nameTextEditingController.text.trim().isNotEmpty &&
                                passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                emailTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                ageTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
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
                                passwordTextEditingController.text
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
                              setState(() {
                                showProgressBar = true;
                              });

                              await authenticationController
                                  .createNewUserAccount(
                                authenticationController.profileImage!,
                                nameTextEditingController.text.trim(),
                                ageTextEditingController.text.trim(),
                                emailTextEditingController.text.trim(),
                                passwordTextEditingController.text.trim(),
                                phoneTextEditingController.text.trim(),
                                cityTextEditingController.text.trim(),
                                countryTextEditingController.text.trim(),
                                lookingForInaPartnerTextEditingController.text
                                    .trim(),
                                heightTextEditingController.text.trim(),
                                weightTextEditingController.text.trim(),
                                genderTextEditingController.text.trim(),
                                drinkTextEditingController.text.trim(),
                                smokeTextEditingController.text.trim(),
                                professionTextEditingController.text.trim(),
                                hasChildrenTextEditingController.text.trim(),
                                incomeTextEditingController.text.trim(),
                                hasChildrenTextEditingController.text.trim(),
                                livingSituationTextEditingController.text
                                    .trim(),
                                favouriteBreedTextEditingController.text.trim(),
                                sizeOfDogTextEditingController.text.trim(),
                                nationalityTextEditingController.text.trim(),
                                languageSpokenTextEditingController.text.trim(),
                                educationTextEditingController.text.trim(),
                                religionextEditingController.text.trim(),
                              );

                              setState(() {
                                showProgressBar = false;
                                authenticationController.imageFile = null;
                              });
                            } else {
                              Get.snackbar("Field is empty",
                                  "Please fill out all fields");
                            }
                          } else {
                            Get.snackbar(
                                "Image File Missing", "Please pick an image");
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Create account",
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

                    //Button to Register a new account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: const Text(
                            "Login here",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 162, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Loading bar
                    showProgressBar == true
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.pink),
                          )
                        : Container(),

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )));
  }
}
