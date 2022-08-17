import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  SignUpService signUpService = Get.find();
  final String welcome = 'Bienvenue à Terra Santé';
  final String candidate = 'Je voudrais travailler';
  final String recruiter = 'Je souhaite recruter';
  final String check = 'Vous avez déjà un compte? Connectez-vous';

  navigateToSignIn() async {
    await precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, 'assets/icons/login.svg'),
        null);
    Get.toNamed(Routes.signInRoute);
  }

  navigateToCandidate() {
    signUpService.newUser.userType = "candidat";
    Get.toNamed(Routes.candidateRoute);
  }

  navigateToRecruiter() {
    signUpService.newUser.userType = "recruteur";
    Get.toNamed(Routes.recruiterRoute);
  }

  navigateTest() {
    Get.toNamed(Routes.complexExemple);
  }

  navigateToHomePage() {
    Get.toNamed(Routes.homepage);
  }
}
