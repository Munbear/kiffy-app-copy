import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/gender_type.dart';

class SelectedGender extends ConsumerStatefulWidget {
  final bool isShowed;

  const SelectedGender({super.key, required this.isShowed});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectedGenderState();
}

class _SelectedGenderState extends ConsumerState<SelectedGender> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isShowed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Offstage(
        offstage: !widget.isShowed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: widget.isShowed ? 50 : 0,
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: GenderType.values.map(
              (item) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: const Color(0xff0031AA), width: 1.5),
                  ),
                  child: Center(
                    child: Text(
                      item.gender,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
