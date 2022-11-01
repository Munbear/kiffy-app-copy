import 'package:flutter/material.dart';

class AddBirthTextForm extends StatefulWidget {
  final String hinText;
  final String labelText;
  final bool isOpacity;

  const AddBirthTextForm({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isOpacity,
  });

  @override
  State<AddBirthTextForm> createState() => _AddBirthTextFormState();
}

class _AddBirthTextFormState extends State<AddBirthTextForm> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isOpacity,
      child: TextFormField(
        autofocus: false,
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.done,
        controller: nameTextEditingController,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: widget.hinText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
        ),
      ),
    );
  }
}
