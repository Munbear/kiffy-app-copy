import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class PhotoListSection extends ConsumerStatefulWidget {
  const PhotoListSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhotoListSectionState();
}

class _PhotoListSectionState extends ConsumerState<PhotoListSection> {
  List<MediaView> myImages = List.empty();
  @override
  void initState() {
    super.initState();
    //  BuiltList<MediaView>
    List<MediaView> myInfo = ref.read(myProvider).getProfile().medias.toList();
    setState(() {
      myImages = myInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myInfo = ref.read(myProvider).getProfile().medias;
    return SizedBox(
      height: 310,
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.8,
        crossAxisCount: 3,
        children: List.generate(
          6,
          (index) {
            final myImage = myImages.length > index ? myImages[index] : null;
            return InkWell(
              onTap: () {
                print("hello");
              },
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Container(
                height: 133,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: const Color(0xffCECECE),
                  ),
                ),
                // default UI
                child: myImage == null
                    ? const Center(
                        child: Icon(
                          Icons.add,
                          color: Color(0xffCECECE),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.network(
                          myImage.url,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
