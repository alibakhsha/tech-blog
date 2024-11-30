import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/component/storage_const.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();

  var email = '';
  var userId = '';
  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };

    debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);

        Get.offAll(() => MainScreen());
        break;
      case 'incorrect_code ':
        Get.snackbar("خطا", "کد فعالسازی غلط است");
        break;
      case 'expired':
        Get.snackbar("خطا", "کد فعالسازی منقضی شده است");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.techBot,
                  height: 50,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  MyString.shareKnowledge,
                  style: const TextStyle(
                      fontFamily: "dana",
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              MyString.gigTech,
              style: const TextStyle(
                  fontFamily: "dana",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint("صفحه مقالات");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writeArticle.path,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        MyString.titleAppBarManageArticle,
                        style: const TextStyle(
                            fontFamily: "dana",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("صفحه پادکست ها");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writePodcast.path,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        MyString.managePodcast,
                        style: const TextStyle(
                            fontFamily: "dana",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
