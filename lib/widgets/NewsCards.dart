import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key, required this.headline, required this.body, required this.date, required this.agency});

  final String headline;
  final String body;
  final String date;
  final String agency;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionTile(
            collapsedIconColor: Theme.of(context).colorScheme.primary,
            title: Text(widget.headline, style: Theme.of(context).textTheme.titleLarge),
            subtitle: Row(
              children: [
                Text(widget.agency, style: Theme.of(context).textTheme.titleSmall),
                Spacer(),
                Text(widget.date, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Text(widget.body.replaceAll("\\n", "\n\n"), style: Theme.of(context).textTheme.bodyLarge),
              )
            ],
          ),
        ],
      ),
    );
  }
}
