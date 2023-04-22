import 'package:Kiffy/infra/wish_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileCard extends HookConsumerWidget {
  final UserProfileView userProfile;

  const UserProfileCard({
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageIndex = useState(0);


    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
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
              child: Image.network(
                userProfile.medias[imageIndex.value].url,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 25, bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/svg/online_state_circle.svg"),
                            const SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: userProfile.name,
                                    style: TextStyle(color: Colors.white, fontSize: 28),
                                  ),
                                  TextSpan(
                                    text: BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(userProfile.birthDate))
                                        .toString(),
                                    style: TextStyle(color: Colors.grey, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              color: Colors.transparent,
                            ),
                            onTap: () {
                              if (imageIndex.value > 0) {
                                imageIndex.value -= 1;
                              }

                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              color: Colors.transparent,
                            ),
                            onTap: () {
                              if (imageIndex.value < userProfile.medias.length - 1) {
                                imageIndex.value += 1;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.only(top: 13),
                        onPressed: () {
                          approveWish(userId: userProfile.id);
                        },
                        icon: Image.asset(
                          "assets/icons/heart_icon.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
