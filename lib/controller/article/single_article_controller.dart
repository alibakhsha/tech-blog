import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/aticle/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel =
      ArticleInfoModel(null, null, null).obs;

  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel(null, null, null).obs;
    loading.value = true;
    //TODO useId is hard code
    var userId = '';
    var response = await DioService().getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }

    tagsList.clear();
    response.data['tags'].forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(Single());
  }
}
