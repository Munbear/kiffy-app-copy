import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/test_provider.dart';

// 변경 : provider 용 statefulWidget 변경
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${ref.watch(counterProvider)}"),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push('/sign'),
              child: Text('Next screen'),
            ),
          ),
          Center(
            child: Text("title".tr()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}


// 기존 StatefulWidget 
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<StatefulWidget> createState() => _HomeScreeState();
// }

// class _HomeScreeState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text("Hello")),
//           Center(
//             child: ElevatedButton(
//               onPressed: () => context.go("/sign"),
//               child: Text("To Sign"),
//             ),
//           ),
//           Center(
//             child: Text('number'),
//           ),
//           SizedBox(height: 10),
//           Center(
//             child: IconButton(
//               onPressed: () {
//                 ref.read(counterProvider.notifier).increment();
//               },
//               icon: Icon(Icons.add),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
