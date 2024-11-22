import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/controller/single_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/main.dart';
import 'package:tech_blog/view/article_list_screen.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  Single({
    super.key,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ListArticleController listArticleController =
      Get.put(ListArticleController());

  var singleArticleController =
      Get.find<SingleArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => singleArticleController.articleInfoModel.value.title == null
              ? SizedBox(height: Get.height, child: const Loading())
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => Image.asset(
                                Assets.images.singlePlaceHolder.path)),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: GradientColors
                                        .articlePosterCoverGradiant,
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
                                  const Icon(
                                    Icons.bookmark_border,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await Share.share(singleArticleController
                                          .articleInfoModel.value.title!);
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            singleArticleController
                                .articleInfoModel.value.title!,
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
                                      image: DecorationImage(
                                          image: AssetImage(Assets
                                              .images.userProfile.path)))),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                singleArticleController
                                    .articleInfoModel.value.author!,
                                style: textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                singleArticleController
                                    .articleInfoModel.value.createdAt!,
                                style: textTheme.headlineSmall,
                              )
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 16),
                              child: HtmlWidget(
                                singleArticleController
                                    .articleInfoModel.value.content!,
                                textStyle: textTheme.labelMedium,
                                enableCaching: true,
                                onLoadingBuilder:
                                    (context, element, loadingProgress) =>
                                        const Loading(),
                              )

                              // Text(
                              //   MyString.articleInfo,
                              //   style: textTheme.labelMedium,
                              // ),
                              ),
                          tags(textTheme),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, top: 40, bottom: 16),
                            child: Row(
                              children: [
                                Text(
                                  "نوشته های مرتبط",
                                  style: textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          simmilar()
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
                  var tagId = singleArticleController.tagsList[index].id!;
                  await listArticleController.getArticleListWithTagsId(tagId);
                  String title = singleArticleController.tagsList[index].title!;
                  Get.to(ArticleListScreen(
                    title: title,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: SolidColors.surface,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: Text(
                        singleArticleController.tagsList[index].title!,
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

  Widget simmilar() {
    return SizedBox(
      height: Get.height / 3.6,
      child: Obx(
        () => ListView.builder(
          itemCount: singleArticleController.relatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    singleArticleController.relatedList[index].id);

                Get.toNamed(routeSingleArticle);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? 8 : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height / 5.4,
                        width: Get.width / 2.5,
                        child: Stack(children: [
                          Container(
                            foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: GradientColors.blogPost)),
                            child: CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .relatedList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  singleArticleController
                                      .relatedList[index].author!,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        singleArticleController
                                            .relatedList[index].view!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 2.5,
                        child: Text(
                          singleArticleController.relatedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.displayMedium,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
