import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: SingleChildScrollView(

        child: Center(

          child: Column(

            children: [

              const SizedBox( 
                height: 120,
              ),
             
              Image.asset(
                'images/logo.png',
                width: 180,
              ),

              const Text(
                "Pawfect match",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 232, 91, 91)
                ),
              ),

              const SizedBox( 
                height: 30,
              ),

              const Text(
                "Login now to find your Fur-ever mate",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 232, 91, 91)
                ),
              ),

              const SizedBox( 
                height: 30,
              ),

              CustomTextFieldWidget(
                //Email
                editingController: emailTextEditingController,
                lableText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),

              const SizedBox( 
                height: 15,
              ),

              CustomTextFieldWidget(
                //Password
                editingController: passwordTextEditingController,
                lableText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
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
                    Radius.circular(12)
                  )
                  

                ),
                child: InkWell(

                  onTap: ()
                  {

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
                )
              ),

              const SizedBox( 
                height: 15,
              ),

              //Button to Register a new account 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                  
                    "Don't have an account yet? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.to(RegistraionScreen());
                    },
                    child: const Text(
                      "Create here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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
              showProgressBar == true ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ) : Container(),

              const SizedBox( 
                height: 15,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}