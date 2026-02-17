import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_widget.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return NewsWidget();
      },
    );
  }

}
