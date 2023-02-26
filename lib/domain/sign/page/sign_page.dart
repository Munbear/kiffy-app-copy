// import 'package:Kiffy/domain/sign/provider/auth_provider.dart';
// import 'package:Kiffy/infra/auth_client.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class SignPage extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.read(authProvider.notifier).autoAuth();

//     void onPressedListener(SignProvider provider) {
//       ref.read(authProvider.notifier).auth();
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           color: Colors.white,
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/kiffy_logo_purple.png", width: 150),
//               // 구글 아이콘
//               ElevatedButton.icon(
//                 onPressed: () => onPressedListener(SignProvider.GOOGLE),
//                 label: const Text("Continue with Google"),
//                 icon: Image.asset("assets/images/google_logo.png", width: 20),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   shadowColor: const Color(0x00000000),
//                   padding: const EdgeInsets.only(top: 11, bottom: 11, right: 50, left: 50),
//                   backgroundColor: Colors.white,
//                   foregroundColor: const Color(0xff494949),
//                   textStyle: const TextStyle(fontSize: 16),
//                   side: const BorderSide(
//                     color: Color(0xffDCDCDC),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
