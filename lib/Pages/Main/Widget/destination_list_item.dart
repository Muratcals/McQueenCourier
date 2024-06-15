import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mc_queen_courier/Model/cargo_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/card_column_item.dart';

class DestinationListView extends StatelessWidget {
  const DestinationListView({
    super.key,
    required this.model,
  });

  final CargoInformationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardColumnItem(
              title: "Alıcı", subTitle: model.receiverNameSurname ?? ""),
          CardColumnItem(
              title: "Alıcı Adresi",
              subTitle:
                  "${model.receiverNeighbourhoodName} ${model.receiverStreet} No: ${model.receiverBuildingNo} D: ${model.receiverApartmentNumber} ${model.receiverDistrictName}/${model.receiverProvinceName}"),
          CardColumnItem(
            title: "Teslim alınacak tarih",
            subTitle: DateFormat("dd:MM:yyyy")
                .format(model.cargoReleaseDate ?? DateTime.now()),
          ),
          CardColumnItem(
              title: "Ücret", subTitle: (model.price ?? 0.0).toString()),
          const CardColumnItem(
            title: "Durum",
            subTitle: "Teslim alındı.",
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
