import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/appbar_widget.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_future_builder.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_orange_button.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Const/Authorization/authorization_process.dart';
import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Model/employee_model.dart';
import 'package:mc_queen_courier/Pages/Main/Widget/call_courier_body_item.dart';
import 'package:mc_queen_courier/Service/service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part '../appbar_select_cargo.dart';
part 'app_bar_widget.dart';

class MainPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainPageAppBar({
    super.key,
    required this.qrKey,
    required this.onQRViewCreated,
    required this.refreshState,
  });

  final GlobalKey qrKey;
  final Function(QRViewController controller) onQRViewCreated;
  final VoidCallback refreshState;

  @override
  State<MainPageAppBar> createState() => _MainPageAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 30.h);
}

class _MainPageAppBarState extends State<MainPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AtomicAppBar(
      title: "Kargo Takip Sistemi",
      backIcon: false,
      actions: [
        IconButton(
          onPressed: () async {
            var isRefresh = await selectOptions(context);
            if (isRefresh) {
              widget.refreshState();
            }
          },
          icon: const Icon(
            Icons.barcode_reader,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          icon: const Icon(
            Icons.logout_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Future<dynamic> qrScanner(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return _BarcodeScannerDialog(
          onQRViewCreated: widget.onQRViewCreated,
          qrKey: widget.qrKey,
        );
      },
    );
  }

  Future<dynamic> selectOptions(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _AppBarSelectOptions(
          qrScanner: qrScanner,
        );
      },
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextView(
            title: "Çıkış Yap",
            fontsize: 12.sp,
          ),
          content: TextView(
            title: "Çıkmak istediğinizden emin misiniz?",
            fontsize: 13.sp,
          ),
          actions: [
            TextButton(
              child: TextView(
                title: "İptal",
                fontsize: 13.sp,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: TextView(
                title: "Çıkış",
                fontsize: 13.sp,
              ),
              onPressed: () async {
                Const.employeeId = 0;
                Const.employeeModel = EmployeeModel();
                await AuthorizationProcess.deleteCustomer();
                Get.offAllNamed("/login");
              },
            ),
          ],
        );
      },
    );
  }
}
