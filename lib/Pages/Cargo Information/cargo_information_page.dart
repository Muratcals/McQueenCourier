import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/appbar_widget.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_future_builder.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_orange_button.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_progreess_page.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_textformfield.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Model/create_cargo_model.dart';
import 'package:mc_queen_courier/Pages/Cargo%20Information/cargo_information_mixin.dart';

class CargoInformationPage extends StatefulWidget {
  const CargoInformationPage({super.key});

  @override
  State<CargoInformationPage> createState() => _CargoInformationPageState();
}

class _CargoInformationPageState extends State<CargoInformationPage>
    with CargoInformationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 30.h),
            child: AtomicAppBar(title: "Kargo Teslim Al")),
        body: StackProgressWidget(
          visibility: visibility,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: AtomicFutureBuilder(
              future: service.getCallCourier(cargoId: cargoId),
              child: (result) {
                CallCourierModel model = result;
                return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    padding: EdgeInsets.all(5.r),
                    child: cargoInformationColumn(model));
              },
              onError: () => setState(() {}),
            ),
          ),
        ));
  }

  Form cargoInformationColumn(CallCourierModel model) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomerNameWidget(createCargoModel: createCargoModel, model: model),
          SizedBox(height: 10.h),
          ReceiverNameTextForm(
              createCargoModel: createCargoModel, model: model),
          SizedBox(height: 10.h),
          DeliveryDate(createCargoModel: createCargoModel, model: model),
          SizedBox(height: 10.h),
          CargoDesiTextForm(createCargoModel: createCargoModel, model: model),
          SizedBox(height: 10.h),
          cargoTypeWidget(model),
          SizedBox(height: 10.h),
          paymentWidget(model),
          SizedBox(height: 10.h),
          cargoParceltype(model),
          SizedBox(height: 10.h),
          priceWidget(model),
          SizedBox(height: 10.h),
          AtomicOrangeButton(
              onPressed: () async {
                await buttonProcess(model);
              },
              title: "Kargoyu teslim al")
        ],
      ),
    );
  }

  Future<void> buttonProcess(CallCourierModel model) async {
    bool isValidate = formKey.currentState!.validate();
    visibility.value = true;
    if (isValidate) {
      createCargoModel.callCourierOk = true;
      createCargoModel.id = model.id;
      createCargoModel.cargoTypeId = 1;
      createCargoModel.customerMobilAdressId = model.customerMobilAdressId;
      formKey.currentState!.save();
      await service.createCargo(model: createCargoModel).then((value) {
        EasyLoading.showToast(value);
        visibility.value = false;
        Get.back(result: true);
      }).onError((error, stackTrace) {
        EasyLoading.showToast(error.toString());
        visibility.value = false;
      });
    }
  }

  AtomicTextFormField priceWidget(CallCourierModel model) {
    return AtomicTextFormField(
      title: "Ücret",
      enabled: false,
      controller: TextEditingController(text: model.price.toString()),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.price = model.price;
      },
    );
  }

  AtomicTextFormField cargoParceltype(CallCourierModel model) {
    return AtomicTextFormField(
      title: "Kargo Tipi",
      enabled: false,
      controller: TextEditingController(text: model.cargoParcelTypeName),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.cargoParcelTypeId = model.cargoParcelTypeId;
      },
    );
  }

  DropdownButtonFormField<int> paymentWidget(CallCourierModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        label: TextView(title: "Ödeme", fontsize: 14.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      value: model.paymentTypeId,
      items: [
        DropdownMenuItem(
          value: 1,
          child: TextView(title: "Alıcı Ödemeli", fontsize: 14.sp),
        ),
        DropdownMenuItem(
          value: 2,
          child: TextView(title: "Gönderici Ödemeli", fontsize: 14.sp),
        )
      ],
      onChanged: (value) {},
      onSaved: (newValue) {
        createCargoModel.paymentTypeId = newValue;
      },
    );
  }

  DropdownButtonFormField<int> cargoTypeWidget(CallCourierModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        label: TextView(title: "Kargo Türü", fontsize: 14.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      value: model.cargoTransportationConditionsId,
      items: [
        DropdownMenuItem(
          value: 1,
          child: TextView(title: "Kırılabilir", fontsize: 14.sp),
        ),
        DropdownMenuItem(
          value: 2,
          child: TextView(title: "Dökülebilir", fontsize: 14.sp),
        ),
        DropdownMenuItem(
          value: 3,
          child: TextView(title: "Normal", fontsize: 14.sp),
        )
      ],
      onChanged: (value) {},
      onSaved: (newValue) {
        createCargoModel.cargoTransportationConditionsId = newValue;
      },
    );
  }
}

class CargoDesiTextForm extends StatelessWidget {
  const CargoDesiTextForm({
    super.key,
    required this.createCargoModel,
    required this.model,
  });

  final CreateCargoModel createCargoModel;
  final CallCourierModel model;

  @override
  Widget build(BuildContext context) {
    return AtomicTextFormField(
      enabled: false,
      title: "Kargo desi",
      controller:
          TextEditingController(text: model.cargoDesi?.toInt().toString()),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.cargoDesi = model.cargoDesi;
      },
    );
  }
}

class DeliveryDate extends StatelessWidget {
  const DeliveryDate({
    super.key,
    required this.createCargoModel,
    required this.model,
  });

  final CreateCargoModel createCargoModel;
  final CallCourierModel model;

  @override
  Widget build(BuildContext context) {
    return AtomicTextFormField(
      title: "Gönderi Tarihi",
      enabled: false,
      controller:
          TextEditingController(text: model.cargoRealeseDate.toString()),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.cargoRealeseDate = model.cargoRealeseDate;
      },
    );
  }
}

class ReceiverNameTextForm extends StatelessWidget {
  const ReceiverNameTextForm({
    super.key,
    required this.createCargoModel,
    required this.model,
  });

  final CreateCargoModel createCargoModel;
  final CallCourierModel model;

  @override
  Widget build(BuildContext context) {
    return AtomicTextFormField(
      title: "Alıcı Adı Soyadı",
      enabled: false,
      controller: TextEditingController(text: model.receiverNameSurname),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.receiverId = model.receiverId;
      },
    );
  }
}

class CustomerNameWidget extends StatelessWidget {
  const CustomerNameWidget({
    super.key,
    required this.createCargoModel,
    required this.model,
  });

  final CreateCargoModel createCargoModel;
  final CallCourierModel model;

  @override
  Widget build(BuildContext context) {
    return AtomicTextFormField(
      enabled: false,
      title: "Gönderen Adı Soyadı",
      controller: TextEditingController(
          text: "${model.customerName} ${model.customerSurname} "),
      validator: (value) {
        if (value?.isNotEmpty != true) {
          return "Boş Geçilemez";
        }
        return null;
      },
      onSaved: (newValue) {
        createCargoModel.customerMobilId = model.customerMobilId;
      },
    );
  }
}
