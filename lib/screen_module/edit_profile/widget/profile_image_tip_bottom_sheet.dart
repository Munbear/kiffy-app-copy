import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExampleProfileImageTipBottomSheet extends StatelessWidget {
  ExampleProfileImageTipBottomSheet({super.key});

  PageController controller = PageController(initialPage: 0);

  static List<String> items = [
    "assets/images/dummy_image.jpg",
    "assets/images/dummy_image.jpg",
    "assets/images/dummy_image.jpg",
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffcecece),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (page) {
                currentPage = page;
              },
              children: items
                  .map(
                    (item) => Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "This is an example of a popular photo.\nPlease refer to it!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 39),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              currentPage == 0
                                  ? const SizedBox(width: 50)
                                  : IconButton(
                                      onPressed: () {
                                        controller.previousPage(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeInOut);
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/arrow_prev.svg'),
                                    ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 178,
                                  height: 200,
                                ),
                              ),
                              currentPage == 2
                                  ? const SizedBox(width: 50)
                                  : IconButton(
                                      onPressed: () {
                                        // next button
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeInOut);
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/arrow_next.svg'),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(color: Color(0xff0031AA)),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0031AA),
                    fontWeight: FontWeight.w500,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
