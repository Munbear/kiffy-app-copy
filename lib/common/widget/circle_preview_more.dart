import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CirclePreviewMore extends StatelessWidget {
  final VoidCallback onTap;

  const CirclePreviewMore({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.grey[400]!,
              ),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              "text.tag.more".tr(),
              style: textStyle.titleSmall,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
