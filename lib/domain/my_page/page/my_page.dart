import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget {
  final innerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(90),
  );
  final gradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent, width: 2),
    borderRadius: BorderRadius.circular(90),
    gradient: const LinearGradient(colors: [Color(0xffBA00FF), Color(0xff0031AA)]),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("assets/images/kiffy_logo_purple.png", width: 50),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ShaderMask(
                          shaderCallback: (Rect bound) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent],
                              stops: [0.7, 1.5],
                            ).createShader(bound);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/example_for_dev.png"),
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(colors: [
                    //       Colors.white.withOpacity(0.5),
                    //       Colors.white,
                    //     ]),
                    //     borderRadius: BorderRadius.only(
                    //       bottomLeft: Radius.circular(12),
                    //       bottomRight: Radius.circular(12),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Spacer(),
              GlobalBottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
