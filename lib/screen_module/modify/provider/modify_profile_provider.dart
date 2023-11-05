import 'package:flutter_riverpod/flutter_riverpod.dart';

final modifyProfileProvider = Provider<ModifyProfileProviderHandler>(
    (ref) => ModifyProfileProviderHandler(ref));

class ModifyProfileProviderHandler {
  Ref ref;
  ModifyProfileProviderHandler(this.ref);
}
