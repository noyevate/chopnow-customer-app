// To parse this JSON data, do
//
//     final setPinModel = setPinModelFromJson(jsonString);

import 'dart:convert';

SetPinModel setPinModelFromJson(String str) => SetPinModel.fromJson(json.decode(str));

String setPinModelToJson(SetPinModel data) => json.encode(data.toJson());

class SetPinModel {
    final String phone;
    final String pin;

    SetPinModel({
        required this.phone,
        required this.pin,
    });

    factory SetPinModel.fromJson(Map<String, dynamic> json) => SetPinModel(
        phone: json["phone"],
        pin: json["pin"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "pin": pin,
    };
}
