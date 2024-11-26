import 'package:krishna_ornaments/data/data.dart';
import 'package:krishna_ornaments/domain/models/response_model.dart';
import 'package:krishna_ornaments/domain/repositories/repositories.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  Future<ResponseModel> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async =>
      await connectHelper.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );

  Future<ResponseModel> registerApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String companyname,
    required String city,
    required String countryCode,
    required String mobile,
    required String password,
  }) async =>
      await connectHelper.registerApi(
        name: name,
        email: email,
        city: city,
        companyname: companyname,
        countryCode: countryCode,
        mobile: mobile,
        password: password,
      );
}
