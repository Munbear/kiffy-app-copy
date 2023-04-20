import 'package:Kiffy/model/paging_view/paging_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_user_profiles_view.freezed.dart';
part 'explore_user_profiles_view.g.dart';

@freezed
class ExploreUserProfilesView with _$ExploreUserProfilesView {
  factory ExploreUserProfilesView({
    required List<UserProfileView> list,
    required PagingView paging,
  }) = _ExploreUserProfilesView;

  factory ExploreUserProfilesView.fromJson(Map<String, dynamic> json) => _$ExploreUserProfilesViewFromJson(json);
}
