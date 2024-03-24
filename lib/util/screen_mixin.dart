import 'package:Kiffy/screen_module/comment_section_module/comment_section.dart';
import 'package:flutter/material.dart';

mixin ScreenMixin<T extends StatefulWidget> on State<T> {
  Future<void> showCommentBottomSheet() {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minWidth: double.infinity,
      ),
      builder: (context) {
        return const CommentSection();
      },
    );
  }
}
