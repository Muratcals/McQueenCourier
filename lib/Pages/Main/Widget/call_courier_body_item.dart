import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_future_builder.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Model/address_model.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/call_courier_list_item.dart';
import 'package:mc_queen_courier/Service/service.dart';

class CallCourierBodyItem extends StatefulWidget {
  const CallCourierBodyItem({
    super.key,
    required this.destinationList,
    this.refresh,
    required this.incoming,
  });

  final List<CallCourierModel> destinationList;
  final VoidCallback? refresh;
  final String incoming;

  @override
  State<CallCourierBodyItem> createState() => _CallCourierBodyItemState();
}

class _CallCourierBodyItemState extends State<CallCourierBodyItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.destinationList.isEmpty) {
      return const _EmptyListView(title: "Alınacak bir kargo bulunamadı");
    } else {
      var processList = widget.destinationList
          .where((element) => element.callCourierOk == false)
          .toList();
      return ListView.builder(
        itemCount: processList.length,
        itemBuilder: (context, index) {
          CallCourierModel model = processList[index];
          return AtomicFutureBuilder(
            future: ApiServices().getCustomerAddress(
                addressId: model.customerMobilAdressId ?? 0),
            child: (data) {
              AddressModel addressModel = data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () async {
                        if (widget.incoming.contains("AppBar")) {
                          var result = await Get.toNamed("cargoInformation",
                              arguments: {"cargoId": model.id});
                          result != null ? Get.back(result: true) : null;
                        }
                      },
                      child: CallCourierListItem(
                          model: model,
                          addressModel: addressModel,
                          incoming: widget.incoming)),
                  Divider(color: Colors.grey.shade700)
                ],
              );
            },
            onError: () => setState(
              () {},
            ),
          );
        },
      );
    }
  }
}

class _EmptyListView extends StatelessWidget {
  const _EmptyListView({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextView(title: title, fontsize: 13.sp),
    );
  }
}
