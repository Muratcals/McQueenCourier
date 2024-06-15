part of 'app_bar.dart';

class _BarcodeScannerDialog extends StatelessWidget {
  const _BarcodeScannerDialog({
    required this.qrKey,
    required this.onQRViewCreated,
  });

  final GlobalKey qrKey;
  final Function(QRViewController controller) onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          height: (Get.height * 40) / 100,
          margin: EdgeInsets.symmetric(horizontal: 20.r),
          color: Colors.white,
          child: _BarcodeWidget(
            onQRViewCreated: onQRViewCreated,
            qrKey: qrKey,
          )),
    );
  }
}

class _BarcodeWidget extends StatelessWidget {
  const _BarcodeWidget({
    required this.qrKey,
    required this.onQRViewCreated,
  });

  final GlobalKey qrKey;
  final Function(QRViewController controller) onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 30.h),
        child: AtomicAppBar(
          title: "Kargonun kodunu okutunuz",
          backIcon: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back(result: false);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: _QrView(
        onQRViewCreated: onQRViewCreated,
        qrKey: qrKey,
      ),
    );
  }
}

class _QrView extends StatelessWidget {
  const _QrView({
    required this.qrKey,
    required this.onQRViewCreated,
  });

  final GlobalKey qrKey;
  final Function(QRViewController controller) onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.r),
      child: SizedBox(
        width: 180.w,
        height: 120.h,
        child: QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: onQRViewCreated,
        ),
      ),
    );
  }
}

class _AppBarSelectOptions extends StatelessWidget {
  const _AppBarSelectOptions({required this.qrScanner});
  final Future<dynamic> Function(BuildContext context) qrScanner;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: (Get.height * 30) / 100,
        margin: EdgeInsets.symmetric(horizontal: 20.r),
        color: Colors.white,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 30.h),
            child: AtomicAppBar(
              title: "Seçenek seçiniz",
              backIcon: false,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SelectQrView(qrScanner: qrScanner),
                SizedBox(height: 15.h),
                const _SelectCargoView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectCargoView extends StatelessWidget {
  const _SelectCargoView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width * 40) / 100,
      child: AtomicOrangeButton(
          onPressed: () async {
            var result = await showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Container(
                    width: double.infinity,
                    height: (Get.height * 70) / 100,
                    margin: EdgeInsets.symmetric(horizontal: 20.r),
                    color: Colors.white,
                    child: Scaffold(
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(30.h),
                        child: AtomicAppBar(title: "Alınacak Kargolar"),
                      ),
                      body: const _AppBarSelectCargo(),
                    ),
                  ),
                );
              },
            );
            result ? Get.back(result: result) : null;
          },
          title: "Listeden Seç"),
    );
  }
}

class _SelectQrView extends StatelessWidget {
  const _SelectQrView({
    required this.qrScanner,
  });

  final Future Function(BuildContext context) qrScanner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width * 40) / 100,
      child: AtomicOrangeButton(
          onPressed: () {
            qrScanner(context);
          },
          title: "QR Okut"),
    );
  }
}
