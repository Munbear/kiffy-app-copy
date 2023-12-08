import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_image_filed.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class KiffyImageFieldSection extends ConsumerStatefulWidget {
  final ValueChanged<MediaView> onAdded;
  final VoidCallback onDeleted;
  MediaView? media;

  KiffyImageFieldSection({
    super.key,
    this.media,
    required this.onAdded,
    required this.onDeleted,
  });

  @override
  ConsumerState<KiffyImageFieldSection> createState() =>
      _KiffyImageSectionState();
}

class _KiffyImageSectionState extends ConsumerState<KiffyImageFieldSection> {
  bool isLoading = false;

  void onAddedListener(String path) async {
    if (isLoading) return;
    setState(() => isLoading = true);
    var res =
        await ref.read(openApiProvider).getMediaApi().apiMediaV1UploadTypePost(
              type: "image",
              file: await MultipartFile.fromFile(path),
            );

    widget.onAdded(res.data!);
    setState(() => isLoading = false);
  }

  void onDeletedListener() async {
    widget.onDeleted();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const KiffyImageFieldLoading();
    }

    return KiffyImageField(
      url: widget.media?.url,
      onAdded: (path) => onAddedListener(path),
      onDeleted: () => onDeletedListener(),
    );
  }

  _KiffyImageSectionState();
}
