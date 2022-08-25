import 'package:get/get.dart';

class SignUpRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.162:5000';
  }

  Future createUser(body) => post("/register/add_type_status_phone", body);
  Future addEmailUser(body) => post("/users/add_email", body);
  Future addAddressUser(body) => post("/users/add_address", body);
  Future addNameUser(body) => post("/users/add_personal_infos", body);
  Future addPasswordUser(body) => post("/users/add_email_password", body);
}
