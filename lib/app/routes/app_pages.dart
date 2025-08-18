import 'package:get/get.dart';

import '../modules/application_status/bindings/application_status_binding.dart';
import '../modules/application_status/views/application_status_view.dart';
import '../modules/documentUpload/bindings/document_upload_binding.dart';
import '../modules/documentUpload/views/document_upload_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/registerType/bindings/register_type_binding.dart';
import '../modules/registerType/views/register_type_view.dart';
import '../modules/resetPassword/bindings/reset_password_binding.dart';
import '../modules/resetPassword/views/reset_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/vehicleRegistration/bindings/vehicle_registration_binding.dart';
import '../modules/vehicleRegistration/views/vehicle_registration_view.dart';
import '../modules/welcomer/bindings/welcomer_binding.dart';
import '../modules/welcomer/views/welcomer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMER,
      page: () => const WelcomerView(),
      binding: WelcomerBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_TYPE,
      page: () => const RegisterTypeView(),
      binding: RegisterTypeBinding(),
    ),
    GetPage(
      name: _Paths.APPLICATION_STATUS,
      page: () => const ApplicationStatusView(),
      binding: ApplicationStatusBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLE_REGISTRATION,
      page: () => const VehicleRegistrationView(),
      binding: VehicleRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT_UPLOAD,
      page: () => const DocumentUploadView(),
      binding: DocumentUploadBinding(),
    ),
  ];
}
