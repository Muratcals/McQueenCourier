// To parse this JSON data, do
//
//     final employeeDestinationModel = employeeDestinationModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeDestinationModel> employeeDestinationModelFromJson(String str) => List<EmployeeDestinationModel>.from(json.decode(str).map((x) => EmployeeDestinationModel.fromJson(x)));

String employeeDestinationModelToJson(List<EmployeeDestinationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDestinationModel {
    int? id;
    int? countryId;
    String? countryName;
    int? provinceId;
    String? provinceName;
    int? districtId;
    String? districtName;
    int? neighbourhoodId;
    String? neighbourhoodName;
    String? street;
    String? buildingNo;
    String? apartmentNumber;
    int? floor;
    String? title;
    String? description;

    EmployeeDestinationModel({
        this.id,
        this.countryId,
        this.countryName,
        this.provinceId,
        this.provinceName,
        this.districtId,
        this.districtName,
        this.neighbourhoodId,
        this.neighbourhoodName,
        this.street,
        this.buildingNo,
        this.apartmentNumber,
        this.floor,
        this.title,
        this.description,
    });

    factory EmployeeDestinationModel.fromJson(Map<String, dynamic> json) => EmployeeDestinationModel(
        id: json["id"],
        countryId: json["countryId"],
        countryName: json["countryName"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
        districtId: json["districtId"],
        districtName: json["districtName"],
        neighbourhoodId: json["neighbourhoodId"],
        neighbourhoodName: json["neighbourhoodName"],
        street: json["street"],
        buildingNo: json["buildingNo"],
        apartmentNumber: json["apartmentNumber"],
        floor: json["floor"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "countryId": countryId,
        "countryName": countryName,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "districtId": districtId,
        "districtName": districtName,
        "neighbourhoodId": neighbourhoodId,
        "neighbourhoodName": neighbourhoodName,
        "street": street,
        "buildingNo": buildingNo,
        "apartmentNumber": apartmentNumber,
        "floor": floor,
        "title": title,
        "description": description,
    };
}
