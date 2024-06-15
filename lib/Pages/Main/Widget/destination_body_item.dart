import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Model/cargo_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/destination_list_item.dart';

class DestinationOkBodyItem extends StatelessWidget {
  const DestinationOkBodyItem({
    super.key,
    required this.destinationList,
    required this.refresh,
  });

  final List<CargoInformationModel> destinationList;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    if (destinationList.isEmpty) {
      return const _EmptyListView(title: "Alınmış bir kargonuz bulunamadı");
    } else {
      return ListView.builder(
        itemCount: destinationList.length,
        itemBuilder: (context, index) {
          CargoInformationModel model = destinationList[index];
          return Column(
            children: [
              DestinationListView(model: model),
              Divider(color: Colors.grey.shade700)
            ],
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
