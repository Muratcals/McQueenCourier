import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_future_builder.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Model/cargo_model.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/AppBar/app_bar.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/call_courier_body_item.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/destination_body_item.dart';
import 'package:mc_queen_courier/Pages/Main/main_mixin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with MainMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: MainPageAppBar(
          qrKey: qrKey,
          onQRViewCreated: onQRViewCreated,
          refreshState: () {
            setState(() {});
          }),
      body: Center(
        child: AtomicFutureBuilder(
          future: Future.wait([
            services.getAllCallCourier(),
            services.getEmployeeDestinationOk()
          ]),
          child: (model) {
            List<CallCourierModel> destinationList = model[0];
            List<CargoInformationModel> destinationListOk = model[1];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              padding: EdgeInsets.all(5.r),
              child: Obx(
                () => Column(
                  children: [
                    tabBar(tabController),
                    Expanded(
                      child: selectedMenuItem.value == 0
                          ? CallCourierBodyItem(
                              incoming: "Body",
                              destinationList: destinationList,
                              refresh: () => setState(() {}),
                            )
                          : DestinationOkBodyItem(
                              destinationList: destinationListOk,
                              refresh: () => setState(() {}),
                            ),
                    )
                  ],
                ),
              ),
            );
          },
          onError: () => setState(() {}),
        ),
      ),
    );
  }

  TabBar tabBar(TabController tabController) {
    return TabBar(
        onTap: (value) {
          selectedMenuItem.value = value;
        },
        labelPadding: EdgeInsets.all(7.r),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.grey.shade600),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 0,
        tabs: [
          TextView(
              title: "Gidilecek kargolar",
              fontsize: 14.sp,
              color: selectedMenuItem.value != 0 ? Colors.black : Colors.white),
          TextView(
              title: "Alınmış kargolar",
              fontsize: 14.sp,
              color: selectedMenuItem.value == 0 ? Colors.black : Colors.white)
        ]);
  }
}
