import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/authenticationScreen/login_screen.dart';
import 'package:pawfect_match/controllers/authentication_controller.dart';
import 'package:pawfect_match/widgets/custom_text_field_widget.dart';

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({super.key});

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {
  String selectedSize = '';

  // Personal info
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

  // Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();

  // Life style
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

  // Background
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
              Colors.red, // Start color
              Colors.pink, // Middle color
              Colors.purple, // End color
            ],
            stops: [
              0.1,
              0.5,
              1.2,
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
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Start your journey here",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                authenticationController.imageFile == null
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("images/avatar.png"),
                        backgroundColor: Colors.black,
                      )
                    : Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 255, 255, 255),
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
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Name
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
                  isObscure: true,
                ),
                const SizedBox(height: 15),
                // Country
                CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  lableText: "Country",
                  iconData: Icons.flag,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Gender preference",
                      prefixIcon: Icon(Icons.favorite),
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
                    value:
                        lookingForInaPartnerTextEditingController.text.isEmpty
                            ? null
                            : lookingForInaPartnerTextEditingController.text,
                    onChanged: (String? newValue) {
                      lookingForInaPartnerTextEditingController.text =
                          newValue!;
                    },
                    items: <String>['Male', 'Female', 'Prefer not to say']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 15),
                // Appearance
                const Text(
                  "Appearance",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 15),
                // Weight
                CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  lableText: "Weight (kg)",
                  iconData: Icons.table_chart,
                  isObscure: false,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 15),
                // Gender
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Gender",
                      prefixIcon: Icon(Icons.attribution_sharp),
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
                        child: Text(value),
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
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Drink
                CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  lableText: "Do you drink?",
                  iconData: Icons.water_drop,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                // Smoke
                CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  lableText: "Do you smoke?",
                  iconData: Icons.smoking_rooms_rounded,
                  isObscure: false,
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
                // Size of dog
                Column(
                  children: [
                    Text(
                      "How big is your dog?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSize = 'S';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedSize == 'S'
                                ? Colors.green
                                : Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'S',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSize = 'M';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedSize == 'M'
                                ? Colors.green
                                : Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'M',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSize = 'L';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedSize == 'L'
                                ? Colors.green
                                : Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'L',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Background
                const Text(
                  "Background:",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Nationality
                CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  lableText: "Nationality",
                  iconData: Icons.flag,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                // Language spoken
                CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  lableText: "Language Spoken",
                  iconData: Icons.abc,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                // Education
                CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  lableText: "Education",
                  iconData: Icons.grade,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                // Religion
                CustomTextFieldWidget(
                  editingController: religionextEditingController,
                  lableText: "Religion",
                  iconData: Icons.church,
                  isObscure: false,
                ),
                const SizedBox(height: 15),
                // Button to Register a new account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 255, 255, 255),
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
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Loading bar
                showProgressBar == true
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      )
                    : Container(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
