import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroduceTextForm extends ConsumerStatefulWidget {
  final bool isOpacity;

  const IntroduceTextForm({super.key, required this.isOpacity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroduceTextFormState();
}

class _IntroduceTextFormState extends ConsumerState<IntroduceTextForm> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isOpacity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "자기소개서를 작성해주세요",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffbcbcbc)),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          maxLines: 10,
          maxLength: 300,
        ),
      ),
    );
  }
}
