import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:flutter/material.dart';

class UserProfileCardPageItemMedia extends StatelessWidget {
  final String profileImageUrl;

  const UserProfileCardPageItemMedia(
      {super.key, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        profileImageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          if (progress == null) {
            return child;
          }

          return const Skeleton();
        },
        errorBuilder: (context, error, stackTrace) {
          return const Text("Error");
        },
      ),
    );
  }
}
