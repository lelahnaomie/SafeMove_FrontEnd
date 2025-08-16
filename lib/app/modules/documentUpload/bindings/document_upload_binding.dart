import 'package:SafeMove/app/controllers/global_controller.dart';
import 'package:get/get.dart';
import '../controllers/document_upload_controller.dart';

class DocumentUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentUploadController>(
      () => DocumentUploadController(),
    );
    
    // Ensure global controller is available
    if (!Get.isRegistered<GlobalController>()) {
      Get.put<GlobalController>(GlobalController(), permanent: true);
    }
  }
}
