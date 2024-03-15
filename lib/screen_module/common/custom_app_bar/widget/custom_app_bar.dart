import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasLeading;
  final String? title;
  final List<Widget>? action;

  const CustomAppBar({
    super.key,
    required this.hasLeading,
    this.title,
    this.action,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 0,
      leading: hasLeading
          ? IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff0031AA),
              ),
            )
          : Image.asset("assets/images/kiffy_logo.png", width: 69),
      actions: action,
    );
  }
}
