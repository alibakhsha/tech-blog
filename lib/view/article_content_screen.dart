import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ArticleContentScreen extends StatelessWidget {
  ArticleContentScreen({
    super.key,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height / 3.1,
                  foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.articlePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.bookmark_border,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "رازهای اساسینز کرید والهالا؛ از هری پاتر و ارباب حلقه‌ها تا دارک سولز",
                    style: textTheme.titleLarge,
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
                                  image: AssetImage(
                                      Assets.images.userProfile.path)))),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "فاطمه امیری",
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "2 روز پیش",
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, top: 16),
                    child: Text(
                      MyString.articleInfo,
                      style: textTheme.labelMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: SizedBox(
                        width: double.infinity,
                        height: 30,
                        child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 1,
                                  childAspectRatio: 0.3),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: SolidColors.surface,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Center(
                                  child: Text(
                                "کامپیوتر",
                                style: textTheme.displayMedium,
                              )),
                            );
                          },
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, top: 40, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          "نوشته های مرتبط",
                          style: textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  TopVisited(
                      size: size,
                      homeScreenController: homeScreenController,
                      textTheme: textTheme)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class TopVisited extends StatelessWidget {
  const TopVisited({
    super.key,
    required this.size,
    required this.homeScreenController,
    required this.textTheme,
  });

  final Size size;
  final HomeScreenController homeScreenController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.6,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? 8 : 15),
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
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
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
            );
          },
        ),
      ),
    );
  }
}
