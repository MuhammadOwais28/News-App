import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/components/categories.dart';
import 'package:flutter_news_app/screens/components/top_screen.dart';
import 'package:flutter_news_app/services/news_services.dart';
import 'package:flutter_news_app/view_model/data_viewmodel.dart';
import 'package:flutter_news_app/view_model/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    final prov = context.watch<DataProvider>();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          TopScreen(
            prov: provider,
          ),
          const Categories(),
          NewsData(type: prov.datatype)
        ],
      )),
    );
  }
}

class NewsData extends StatelessWidget {
  const NewsData({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: NewsServices.getNewsApi(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('Data not found'),
              );
            } else {
              print(snapshot.data!.response!.docs!.length);
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.response!.docs!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsCard(
                          headline: snapshot
                              .data!.response!.docs![index].headline!.main!,
                          imgUrl: snapshot
                              .data!.response!.docs![index].multimedia![0].url!,
                          snippet:
                              snapshot.data!.response!.docs![index].abstract!,
                          author: snapshot
                              .data!.response!.docs![index].byline!.original!,
                          webUrl: snapshot.data!.response!.docs![index].webUrl!,
                          date: snapshot.data!.response!.docs![index].pubDate!),
                    );
                  });
            }
          }),
    );
  }
}
