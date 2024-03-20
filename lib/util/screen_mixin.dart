import 'package:Kiffy/screen_module/comment_section.dart';
import 'package:flutter/material.dart';

mixin ScreenMixin<T extends StatefulWidget> on State<T> {
  Future<void> showCommentBottomSheet() {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      isScrollControlled: true,
      // constraints: BoxConstraints(
      //   maxHeight: MediaQuery.of(context).size.height * 0.8,
      //   maxWidth: double.infinity,
      // ),
      builder: (context) {
        return CommentSection();
      },
    );
  }
}
