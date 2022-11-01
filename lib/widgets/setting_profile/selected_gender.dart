import 'package:flutter/material.dart';

import '../../enums/gender_type.dart';

class SelectedGender extends StatefulWidget {
  const SelectedGender({super.key});

  @override
  State<SelectedGender> createState() => _SelectedGenderState();
}

class _SelectedGenderState extends State<SelectedGender> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
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
                    onPressed: () {},
                    icon: item.gender,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
