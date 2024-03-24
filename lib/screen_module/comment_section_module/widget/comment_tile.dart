import 'package:flutter/material.dart';

import '../../../constant/style/gab.dart';

class CommentTile extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String text;
  final bool? isReply;

  const CommentTile({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.text,
    this.isReply = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReply ?? false) const SizedBox(width: 32),
          SizedBox(
            width: 32,
            height: 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
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
    );
  }
}
