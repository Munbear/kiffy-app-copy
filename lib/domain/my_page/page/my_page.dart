import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/domain/my_page/widget/my_page_button.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';
import '../../profile/provider/add_profile_input_provider.dart';

class MyPage extends HookConsumerWidget {
  final innerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(90),
  );
  final gradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent, width: 2),
    borderRadius: BorderRadius.circular(90),
    gradient: const LinearGradient(colors: [Color(0xffBA00FF), Color(0xff0031AA)]),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = useState<UserProfileView?>(null);
    final myProfileImage = useState<MediaView?>(null);

    getApiAndSetState() async {
      final getProfile = await ref.read(myProfileProvider).getMyProfile();

      profile.value = getProfile;
      print(profile.value!.medias.first.url);
    }

    useEffect(() {
      getApiAndSetState();
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 14),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // 유저 프로필 사진
              if (profile.value != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 390,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: SizedBox.expand(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(profile.value!.medias.first.url, fit: BoxFit.cover),
                    ),
                  ),
                ),

              Container(
                padding: const EdgeInsets.only(left: 37, bottom: 27),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (profile.value != null)
                      Text(
                        profile.value!.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        if (profile.value != null)
                          Text(
                            profile.value!.birthDate,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        // const SizedBox(width: 16),
                        // Text(
                        //   profile.value.,
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w400,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                MyPageButton(
                  text: "Modify Profile",
                  iconPath: "assets/images/modify_x3.png",
                  routePathName: "resetProfile",
                ),
                const SizedBox(width: 22),
                MyPageButton(
                  text: "Setting",
                  iconPath: "assets/images/setting_x3.png",
                  routePathName: "setting",
                ),
              ],
            ),
          ),
          // const Spacer(),

          /// 커스텀 bottom banigation bar
          // CustomBottomNavigationBar(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
