import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputLoading extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const ProfileInputLoading({super.key, required this.onNext});

  @override
  ConsumerState<ProfileInputLoading> createState() =>
      _ProfileInputLoadingState();
}

class _ProfileInputLoadingState extends ConsumerState<ProfileInputLoading> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(profileInputValueProvider.notifier).save();
      await ref.read(myProvider.notifier).init();
      widget.onNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Color(0xff0031AA),
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}
