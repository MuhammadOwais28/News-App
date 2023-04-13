class AppUrl {
 
  // static late String _article_type;
   
  // static String get articleType => _article_type;
  // static set articleTtype(String type) {
  //   _article_type = type;
  // }

   static getArticleUrl(String type) {
    return 
      'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=${type}&api-key=eQKEDLDG58zkgv4T3h63NoYNmTjDkX2O';
  }
}
