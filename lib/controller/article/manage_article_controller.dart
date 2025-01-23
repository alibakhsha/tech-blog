import 'package:get/get.dart';
import 'package:tech_blog/constatnt/api_constant.dart';
import 'package:tech_blog/constatnt/my_string.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagsList = RxList.empty();
  RxBool loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel =
      ArticleInfoModel(MyString.titltArrticle, MyString.editMainTextArticle, "").obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    loading.value = true;
    //TODO get user id from getStorage ApiConstant.getArticleList+user id
    // var response = await DioService().getMethod(ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response = await DioService().getMethod(ApiConstant.publishedByMe + "1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }
}
