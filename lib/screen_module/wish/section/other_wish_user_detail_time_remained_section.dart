import 'dart:async';

import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserDetailTimeRemainedSection extends ConsumerStatefulWidget {
  final OtherWishUserProfileView wishUserProfileView;

  OtherWishUserDetailTimeRemainedSection({
    super.key,
    required this.wishUserProfileView,
  });

  @override
  ConsumerState<OtherWishUserDetailTimeRemainedSection> createState() =>
      _OtherWishUserDetailTimeRemainedSectionState();
}

class _OtherWishUserDetailTimeRemainedSectionState
    extends ConsumerState<OtherWishUserDetailTimeRemainedSection> {
  Timer? _timer;
  WishRemained? remained;

  @override
  void initState() {
    // TODO: implement initState
    remained = ref
        .read(wishRemainCalculatorProvider)
        .calculate(widget.wishUserProfileView.createdAt);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remained = ref
            .read(wishRemainCalculatorProvider)
            .calculate(widget.wishUserProfileView.createdAt);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: tr("text.wish_detail.remained.title"),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: remained?.remainedDurationHHmmss() ?? "00:00:00",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff0031AA),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(tr("text.wish_detail.remained.comment")),
          )
        ],
      ),
    );
  }
}
