import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/data/repositories/article_repo.dart';

class HomeController extends GetxController {
  final articleRepository = Get.find<IArticleRepository>();

  var articles = <ArticleModel>[].obs;

  void init() {
    getHeadlines();
  }

  void getHeadlines() async {
    final response = await articleRepository.getHeadlines(
      category: "business",
      country: "us",
    );
    if (response != null) {
      articles.value = response;
    }
  }
}
