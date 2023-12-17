import 'package:Kiffy/constant/personality_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfilePersonality extends ConsumerStatefulWidget {
  const AddOptionProfilePersonality({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOptionProfilePersonalityState();
}

class _AddOptionProfilePersonalityState
    extends ConsumerState<AddOptionProfilePersonality> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "What kind of personality do you hear from others?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: Personality.values.map(
            (e) {
              return GestureDetector(
                onTap: () {
                  print(e.text);
                },
                child: Chip(
                  label: Text(e.text),
                ),
              );
            },
          ).toList(),
        ),
        const Space(height: 16),
        const Divider(),
      ],
    );
  }
}
