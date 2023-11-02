import 'package:flutter/material.dart';

class MatchedDetailCancelSection extends StatefulWidget {
  const MatchedDetailCancelSection({super.key});

  @override
  State<MatchedDetailCancelSection> createState() =>
      _MatchedDetailCancelSectionState();
}

class _MatchedDetailCancelSectionState
    extends State<MatchedDetailCancelSection> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO
        // 매칭 취소 api
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 23),
        side: const BorderSide(color: Color(0xffFF3A3A)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[300],
      ),
      child: const Text(
        "Cancel Matching",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xffFF3A3A),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
