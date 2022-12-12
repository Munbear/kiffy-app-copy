import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'photo_card.dart';

class SelectedPhotos extends ConsumerStatefulWidget {
  const SelectedPhotos({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectedPhotosState();
}

class _SelectedPhotosState extends ConsumerState<SelectedPhotos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Wrap(
        children: [
          PhotoCard(),
          PhotoCard(),
          PhotoCard(),
          PhotoCard(),
          PhotoCard(),
          PhotoCard(),
        ],
      ),
    );
  }
}
