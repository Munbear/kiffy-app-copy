import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoTileSection extends ConsumerWidget {
  const UserInfoTileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    var my = ref.read(myProvider);
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              my.requireValue.profile!.medias.first.url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gab.width12,
        Text(
          my.requireValue.profile!.name,
          style: textStyle.titleSmall,
        )
      ],
    );
  }
}
