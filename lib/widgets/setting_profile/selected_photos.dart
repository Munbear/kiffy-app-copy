import 'package:flutter/material.dart';

import '../common/photo_wrap.dart';

class SelectedPhotos extends StatefulWidget {
  final bool isOpacity;

  const SelectedPhotos({super.key, required this.isOpacity});

  @override
  State<SelectedPhotos> createState() => _SelectedPhotosState();
}

class _SelectedPhotosState extends State<SelectedPhotos> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isOpacity,
      child: Wrap(
        children: [
          PhotoWrap(),
          PhotoWrap(),
          PhotoWrap(),
          PhotoWrap(),
          PhotoWrap(),
          PhotoWrap(),
        ],
      ),
    );
  }
}
