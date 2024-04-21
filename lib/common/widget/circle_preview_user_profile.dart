import 'package:flutter/material.dart';

class CirclePreviewUserProfile extends StatelessWidget {
  final VoidCallback onTap;
  final String profileUrl;
  final String userName;

  const CirclePreviewUserProfile({
    super.key,
    required this.onTap,
    required this.profileUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // 프로필 확인 했을 때
              // color: Colors.grey[300]!,
              // 프로필 확인 안했을 때
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffBA00ff),
                  Color(0xff0031AA),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profileUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 72,
          child: Text(
            userName,
            style: textStyle.titleSmall,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
