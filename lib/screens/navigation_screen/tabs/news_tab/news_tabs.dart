import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_list.dart';

class NewsTabs extends StatelessWidget {
  const NewsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
            tabs: [
              Tab(child: Text('General')),
              Tab(child: Text('Sports')),
              Tab(child: Text('Technology')),
            ],
          ),
        ),
        Expanded(child: NewsList()),
      ],
    );
  }
}
