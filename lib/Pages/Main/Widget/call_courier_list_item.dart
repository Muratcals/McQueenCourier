import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mc_queen_courier/Model/address_model.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/card_column_item.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/start_navigation.dart';

class CallCourierListItem extends StatelessWidget {
  const CallCourierListItem(
      {super.key,
      required this.model,
      required this.addressModel,
      required this.incoming});

  final CallCourierModel model;
  final AddressModel addressModel;
  final String incoming;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 15.r, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardColumnItem(
              title: "Gönderici",
              subTitle: "${model.customerName} ${model.customerSurname}"),
          CardColumnItem(
              title: "Adres",
              subTitle:
                  "${addressModel.neighbourhoodName} ${addressModel.street} No: ${addressModel.buildingNo} D: ${addressModel.apartmentNumber} ${addressModel.districtName}/${addressModel.provinceName}"),
          CardColumnItem(
            title: "Teslim alınacak tarih",
            subTitle: DateFormat("dd:MM:yyyy")
                .format(model.cargoRealeseDate ?? DateTime.now()),
          ),
          CardColumnItem(
              title: "Ağırlık", subTitle: (model.cargoDesi ?? 0.0).toString()),
          const CardColumnItem(
            title: "Durum",
            subTitle: "Bekliyor",
            color: Colors.orange,
          ),
          !incoming.contains("AppBar")
              ? StartNavigation(address: addressModel)
              : Container()
        ],
      ),
    );
  }
}
