import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';

class AtomicAppBar extends StatelessWidget {
  AtomicAppBar(
      {super.key, required this.title, this.backIcon = true, this.actions});
  final String title;
  bool? backIcon;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: appbarFlexibleSpace(),
      toolbarHeight: 30.h,
      title: TextView(title: title, fontsize: 13.sp, color: Colors.white),
      leading: backIcon! ? appBarIcon() : Container(),
      centerTitle: true,
      actions: actions,
    );
  }

  Container appbarFlexibleSpace() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.blue.shade700,
            Colors.blue.shade500,
            Colors.blue.shade700
          ],
        ),
      ),
    );
  }

  IconButton appBarIcon() {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        color: Colors.white,
        size: 25.sp,
      ),
    );
  }
}
