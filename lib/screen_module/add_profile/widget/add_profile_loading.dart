import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/add_profile_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileLoading extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const AddProfileLoading({super.key, required this.onNext});

  @override
  ConsumerState<AddProfileLoading> createState() => _ProfileInputLoadingState();
}

class _ProfileInputLoadingState extends ConsumerState<AddProfileLoading> {
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
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Color(0xff0031AA),
          strokeWidth: 3,
        ),
      ),
    );
  }
}
