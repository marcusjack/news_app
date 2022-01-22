import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/news_layoutController.dart';
import 'package:news_app/shared/componets/componets.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
        init: Get.find<NewsLayoutController>(),
        builder: (newsLayoutController) => newsLayoutController.isloadingSports
            ? Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildArticleItem(
                      newsLayoutController.sports[index], context);
                },
                separatorBuilder: (context, index) => myDivider(),
                itemCount: newsLayoutController.sports.length));
  }
}
