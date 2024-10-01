import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/single_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/view/article_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Obx(
          () => Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: homeScreenController.loading.value == false
                  ? Column(
                      children: [
                        poster(),

                        const SizedBox(
                          height: 16,
                        ),

                        tags(),

                        const SizedBox(
                          height: 32,
                        ),
                        // see more blog
                        GestureDetector(
                          onTap: () =>
                              Get.to(ArticleListScreen(title: "لیست مقالات")),
                          child: HomePageSeeMore(
                            bodyMargin: bodyMargin,
                            text: MyString.viewHotestBlog,
                            icon: AssetImage(Assets.icons.bluepen.path),
                          ),
                        ),

                        // blog list
                        topVisited(),

                        const SizedBox(
                          height: 32,
                        ),
                        // see more pudcast
                        HomePageSeeMore(
                          bodyMargin: bodyMargin,
                          text: MyString.viewHotestPodCasts,
                          icon: AssetImage(Assets.icons.bluemic.path),
                        ),

                        // Podcast list
                        topPodcast(),

                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : const Center(child: Loading())),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.6,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return GestureDetector(
              onTap: () async {
                await singleArticleController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 5.4,
                        width: size.width / 2.5,
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
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
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
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.titleMedium),
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
                        width: size.width / 2.5,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
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

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.6,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.66,
                      width: size.width / 2.8,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastsList[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: (context, url) => const Loading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    homeScreenController.topPodcastsList[index].title!,
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        "-" +
                        homePagePosterMap["date"],
                    style: textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(homePagePosterMap["view"],
                          style: textTheme.titleMedium),
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
              Text(homeScreenController.poster.value.title!,
                  style: textTheme.displayLarge),
            ],
          ),
        )
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await homeScreenController.getHomeItems();
              String title = homeScreenController.tagsList[index].title!;
              Get.to(ArticleListScreen(
                title: title,
              ));
            },
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageSeeMore extends StatelessWidget {
  const HomePageSeeMore({
    super.key,
    required this.bodyMargin,
    required this.text,
    required this.icon,
  });

  final double bodyMargin;
  final String text;
  final AssetImage icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            icon,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(text, style: Theme.of(context).textTheme.headlineMedium)
        ],
      ),
    );
  }
}
