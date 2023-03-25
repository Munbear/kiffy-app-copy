import 'package:Kiffy/domain/common/main_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileInputAuthCodePage extends HookConsumerWidget {
  const AddProfileInputAuthCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Enter your\nCode",
                style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Please enter 6 digits of the number sent by text.\nex. ",
                      style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    TextSpan(text: "245262", style: TextStyle(color: Color(0xff0031aa), fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(hintText: "six digits of a number"),
              ),
              const Spacer(),
              MainBlueButton(
                text: "Certification",
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
