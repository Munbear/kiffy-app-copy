import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileSection extends ConsumerStatefulWidget {
  const AddOptionProfileSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOptionProfileSectionState();
}

class _AddOptionProfileSectionState
    extends ConsumerState<AddOptionProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 100,
          height: 200,
          color: Colors.red,
        )
      ],
    );
  }
}
