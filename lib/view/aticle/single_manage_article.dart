import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/dimens.dart';
import 'package:tech_blog/constatnt/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/constatnt/my_string.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/article/list_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/aticle/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({
    super.key,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ListArticleController listArticleController = Get.put(ListArticleController());

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: manageArticleController.articleInfoModel.value.image!,
                      imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                      placeholder: (context, url) => const Loading(),
                      errorWidget: (context, url, error) => Image.asset(Assets.images.singlePlaceHolder.path)),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradientColors.articlePosterCoverGradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          height: 30,
                          width: Get.width / 3,
                          decoration: const BoxDecoration(
                              color: SolidColors.primaryColor,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "انتخاب تصویر",
                                style: textTheme.titleMedium,
                              ),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              HomePageSeeMore(
                  bodyMargin: Dimens.bodyMargin,
                  text: MyString.editTitleArticle,
                  icon: AssetImage(Assets.icons.bluepen.path)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      manageArticleController.articleInfoModel.value.title!,
                      style: textTheme.titleLarge,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage(Assets.images.userProfile.path)))),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12, top: 16),
                        child: HtmlWidget(
                          manageArticleController.articleInfoModel.value.content!,
                          textStyle: textTheme.labelMedium,
                          enableCaching: true,
                          onLoadingBuilder: (context, element, loadingProgress) => const Loading(),
                        )

                        // Text(
                        //   MyString.articleInfo,
                        //   style: textTheme.labelMedium,
                        // ),
                        ),
                    //tags(textTheme),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 40, bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            "نوشته های مرتبط",
                            style: textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget tags(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, top: 16),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  var tagId = manageArticleController.tagsList[index].id!;
                  await listArticleController.getArticleListWithTagsId(tagId);
                  String title = manageArticleController.tagsList[index].title!;
                  Get.to(ArticleListScreen(
                    title: title,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: SolidColors.surface, borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: Text(
                        manageArticleController.tagsList[index].title!,
                        style: textTheme.displayMedium,
                      ),
                    )),
                  ),
                ),
              );
            },
          )),
    );
  }
}
