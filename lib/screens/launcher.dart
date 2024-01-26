import 'package:flutter/material.dart';
import 'package:holohive/screens/ChatScreen.dart';

import '../widgets/TopBar.dart';
import 'NewsFeed.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TopBar(),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                            color: Theme.of(context).colorScheme.primary.withAlpha(60),
                            blurRadius: 100.0,
                            spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.feed),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NewsFeed(),
                          ),
                        );
                      },
                    ),
                  )
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.message),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                    ),
                  )
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.shopping_basket),
                      onPressed: () {},
                    ),
                  )

              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.inventory),
                      onPressed: () {},
                    ),
                  )),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.science),
                      onPressed: () {},
                    ),
                  )),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.video_call),
                      onPressed: () {},
                    ),
                  )),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.control_point),
                      onPressed: () {},
                    ),
                  )),
              Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.contacts),
                      onPressed: () {},
                    ),
                  )),
              Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child:
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withAlpha(60),
                          blurRadius: 100.0,
                          spreadRadius: -2.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.terminal),
                      onPressed: () {},
                    ),
                  )
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
