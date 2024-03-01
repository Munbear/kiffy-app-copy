import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/constant/enum/zodiac_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ZodiacList extends ConsumerStatefulWidget {
  final String title;
  final List<dynamic> itemList;
  final bool showDivider;
  final ZodiacTypeEnumView? initValue;

  const ZodiacList({
    super.key,
    required this.title,
    required this.itemList,
    required this.showDivider,
    this.initValue,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZodiacListState();
}

class _ZodiacListState extends ConsumerState<ZodiacList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initValue != null) {
        ref
            .read(selecteZodiac.notifier)
            .update((state) => state = Zodiac.enumViewToEnum(widget.initValue));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: widget.itemList.map(
            (e) {
              return Consumer(
                builder: (context, ref, child) {
                  final selectedZodiac = ref.watch(selecteZodiac);
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(selecteZodiac.notifier)
                          .update((state) => state = e);
                    },
                    child: CustomChip(
                      isChecked: selectedZodiac == e,
                      text: e.text,
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        if (widget.showDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const Divider(),
          ),
      ],
    );
  }
}



// class ZodiacList extends StatelessWidget {
//   final String title;
//   final List<dynamic> itemList;
//   final bool showDivider;
//   final ZodiacTypeEnumView? initValue;

//   const ZodiacList({
//     super.key,
//     required this.title,
//     required this.itemList,
//     required this.showDivider,
//     this.initValue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         const Space(height: 10),
//         Wrap(
//           direction: Axis.vertical,
//           children: itemList.map(
//             (e) {
//               return Consumer(
//                 builder: (context, ref, child) {
//                   final selectedZodiac = ref.watch(selecteZodiac);
//                   return GestureDetector(
//                     onTap: () {
//                       ref
//                           .read(selecteZodiac.notifier)
//                           .update((state) => state = e);
//                     },
//                     child: CustomChip(
//                       isChecked: selectedZodiac == e,
//                       text: e.text,
//                     ),
//                   );
//                 },
//               );
//             },
//           ).toList(),
//         ),
//         if (showDivider)
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 25),
//             child: const Divider(),
//           ),
//       ],
//     );
//   }
// }
