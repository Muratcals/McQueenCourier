import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AtomicFutureBuilder extends StatefulWidget {
  const AtomicFutureBuilder(
      {super.key, required this.future, required this.child, required this.onError});
  final Widget Function(dynamic model) child;
  final Future<dynamic> future;
  final VoidCallback onError;

  @override
  State<AtomicFutureBuilder> createState() => _AtomicFutureBuilderState();
}

class _AtomicFutureBuilderState extends State<AtomicFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.hasData) {
          return widget.child(snapshot.data);
        } else {
          if (snapshot.error == "Not Found") {
            EasyLoading.showToast("Böyle bir veri bulunamadı");
            Get.back();
            return Container();
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        }
      },
    );
  }
}
