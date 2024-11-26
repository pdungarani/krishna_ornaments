import 'package:krishna_ornaments/data/data.dart';
import 'package:krishna_ornaments/domain/models/login_model.dart';
import 'package:krishna_ornaments/domain/models/register_model.dart';
import 'package:krishna_ornaments/domain/repositories/repositories.dart';

/// Use case for getting the data from the API
class AuthUseCases {
  AuthUseCases(this.repository);

  final Repository repository;

  Future<LoginModel?> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async =>
      await repository.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );

  Future<RegisterModel?> registerApi({
    bool isLoading = false,
    required String city,
    required String countryCode,
    required String mobile,
    required CountryWiseContact countryWiseContact,
    required String password,
    required String name,
    required String email,
    required String companyname,
  }) async =>
      await repository.registerApi(
        city: city,
        countryCode: countryCode,
        mobile: mobile,
        countryWiseContact: countryWiseContact,
        password: password,
        name: name,
        email: email,
        companyname: companyname,
        isLoading: isLoading,
      );
}
