import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_string.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              homePagePoster(size: size, textTheme: textTheme),

              const SizedBox(
                height: 16,
              ),

              homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),

              const SizedBox(
                height: 32,
              ),
              // see more blog
              homePageSeeMore(
                  bodyMargin: bodyMargin, text: MyString.viewHotestBlog,icon: AssetImage(Assets.icons.bluepen.path),),

              // blog list
              homePageBlogList(
                  size: size, bodyMargin: bodyMargin, textTheme: textTheme),

              const SizedBox(
                height: 32,
              ),
              // see more pudcast
              homePageSeeMore(
                  bodyMargin: bodyMargin, text: MyString.viewHotestPodCasts,icon: AssetImage(Assets.icons.bluemic.path),),

              // Podcast list
              homePagePodcastList(size: size, bodyMargin: bodyMargin),

              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        itemCount: podcastList.length,
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
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: AssetImage(podcastList[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  podcastList[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        itemCount: blogList.length,
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
                    height: size.height / 5.4,
                    width: size.width / 2.5,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover)),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost)),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Text(blogList[index].views,
                                    style: textTheme.titleMedium),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
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
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displayMedium,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class homePageSeeMore extends StatelessWidget {
  const homePageSeeMore({
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
            color: solidColors.seeMore,
          ),
          SizedBox(
            width: 8,
          ),
          Text(text, style: Theme.of(context).textTheme.headlineMedium)
        ],
      ),
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                        colors: GradientColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(Assets.icons.hashtagicon.path),
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        tagList[index].title!,
                        style: textTheme.headlineSmall,
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                image: AssetImage(homePagePosterMap["imageAsset"]),
                fit: BoxFit.cover),
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Text(homePagePosterMap["title"], style: textTheme.displayLarge),
            ],
          ),
        )
      ],
    );
  }
}
