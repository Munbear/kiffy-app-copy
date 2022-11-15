import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/photo_wrap.dart';

class SelectedPhotos extends ConsumerStatefulWidget {
  final bool isOpacity;

  const SelectedPhotos({super.key, required this.isOpacity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectedPhotosState();
}

class _SelectedPhotosState extends ConsumerState<SelectedPhotos> {
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !widget.isOpacity,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: widget.isOpacity ? 320 : 0,
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
      ),
    );
  }
}
