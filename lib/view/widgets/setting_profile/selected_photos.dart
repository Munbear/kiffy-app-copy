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
    return AnimatedOpacity(
      opacity: widget.isOpacity ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 800),
      child: Offstage(
        offstage: !widget.isOpacity,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
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
      ),
    );
  }
}
