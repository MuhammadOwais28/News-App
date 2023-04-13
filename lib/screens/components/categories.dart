import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/news_services.dart';
import 'package:flutter_news_app/utils/themes.dart';
import 'package:flutter_news_app/view_model/data_viewmodel.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children:  [
          

          // Category(
          //   name: 'sports',
          // ),
          // Category(
          //   name: 'politics',
          // ),
          // Category(
          //   name: 'games',
          // ),
          // Category(name: 'movies'),
          // Category(
          //   name: 'election',
          // )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: height * .05,
          // width: width * .22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(name),
            ),
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key,
      required this.headline,
      required this.imgUrl,
      required this.snippet,
      required this.author,
      required this.webUrl,
      required this.date});
  final String headline, snippet;
  final String imgUrl, author, webUrl, date;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async => NewsServices.gotoWeb(webUrl),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child:
              // crossAxisAlignment: CrossAxisAlignment.start,

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
                          const Text(
                            'NewYork Times',
                            style: TextStyle(
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
                              snippet,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                          //   child: Text(
                          //     author,
                          //     // textAlign: TextAlign.start,
                          //     style: Theme.of(context).textTheme.subtitle2,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: height * .17,
                      width: 100,
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                      // Image.asset('assets/images/notfound.png')
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
