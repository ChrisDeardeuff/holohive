import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {

    var date = DateTime(2350,5,12);
    //var date = DateTime.now();
    // var diff = (date.millisecondsSinceEpoch-(-3471265902000));
    // var gt = diff / 1.0878277570776;
    // print(gt);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Holo Hive OS V113",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "${date.year}/${date.month}/${date.day}",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
