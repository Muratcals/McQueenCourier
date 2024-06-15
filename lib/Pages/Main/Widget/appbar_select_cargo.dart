part of 'AppBar/app_bar.dart';

class _AppBarSelectCargo extends StatefulWidget {
  const _AppBarSelectCargo();

  @override
  State<_AppBarSelectCargo> createState() => _AppBarSelectCargoState();
}

class _AppBarSelectCargoState extends State<_AppBarSelectCargo> {
  final ApiServices services = ApiServices();

  @override
  Widget build(BuildContext context) {
    return AtomicFutureBuilder(
        future: services.getAllCallCourier(),
        child: (model) {
          final List<CallCourierModel> destinationList = model;
          return CallCourierBodyItem(
            destinationList: destinationList,
            incoming: "AppBar",
          );
        },
        onError: () => setState(() {}));
  }
}
