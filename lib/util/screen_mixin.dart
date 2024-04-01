import 'package:Kiffy/screen_module/comment_section_module/section/comment_section.dart';
import 'package:Kiffy/screen_module/match/widget/feed_filter_contaienr.dart';
import 'package:Kiffy/screen_module/match/widget/matching_cancel_container.dart';
import 'package:flutter/material.dart';

mixin ScreenMixin<T extends StatefulWidget> on State<T> {
  // 댓글 바텀 시트
  Future<void> showCommentBottomSheet(String commentId) {
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
        return CommentSection(commentId: commentId);
      },
    );
  }

  //
  Future<void> showMatchingCancelBottomSheet() {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.15,
        minWidth: double.infinity,
      ),
      builder: (context) {
        return const MatchingCancelContainer();
      },
    );
  }

  Future<void> showFeedFilterBottomSheet() {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.25,
        minWidth: double.infinity,
      ),
      builder: (context) {
        return const FeedFilterContainer();
      },
    );
  }
}
