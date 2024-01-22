import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasLeading;
  final String? title;
  final List<Widget>? action;
  final double? elevation;

  const CustomAppBar({
    super.key,
    required this.hasLeading,
    this.title,
    this.action,
    this.elevation = 0,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: elevation,
      elevation: elevation,
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
          : Image.asset("assets/images/kiffy_logo_purple.png", width: 69),
      actions: action,
    );
  }
}
