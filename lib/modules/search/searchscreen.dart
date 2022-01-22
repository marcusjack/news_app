import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/news_layoutController.dart';
import 'package:news_app/shared/componets/componets.dart';

class NewsSearchScreen extends StatelessWidget {
  var textsearchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: TextFormField(
            onChanged: (value) {
              print(value);
              newsLayoutController.getSearch(value.toString());
            },
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildArticleItem(
                          newsLayoutController.search[index], context);
                    },
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: newsLayoutController.search.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
