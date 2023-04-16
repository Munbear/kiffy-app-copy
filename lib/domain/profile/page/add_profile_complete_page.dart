import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileCompletePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/kiffy_logo_purple.png", width: 69),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // profile preview circle
                    Center(
                      child: Container(
                        width: 172,
                        height: 172,
                        decoration: BorderGradientCircleShape.outlineGradientBoxDecoration,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BorderGradientCircleShape.innerDecoration,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100), child: Image.asset("assets/images/example_for_dev.png", fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    const Text(
                      "Build your Profile",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF0031AA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Meet various people through the kiffy!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF494949),
                      ),
                    ),
                  ],
                ),
              ),
              // start button
              ElevatedButton(
                onPressed: () {
                  print(ref.watch(addProfileInputProvider.notifier).state);
                  // ref.read(addUserProfileInfoProvider);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  backgroundColor: const Color(0xFF0031AA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Start KIFFY !"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
