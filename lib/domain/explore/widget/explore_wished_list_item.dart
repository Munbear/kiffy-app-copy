import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreWishedListItem extends ConsumerStatefulWidget {
  final UserProfileView profile;
  const ExploreWishedListItem({super.key, required this.profile});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreWishedListItemState();
}

class _ExploreWishedListItemState extends ConsumerState<ExploreWishedListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1.9, 0.1),
                  colors: [
                    Color(0xffBA00FF),
                    Color(0xffB003FA),
                    Color(0xff960AEE),
                    Color(0xff6A15DB),
                    Color(0xff2F25BF),
                    Color(0xff0031AA),
                  ],
                ),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.profile.medias[0].url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(widget.profile.name),
        ],
      ),
    );
  }
}
