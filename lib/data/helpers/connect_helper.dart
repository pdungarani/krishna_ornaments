// coverage:ignore-file
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/data/data.dart';
import 'package:krishna_ornaments/data/helpers/end_points.dart';
import 'package:krishna_ornaments/domain/domain.dart';
import 'package:krishna_ornaments/domain/models/response_model.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId => GetPlatform.isAndroid
      ? androidDeviceInfo?.id
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
        }
      }
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  Future<ResponseModel> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async {
    var data = {
      "mobile": mobile,
      "password": password,
      "fcm": fcm,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.login,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> registerApi({
    bool isLoading = false,
    required String city,
    required String countryCode,
    required String mobile,
    required CountryWiseContact countryWiseContact,
    required String password,
    required String name,
    required String email,
    required String companyname,
  }) async {
    var data = {
      "city": city,
      "countryCode": countryCode,
      "mobile": mobile,
      "countryWiseContact": countryWiseContact,
      "password": password,
      "name": name,
      "email": email,
      "companyname": companyname,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.register,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }
}

class CountryWiseContact {
  CountryWiseContact({
    required this.number,
    required this.internationalNumber,
    required this.nationalNumber,
    required this.e164Number,
    required this.countryCode,
    required this.dialCode,
  });
  final String number;
  final String internationalNumber;
  final String nationalNumber;
  final String e164Number;
  final String countryCode;
  final String dialCode;
}
