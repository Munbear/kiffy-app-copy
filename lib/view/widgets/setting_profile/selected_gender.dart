import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/gender_type.dart';

class SelectedGender extends ConsumerStatefulWidget {
  const SelectedGender({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectedGenderState();
}

class _SelectedGenderState extends ConsumerState<SelectedGender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: GenderType.values.map(
        (item) {
          return Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  null;
                },
                icon: item.gender,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
