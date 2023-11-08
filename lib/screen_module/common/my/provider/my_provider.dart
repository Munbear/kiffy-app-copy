import 'dart:async';

import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MyInfo {
  UserStatusView? status;
  UserProfileView? profile;

  MyInfo({this.status, this.profile});
}

final myProvider =
    AsyncNotifierProvider<MyProvider, MyInfo>(() => MyProvider());

class MyProvider extends AsyncNotifier<MyInfo> {
  // MyProvider의 MyInfo를 초기화(저장) 해놓는 로직, 다른 메소드를 호출하기 전에 항상 이 메소드가 한번이상 호출 되었어야함
  Future<void> init() async {
    var statusResponse =
        await ref.read(openApiProvider).getMyApi().apiUserV1MyStatusGet();

    if (statusResponse.statusCode != 200) {
      return;
    }

    if (statusResponse.data!.status != UserStatusEnumView.APPROVED) {
      state = AsyncData(MyInfo(status: statusResponse.data));
    }

    try {
      var profileResponse =
          await ref.read(openApiProvider).getMyApi().apiUserV1MyProfileGet();
      if (profileResponse.statusCode != 200) {
        return;
      }

      state = AsyncData(
          MyInfo(status: statusResponse.data, profile: profileResponse.data));
    } catch (e) {
      // ignore
    }
  }

  UserStatusView getStatus() {
    return state.requireValue.status!;
  }

  UserProfileView getProfile() {
    return state.requireValue.profile!;
  }

  @override
  Future<MyInfo> build() async {
    var statusResponse =
        await ref.read(openApiProvider).getMyApi().apiUserV1MyStatusGet();

    if (statusResponse.statusCode != 200) {
      return MyInfo();
    }

    try {
      var profileResponse =
          await ref.read(openApiProvider).getMyApi().apiUserV1MyProfileGet();

      return MyInfo(status: statusResponse.data, profile: profileResponse.data);
    } catch (e) {
      if (statusResponse.data!.status != UserStatusEnumView.APPROVED) {
        return MyInfo(status: statusResponse.data);
      }

      return MyInfo();
    }
  }
}
