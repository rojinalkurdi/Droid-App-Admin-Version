import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icons;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icons,
      required this.myController,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(labelText)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(icons),
          ),
        ),
      ),
    );
  }
}
