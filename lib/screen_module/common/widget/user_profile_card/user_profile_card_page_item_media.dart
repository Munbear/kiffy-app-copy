import 'package:flutter/material.dart';

class UserProfileCardPageItemMedia extends StatelessWidget {
  final String profileImageUrl;

  const UserProfileCardPageItemMedia(
      {super.key, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        profileImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Text("Error");
        },
      ),
    );
  }
}
