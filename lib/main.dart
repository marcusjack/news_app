import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/layout/news_layoutController.dart';
import 'package:news_app/shared/helper/binding.dart';
import 'package:news_app/shared/network/local/cashhelper.dart';
import 'package:news_app/shared/network/remote/diohelper_news.dart';
import 'package:news_app/shared/styles/thems.dart';

Future<void> main() async {
  // NOTE : to run all thing befor runApp()
  WidgetsFlutterBinding.ensureInitialized();
  // dio helper is used to call api
  // this come first cz in new controller i use the dio so if i dont use then ,
  // then new layoutcontroller created and call diohelper on null so return business list null
  DioHelperNews.init().then((value) {});
  await CashHelper.init();

  Get.put(NewsLayoutController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => GetMaterialApp(
        // bind the dependency
        theme: lightTheme(),
        darkTheme: darkThem(),
        themeMode:
            newsLayoutController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        //themeMode: ThemeMode.dark,

        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: NewsLayout(),
      ),
    );
  }
}
