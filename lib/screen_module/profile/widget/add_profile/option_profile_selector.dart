import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';

class OptionProfileSelector extends StatelessWidget {
  final String title;
  final List<dynamic> itemList;
  final VoidCallback onTap;
  final bool showDivider;

  const OptionProfileSelector({
    super.key,
    required this.title,
    required this.itemList,
    required this.onTap,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: itemList.map(
            (e) {
              return GestureDetector(
                onTap: () => onTap(),
                child: Chip(
                  label: Text(e.text),
                ),
              );
            },
          ).toList(),
        ),
        if (showDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const Divider(),
          ),
      ],
    );
  }
}
