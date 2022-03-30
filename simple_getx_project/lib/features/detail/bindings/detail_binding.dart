import 'package:get/get.dart';
import 'package:simple_getx_project/features/detail/index.dart';


class DetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProvider>(() => DetailProvider());
    Get.lazyPut<DetailRepository>(() => DetailRepository(provider: Get.find()));
    Get.lazyPut(() => DetailPageController());
    Get.lazyPut(() => OverviewController());
    Get.lazyPut(() => RatingRowController(detailRepository: Get.find()));
  }
}