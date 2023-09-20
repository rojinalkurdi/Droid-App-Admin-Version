import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  final void Function()? onpressed;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const SearchTextFormField({super.key, this.onpressed, this.onChanged, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon:
              IconButton(onPressed: onpressed, icon: const Icon(Icons.search)),
          hintText: "Search",
          hintStyle: const TextStyle(fontSize: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.grey[300],
        ),
      ),
    );
  }
}
