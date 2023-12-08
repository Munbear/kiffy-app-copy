import 'package:Kiffy/screen_module/common/input/style/kiffy_input_style.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class KiffyImageField extends StatelessWidget {
  final ValueChanged<String> onAdded;
  final VoidCallback onDeleted;
  String? url;

  KiffyImageField({
    super.key,
    required this.onAdded,
    required this.onDeleted,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 93,
        height: 133,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(0),
        decoration: KiffyInputStyle.boxDecorationRounded(
          isBordered: url == null,
        ),
        child: url != null
            ? KiffyImageFieldFilled(
                onDeleted: onDeleted,
                url: url!,
              )
            : KiffyImageFieldEmpty(onAdded: (path) => onAdded(path)));
  }
}

class KiffyImageFieldLoading extends StatelessWidget {
  const KiffyImageFieldLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 133,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(0),
      decoration: KiffyInputStyle.boxDecorationRounded(isBordered: true),
      child: Center(
        child: SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            color: Color(0xff0031AA),
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}

class KiffyImageFieldEmpty extends StatelessWidget {
  final ValueChanged<String> onAdded;

  const KiffyImageFieldEmpty({
    super.key,
    required this.onAdded,
  });

  Future<void> addImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      var bytes = await file.readAsBytes();
      final resizeCommand = img.Command()
        ..decodeImage(bytes)
        ..copyResize(width: 780)
        ..writeToFile(file.path);

      await resizeCommand.execute();

      onAdded(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            addImage();
          },
          child: const Center(
            child: Text(
              "+",
              style: TextStyle(fontSize: 20, color: Color(0xFFCECECE)),
            ),
          ),
        ),
      ],
    );
  }
}

class KiffyImageFieldFilled extends StatelessWidget {
  final VoidCallback onDeleted;
  final String url;

  const KiffyImageFieldFilled({
    super.key,
    required this.onDeleted,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(url, fit: BoxFit.cover),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: GestureDetector(
            onTap: () => onDeleted(),
            child: const Text("X",
                style: TextStyle(fontSize: 14, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
