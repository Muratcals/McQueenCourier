// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

final class EmployeeModel extends Equatable {
  int? id;
  String? name;
  String? surname;
  String? tcNo;
  String? numberPhone;
  String? password;
  int? employeesTypeId;
  int? branchId;

  EmployeeModel({
    this.id,
    this.name,
    this.surname,
    this.tcNo,
    this.numberPhone,
    this.password,
    this.employeesTypeId,
    this.branchId,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        tcNo: json["tcNo"],
        numberPhone: json["numberPhone"],
        password: json["password"],
        employeesTypeId: json["employeesTypeId"],
        branchId: json["branchId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "tcNo": tcNo,
        "numberPhone": numberPhone,
        "password": password,
        "employeesTypeId": employeesTypeId,
        "branchId": branchId,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        tcNo,
        numberPhone,
        password,
        employeesTypeId,
        branchId
      ];

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? surname,
    String? tcNo,
    String? numberPhone,
    String? password,
    int? employeesTypeId,
    int? branchId,
  }) {
    return EmployeeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        tcNo: tcNo ?? this.tcNo,
        numberPhone: numberPhone ?? this.numberPhone,
        password: password ?? this.password,
        employeesTypeId: employeesTypeId ?? this.employeesTypeId,
        branchId: branchId ?? this.branchId);
  }
}
