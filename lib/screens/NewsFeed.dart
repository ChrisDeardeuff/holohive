import 'package:flutter/material.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/widgets/TopBar.dart';

import '../models/NewsPost.dart';
import '../widgets/NewsCards.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  FirebaseServices fb = FirebaseServices();

  List<NewsCard> newsList = [];

  @override initState(){
    super.initState();
    getNewsCards();
  }

  Future<List<NewsCard>> getNewsCards() async {

    List<NewsCard> nl = [];
    List<NewsPost> posts = await fb.getAllNews();

    posts.sort((a, b) => a.date.microsecondsSinceEpoch.compareTo(b.date.microsecondsSinceEpoch));

    print(posts);
    for(var newspost in posts.reversed){
      print(newspost.date.microsecondsSinceEpoch);
      var date = DateTime.fromMicrosecondsSinceEpoch( newspost.date.microsecondsSinceEpoch);
      nl.add(NewsCard(headline: newspost.headline,body: newspost.body,date: "${date.year}/${date.month}/${date.day}", agency: newspost.agency,));
    }

    return nl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TopBar(),
                Expanded(
                  child: FutureBuilder<List<NewsCard>>(
                    future: getNewsCards(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          padding: const EdgeInsets.all(8),
                          children: snapshot.data!,
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error fetching news: ${snapshot.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}
