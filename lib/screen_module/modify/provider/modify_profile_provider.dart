import 'package:Kiffy/constant/contact_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final modifyProfileProvider = Provider<ModifyProfileProviderHandler>(
    (ref) => ModifyProfileProviderHandler(ref));

class ModifyProfileProviderHandler {
  Ref ref;
  ModifyProfileProviderHandler(this.ref);
}

final editUserMediaProfile = StateProvider<List<MediaView>>((ref) => []);
final editUserIntroProfile = StateProvider<String>((ref) => "");
final editUserContactTypeProfile = StateProvider<ContactType?>((ref) => null);
final editUserContactIdProfile = StateProvider<String?>((ref) => null);
final imageLoading = StateProvider.autoDispose<bool>((ref) => false);
