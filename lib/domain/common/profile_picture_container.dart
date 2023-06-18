import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePictureContainer extends ConsumerStatefulWidget {
  final List<MediaView> userProfilePictures;
  final PageController pageController;
  final double height;

  const ProfilePictureContainer({super.key, required this.userProfilePictures, required this.pageController, required this.height});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePictureContainerState();
}

class _ProfilePictureContainerState extends ConsumerState<ProfilePictureContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 5),
            blurRadius: 4,
            spreadRadius: 3,
          ),
        ],
      ),
      child: PageView(
        controller: widget.pageController,
        onPageChanged: (int page) => ref.read(currentPictureIndex.notifier).update((state) => state = page),
        children: widget.userProfilePictures.map(
          (foto) {
            return Image.network(
              foto.url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print(error);
                return const SizedBox();
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
