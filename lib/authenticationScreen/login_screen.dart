import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/authenticationScreen/registration_screen.dart';
import 'package:pawfect_match/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red, // Start color
              Colors.pink, // Middle color
              Colors.white, // End color
            ],
            stops: [
              0.1,
              0.5,
              0.9
            ], // Adjust these stops for the distribution of colors
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Image.asset(
                'images/logo.png',
                width: 180,
              ),
              const Text(
                "Pawfect Match",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Login now to find your Fur-ever mate",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFieldWidget(
                editingController: emailTextEditingController,
                lableText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
              const SizedBox(height: 15),
              CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                lableText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
              const SizedBox(height: 15),
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
                    // Implement login logic
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
              const SizedBox(height: 15),
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
                      Get.to(RegistraionScreen());
                    },
                    child: const Text(
                      "Create here",
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
              if (showProgressBar)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
