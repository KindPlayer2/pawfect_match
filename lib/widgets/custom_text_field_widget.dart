import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? editingController;
  final IconData? iconData;
  final String? assetRef;
  final String? lableText;
  final bool? isObscure;

  CustomTextFieldWidget(
      {super.key,
      this.editingController,
      this.iconData,
      this.assetRef,
      this.lableText,
      this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
          labelText: lableText,
          prefixIcon: iconData != null
              ? Icon(iconData)
              : Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(assetRef.toString()),
                ),
          labelStyle: const TextStyle(
            fontSize: 18,
          ),
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
        obscureText: isObscure!,
      ),
    );
  }
}
