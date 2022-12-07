import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBirthTextForm extends ConsumerStatefulWidget {
  final String hinText;
  final String labelText;
  final bool isShowed;

  const AddBirthTextForm({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isShowed,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddBirthTextFormState();
}

class _AddBirthTextFormState extends ConsumerState<AddBirthTextForm> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isShowed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Offstage(
        offstage: !widget.isShowed,
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 15),
          duration: const Duration(milliseconds: 200),
          height: widget.isShowed ? 50 : 0,
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
        ),
      ),
    );
  }
}
