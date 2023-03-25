import 'package:Kiffy/domain/common/main_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfilePhoneNumberPage extends HookConsumerWidget {
  const AddProfilePhoneNumberPage({super.key});

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
                "What’s your\nnumber?",
                style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                "This is a procedure to prevent identity verification and duplicate subscriptions.",
                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: "+62",
                      decoration: const InputDecoration(hintText: "+62"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(flex: 8, child: TextFormField()),
                  MainBlueButton(
                    text: "Next",
                    onClick: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
