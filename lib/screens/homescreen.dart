import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/components/categories.dart';
import 'package:flutter_news_app/screens/components/top_screen.dart';
import 'package:flutter_news_app/services/news_services.dart';
import 'package:flutter_news_app/view_model/data_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: const [
          MyAppBar(
          
          ),
           Categories(),
          NewsData(
          )],
      )),
    );
  }
}

class NewsData extends StatelessWidget {
  const NewsData({super.key, });
 
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<DataProvider>();
    return Expanded(
      child: FutureBuilder(
          future: NewsServices.getNewsApi(prov.datatype),
          
         
          builder: (context, snapshot) {
           
            if (snapshot.connectionState == ConnectionState.waiting) {

              // ignore: deprecated_member_use
              return  Center(child: CircularProgressIndicator(color:   Theme.of(context).accentColor));
            } else if (!snapshot.hasData) {
              
              return const Center(
                
                child: Text('Check your internet connection. :")'),
              );
            } else {
              
              if (kDebugMode) {
                print(snapshot.data!.articles!.length);
              }
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: (snapshot.data!.articles!.length) //> 10 ? 10 :(snapshot.data!.articles!.length) ,
                  ,itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsCard(
                          headline: snapshot
                              .data!.articles![index].title!,
                          imgUrl: snapshot
                              .data?.articles?[index].urlToImage,
                          snippet:
                              snapshot.data?.articles?[index].description,
                          author: snapshot
                              .data?.articles?[index].author,
                          webUrl: snapshot.data!.articles![index].url!,
                          date: snapshot.data!.articles![index].publishedAt!, publisher: snapshot.data!.articles![index].source!.name!,),
                    );
                  });
            }
          }),
    );
  }
}
