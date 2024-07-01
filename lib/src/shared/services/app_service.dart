import 'package:reative_template_app_flutter/src/shared/app_urls.dart';
import 'package:reative_template_app_flutter/src/shared/models/page_information_model.dart';
import 'package:http/http.dart' as http;

class AppService {
  AppService();

  final AppUrls appUrls = AppUrls();

  Future<PageInformationModel> fetchPageInformation() async {
    final url = Uri.parse(appUrls.serverUrl);

    final response = await http.get(url);
    final pageInformation = PageInformationModel.fromJson(response.body);
    return pageInformation;
  }
}
