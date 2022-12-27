import 'package:get/get.dart';

import '../../../../presentation/detail_image/controllers/detail_image.controller.dart';

class DetailImageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailImageController>(
      () => DetailImageController(),
    );
  }
}
