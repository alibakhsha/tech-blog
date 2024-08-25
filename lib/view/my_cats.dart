import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/data_models.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_string.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techBot,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyString.successfulRegistration,
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: textTheme.headlineSmall),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyString.chooseCats,
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  //tag list
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: tagList.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: ((context, index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    myCats.add(HashTagModel(
                                        title: tagList[index].title));
                                  });
                                },
                                child: MainTags(
                                    textTheme: textTheme, index: index));
                          })),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SvgPicture.asset(
                    Assets.icons.downCatArrow,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: tagList.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: ((context, index) {
                            return MainTags(textTheme: textTheme, index: index);
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
