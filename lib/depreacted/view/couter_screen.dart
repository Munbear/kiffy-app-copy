import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterScreen extends HookConsumerWidget {
  static String get routeLocation => "/counter";

  static String get routeName => "counterscreen";

  void countUp(ValueNotifier<int> state) {
    state.value++;
  }

  void countDown(ValueNotifier<int> state) {
    state.value--;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);

    useEffect(() {
      count.value = 10;
      return null;
    }, const []);

    useValueChanged(count.value, (_, __) {
      print("curValue = ${count.value}");
      return count.value;
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => countUp(count), child: Text("업")),
            Text("${count.value}"),
            ElevatedButton(onPressed: () => countDown(count), child: Text("다운"))
          ],
        ),
      ),
    );
  }
}
