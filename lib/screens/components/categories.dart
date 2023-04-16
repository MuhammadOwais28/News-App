// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/news_services.dart';

import 'package:flutter_news_app/view_model/data_viewmodel.dart';
import 'package:flutter_news_app/view_model/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<DataProvider>();
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .08,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: DataProvider.dataList.length,
          itemBuilder: (context, index) {
            if (prov.isSelected(DataProvider.dataList[
                index])) //DataProvider.dataList[index] == dataProvider.datatype
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // dataProvider.setTypebyIndex(index);
                  },
                  child:
                      Consumer<ThemeProvider>(builder: (context, value, child) {
                    return Container(
                      height: height * .05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).buttonColor),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(DataProvider.dataList[index]),
                        ),
                      ),
                    );
                  }),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {
                  prov.setTypebyIndex(index);
                }, child:
                    Consumer<ThemeProvider>(builder: (context, value, child) {
                  return Container(
                    height: height * .05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(DataProvider.dataList[index]),
                      ),
                    ),
                  );
                })),
              );
            }
          }),
    );
  }
}



class NewsCard extends StatelessWidget {
  NewsCard(
      {super.key,
      required this.headline,
      this.imgUrl,
      this.snippet,
      this.author,
      required this.webUrl,
      required this.date,
      required this.publisher});
  final String headline, publisher;
  final String webUrl, date;
  String? imgUrl, author, snippet;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () async => NewsServices.gotoWeb(webUrl),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child:
             

              Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    // flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            publisher,
                            style: const TextStyle(
                                fontFamily: 'Georgia',
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              headline,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              snippet ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                        height: height * .17,
                        width: 100,
                        child: (imgUrl != null)
                            ? Image.network(
                                imgUrl!,
                                fit: BoxFit.fill,
                              )
                            : Image.asset('assets/images/no-image.png')),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author ?? 'N/A',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          date,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await Share.share(webUrl);
                      },
                      icon: const Icon(Icons.share))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
