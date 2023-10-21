import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MyInfo {
  UserStatusView? status;
  UserProfileView? profile;

  MyInfo({this.status, this.profile});
}

final myProvider = Provider((ref) => MyProvider(ref: ref));

class MyProvider {
  Ref ref;
  MyInfo? info;

  MyProvider({required this.ref});

  Future<void> init() async {
    var statusResponse = await ref.read(openApiProvider).getMyApi().apiUserV1MyStatusGet();

    if (statusResponse.statusCode != 200) {
      return;
    }

    if (statusResponse.data!.status != UserStatusEnumView.APPROVED) {
      info = MyInfo(status: statusResponse.data);
      return;
    }


    var profileResponse = await ref.read(openApiProvider).getMyApi().apiUserV1MyProfileGet();
    if (profileResponse.statusCode != 200) {
      return;
    }

    info = MyInfo(status: statusResponse.data, profile: profileResponse.data);
  }

  UserStatusView getStatus() {
    return info!.status!;
  }

  UserProfileView getProfile() {
    return info!.profile!;
  }
}