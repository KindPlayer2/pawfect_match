import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? editingController;
  final IconData? iconData;
  final String? assetRef;
  final String? lableText;
  final bool? isObscure;
  final TextInputType keyboardType;

  CustomTextFieldWidget(
      {super.key,
      this.editingController,
      this.iconData,
      this.assetRef,
      this.lableText,
      this.isObscure,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
      child: TextField(
        controller: editingController,
        keyboardType: keyboardType,
        inputFormatters: (keyboardType == TextInputType.number)
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : (keyboardType == TextInputType.numberWithOptions(decimal: true))
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ]
                : <TextInputFormatter>[],
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
