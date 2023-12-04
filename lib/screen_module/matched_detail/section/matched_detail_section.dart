import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page.dart';
import 'package:Kiffy/screen_module/matched_detail/provider/match_manager_provider.dart';
import 'package:Kiffy/screen_module/matched_detail/widget/matched_detail_cancel_button.dart';
import 'package:Kiffy/screen_module/matched_detail/widget/matched_user_detail_info_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class MatchedDetailSection extends ConsumerStatefulWidget {
  final MatchedUserView matchedUser;

  const MatchedDetailSection({super.key, required this.matchedUser});

  @override
  ConsumerState<MatchedDetailSection> createState() =>
      _MatchedDetailSectionState();
}

class _MatchedDetailSectionState extends ConsumerState<MatchedDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child:
              UserProfileCardPage(userProfile: widget.matchedUser.userProfile),
        ),
        const SizedBox(height: 8),
        MatchedUserDetailInfoContainer(
          // contactInfo: widget.matchedUser.userProfile.contacts,
          lastCheck: widget.matchedUser.lastKnockedAt,
          emoji: widget.matchedUser.emojis,
        ),
        const Space(height: 8),
        MatchedDetailCancelButton(
          onPressed: () {
            ref
                .read(matchManagerProvider)
                .cancelMatch(widget.matchedUser.matchId);
            context.pop();
          },
        ),
        const Space(height: 20),
      ],
    );
  }
}
