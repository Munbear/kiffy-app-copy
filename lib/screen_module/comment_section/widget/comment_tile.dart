import 'package:Kiffy/screen_module/comment_section/section/comment_section.dart';
import 'package:flutter/material.dart';

import '../../../constant/style/gab.dart';

class CommentTile extends StatelessWidget {
  final VoidCallback onTap;
  final String profileImageUrl;
  final String userName;
  final String text;
  final CommentType commentType;

  const CommentTile(
      {super.key,
      required this.onTap,
      required this.profileImageUrl,
      required this.userName,
      required this.text,
      required this.commentType});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (commentType == CommentType.reply) Gab.width32,
            SizedBox(
              width: 32,
              height: 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gab.width8,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: textStyle.bodySmall!.copyWith(
                      color: const Color(0xFF191919),
                    ),
                  ),
                  Text(
                    text,
                    style: textStyle.bodyMedium!.copyWith(
                      color: const Color(0xFF495057),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
