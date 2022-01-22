import 'package:get/get.dart';
import 'package:news_app/layout/news_layoutController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    //NOTE:  implement dependencies
    Get.lazyPut(() => NewsLayoutController());
    //Get.lazyPut(() => SocialLayoutController());

    //Get.lazyPut(() => ProfileController());
  }
}
