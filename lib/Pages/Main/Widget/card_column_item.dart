import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';

class CardColumnItem extends StatelessWidget {
  const CardColumnItem(
      {super.key, required this.title, required this.subTitle, this.color});

  final String title;
  final String subTitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: TextView(title: "$title :", fontsize: 13.sp)),
          Expanded(
            child: TextView(
              title: subTitle,
              fontsize: 12.sp,
              color: color ?? Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}