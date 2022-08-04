import 'package:get/get.dart';

class SignUpRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future createUser(body) => post("/register/add_type_status_phone", body);
  Future addEmailUser(body) => post("/users/add_email", body);
  Future addAddressUser(body) => post("/users/add_address", body);
}
