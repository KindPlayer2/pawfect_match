// Import necessary packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/authenticationScreen/registration_screen.dart';
import 'package:pawfect_match/widgets/custom_text_field_widget.dart';

// Define a StatefulWidget for the login screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Define the state for the LoginScreen widget
class _LoginScreenState extends State<LoginScreen> {
  // Define text editing controllers for the email and password fields
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  // Define a boolean to control the visibility of a progress bar
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget to provide a visual structure to the screen
    return Scaffold(
        body: Container(
      // Decorate the container with a linear gradient background
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
            1.2
          ], // Adjust these stops for the distribution of colors
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Add some space at the top
              const SizedBox(height: 120),
              // Display the logo image
              Image.asset(
                'images/logo.png',
                width: 180,
              ),
              // Display the app title
              const Text(
                "Pawfect Match",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // Add some space below the title
              const SizedBox(height: 40),
              // Display the login prompt
              const Text(
                "Login now to find your Fur-ever mate",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // Add some space below the prompt
              const SizedBox(height: 30),
              // Display the email input field
              CustomTextFieldWidget(
                editingController: emailTextEditingController,
                lableText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
              // Add some space below the email field
              const SizedBox(height: 15),
              // Display the password input field
              CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                lableText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
              // Add some space below the password field
              const SizedBox(height: 55),
              // Display the login button
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
                  onTap: () {
                    // Define the action to be taken when the login button is tapped
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Add some space below the login button
              const SizedBox(height: 15),
              // Display the registration prompt and button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to the registration screen when the registration button is tapped
                      Get.to(RegistraionScreen());
                    },
                    child: const Text(
                      "Create one here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 162, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Add some space below the registration button
              const SizedBox(height: 15),
              // Display a progress bar if showProgressBar is true
              if (showProgressBar)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                ),
              // Add some space at the bottom
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ));
  }
}
