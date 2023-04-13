import 'dart:convert';

import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/utils/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsServices {
  static Future<NewsModel> getNewsApi(String type) async {
    try {
      final response =
          await http.get(Uri.parse(AppUrl.getArticleUrl(type.toLowerCase())));
      if (response.statusCode == 200) {
        return NewsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future gotoWeb(String webUrl) async {
    if (await canLaunchUrl(Uri.parse(webUrl))) {
      await launchUrl(Uri.parse(webUrl));
    } else {
      // launch(webUrl);
    }
  }
}
