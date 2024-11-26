import 'dart:async';

import 'package:krishna_ornaments/app/utils/utils.dart';
import 'package:krishna_ornaments/data/data.dart';
import 'package:krishna_ornaments/device/device.dart';
import 'package:krishna_ornaments/domain/domain.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(
        key,
      );
    } catch (_) {
      _dataRepository.clearData(
        key,
      );
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecureValue(String key) async {
    try {
      return await _deviceRepository.getSecuredValue(key);
    } catch (_) {
      return await _dataRepository.getSecuredValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValueSecurely(
        key,
        value,
      );
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(
        key,
      );
    } catch (_) {
      _dataRepository.deleteSecuredValue(
        key,
      );
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  Future<LoginModel?> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async {
    try {
      var response = await _dataRepository.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );
      var loginModel = loginModelFromJson(response.data);
      if (loginModel.data != null) {
        return loginModel;
      } else {
        Utility.errorMessage(loginModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ForgotPassModel?> forgotPass({
    bool isLoading = false,
    required String email,
  }) async {
    try {
      var response = await _dataRepository.forgotPass(
        email: email,
        isLoading: isLoading,
      );
      var forgotPassModel = forgotPassModelFromJson(response.data);
      if (forgotPassModel.data != null) {
        return forgotPassModel;
      } else {
        Utility.errorMessage(forgotPassModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getProfile(
        isLoading: isLoading,
      );
      var profileModel = getProfileModelFromJson(response.data);
      if (profileModel.data != null) {
        return profileModel;
      } else {
        Utility.errorMessage(profileModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<RegisterModel?> registerApi({
    bool isLoading = false,
    required String city,
    required String countryCode,
    required String mobile,
    required String password,
    required String name,
    required String email,
    required String companyname,
  }) async {
    try {
      var response = await _dataRepository.registerApi(
        city: city,
        countryCode: countryCode,
        mobile: mobile,
        password: password,
        name: name,
        email: email,
        companyname: companyname,
        isLoading: isLoading,
      );
      var registerModel = registerModelFromJson(response.data);
      if (registerModel.data != null) {
        return registerModel;
      } else {
        Utility.errorMessage(registerModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  // Future<void> getUserLocationDetails() async {
  //   try {
  //     await Utility.getCurrentLocation();

  //     var position = await Utility.getCurrentLatLng();

  //     if (position != null) {
  //       var lat = position.latitude.toString();
  //       var lng = position.longitude.toString();
  //       // saveSecureValue(LocalKeys.lat, lat);
  //       // saveSecureValue(LocalKeys.lng, lng);
  //     }
  //     var locationDetails = await Utility.getCurrentLocationDetails(
  //       isLoading: false,
  //     );

  //     if (locationDetails != null) {
  //       var city = locationDetails.area;
  //       var country = locationDetails.country;
  //       saveSecureValue(LocalKeys.city, city);
  //       saveSecureValue(LocalKeys.country, country);
  //     }
  //   } catch (e) {
  //     Utility.showDialog(e.toString());
  //   }
  // }

  /// API to get the IP of the user
  // Future<String?> getIp() async {
  //   try {
  //     var response = await _dataRepository.getIp();
  //     saveSecureValue(LocalKeys.userIP, response);

  //     return response;
  //   } catch (_) {
  //     var response = await _deviceRepository.getIp();

  //     return response;
  //   }
  // }
}
