// To parse this JSON data, do
//
//     final uploadProfileModel = uploadProfileModelFromJson(jsonString);

import 'dart:convert';

UploadProfileModel uploadProfileModelFromJson(String str) => UploadProfileModel.fromJson(json.decode(str));

String uploadProfileModelToJson(UploadProfileModel data) => json.encode(data.toJson());

class UploadProfileModel {
    String? message;
    UploadProfileData? data;
    int? status;
    bool? isSuccess;

    UploadProfileModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory UploadProfileModel.fromJson(Map<String, dynamic> json) => UploadProfileModel(
        message: json["Message"],
        data: json["Data"] == null ? null : UploadProfileData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data?.toJson(),
        "Status": status,
        "IsSuccess": isSuccess,
    };
}

class UploadProfileData {
    String? profilePic;
    String? updatedBy;
    DateTime? updatedAt;

    UploadProfileData({
        this.profilePic,
        this.updatedBy,
        this.updatedAt,
    });

    factory UploadProfileData.fromJson(Map<String, dynamic> json) => UploadProfileData(
        profilePic: json["profile_pic"],
        updatedBy: json["updatedBy"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "updatedBy": updatedBy,
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
