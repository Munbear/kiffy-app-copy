import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileRelationSection extends ConsumerStatefulWidget {
  const AddOptionProfileRelationSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OptionProfileRelationSectionState();
}

class _OptionProfileRelationSectionState
    extends ConsumerState<AddOptionProfileRelationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "What kind of relationship are you looking for?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: [
            Chip(
              label: Text("A Serious love affair"),
            ),
            Chip(
              label: Text(
                "I'm looking for a serious relationship,\nbut it's okay to be casual",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Chip(
              label: Text("A Serious love affair"),
            ),
            Chip(
              label: Text("A Serious love affair"),
            ),
            Chip(
              label: Text("A Serious love affair"),
            ),
          ],
        ),
        Space(height: 16),
        Divider(),
      ],
    );
  }
}
