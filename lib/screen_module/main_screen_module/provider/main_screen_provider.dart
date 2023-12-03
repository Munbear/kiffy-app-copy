import 'package:Kiffy/constant/main_tab_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainScreenProvider =
    StateProvider<List<MainTabStatus>>((ref) => MainTabStatus.values);

final mainScreenProviderV2 = StateProvider<int>((ref) => 0);
