import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// riverpod 용 StatefulWidget 으로 변경
class SignScreen extends ConsumerStatefulWidget {
  const SignScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignScreenState();
}

class _SignScreenState extends ConsumerState<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Hello"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push("/"),
              child: Text("To Home"),
            ),
          )
        ],
      ),
    );
  }
}

// class SignScreen extends StatefulWidget {
//   @override
//   State createState() => _SignScreenState();
// }

// class _SignScreenState extends State<SignScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Text("Hello"),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () => context.go("/"),
//               child: Text("To Home"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
