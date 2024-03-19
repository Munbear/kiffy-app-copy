import 'package:flutter/material.dart';

mixin ScreenMixin<T extends StatefulWidget> on State<T> {
  Future<void> showCommentBottomSheet() {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Container();
      },
    );
  }
}
