class AppUrl {
  // static late String _article_type;

  // static String get articleType => _article_type;
  // static set articleTtype(String type) {
  //   _article_type = type;
  // }

  static getArticleUrl(String type) {
    return 'https://newsapi.org/v2/top-headlines?apiKey=0cbe3f9795804de9aae0e4ae0a7b2ef4&category=$type&language=en';
  }
}
