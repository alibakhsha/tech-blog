import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article/manage_article_contriller.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/main.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  // RegisterController registerController = Get.put(RegisterController());
  var articleManageController = Get.find<ManageArticleContriller>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: appBar(MyString.titleAppBarManageArticle, textTheme),
      body: Obx(
        () => articleManageController.loading.value
            ? const Loading()
            : articleManageController.articleList.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articleManageController.articleList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          //route  to single manage
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width / 3,
                                height: size.height / 6,
                                child: CachedNetworkImage(
                                  imageUrl: articleManageController.articleList[index].image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                                    );
                                  },
                                  placeholder: (context, url) => const Loading(),
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width / 2,
                                    child: Text(
                                      articleManageController.articleList[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articleManageController.articleList[index].author!,
                                        style: textTheme.headlineSmall,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "${articleManageController.articleList[index].view!}بازدید",
                                        style: textTheme.headlineSmall,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : articleEmptyState(textTheme),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style:ButtonStyle(fixedSize: WidgetStateProperty.all(Size(Get.width/3, 46))),
          onPressed: () {},
          child: Text(
            MyString.textManageArticle,
            style: textTheme.labelSmall,
          ),
        ),
      ),
    ));
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.techBotSad,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: MyString.articleEmpty, style: textTheme.headlineMedium)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                MyString.textManageArticle,
                style: textTheme.labelSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
