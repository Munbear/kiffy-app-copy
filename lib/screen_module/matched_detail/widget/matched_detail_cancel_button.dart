import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MatchedDetailCancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MatchedDetailCancelButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: const BorderSide(color: Color(0xffFF3A3A)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[300],
        ),
        child: Text(
          tr("text.match.cancel"),
          style: Theme.of(context).textTheme.titleMedium!.apply(
                color: const Color(0xffFF3A3A),
              ),
        ),
      ),
    );
  }
}
