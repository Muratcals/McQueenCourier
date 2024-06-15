// To parse this JSON data, do
//
//     final createCargoModel = createCargoModelFromJson(jsonString);

import 'dart:convert';

CreateCargoModel createCargoModelFromJson(String str) => CreateCargoModel.fromJson(json.decode(str));

String createCargoModelToJson(CreateCargoModel data) => json.encode(data.toJson());

class CreateCargoModel {
    int? customerMobilId;
    int? customerMobilAdressId;
    int? receiverId;
    int? paymentTypeId;
    int? cargoParcelTypeId;
    int? cargoTransportationConditionsId;
    int? cargoTypeId;
    double? cargoDesi;
    DateTime? cargoRealeseDate;
    double? price;
    bool? callCourierOk;
    int? id;

    CreateCargoModel({
        this.customerMobilId,
        this.customerMobilAdressId,
        this.receiverId,
        this.paymentTypeId,
        this.cargoParcelTypeId,
        this.cargoTransportationConditionsId,
        this.cargoTypeId,
        this.cargoDesi,
        this.cargoRealeseDate,
        this.price,
        this.callCourierOk,
        this.id,
    });

    factory CreateCargoModel.fromJson(Map<String, dynamic> json) => CreateCargoModel(
        customerMobilId: json["customerMobilId"],
        customerMobilAdressId: json["customerMobilAdressId"],
        receiverId: json["receiverId"],
        paymentTypeId: json["paymentTypeId"],
        cargoParcelTypeId: json["cargoParcelTypeID"],
        cargoTransportationConditionsId: json["cargoTransportationConditionsId"],
        cargoTypeId: json["cargoTypeId"],
        cargoDesi: json["cargoDesi"],
        cargoRealeseDate: json["cargoRealeseDate"] == null ? null : DateTime.parse(json["cargoRealeseDate"]),
        price: json["price"],
        callCourierOk: json["callCourierOk"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customerMobilId": customerMobilId,
        "customerMobilAdressId": customerMobilAdressId,
        "receiverId": receiverId,
        "paymentTypeId": paymentTypeId,
        "cargoParcelTypeID": cargoParcelTypeId,
        "cargoTransportationConditionsId": cargoTransportationConditionsId,
        "cargoTypeId": cargoTypeId,
        "cargoDesi": cargoDesi,
        "cargoRealeseDate": cargoRealeseDate?.toIso8601String(),
        "price": price,
        "callCourierOk": callCourierOk,
        "id": id,
    };
}
