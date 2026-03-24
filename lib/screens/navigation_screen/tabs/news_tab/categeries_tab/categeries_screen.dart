import 'package:flutter/material.dart';
import 'package:news_app/data/model/app_category.dart';
import 'package:news_app/ui/utilitis/extension/context_extension.dart';
import 'package:news_app/ui/utilitis/extension/int_extension.dart';
import 'package:provider/provider.dart';

import '../../../../../ui/utilitis/app_routs.dart';
import '../../../../../ui/utilitis/providers/theme_provider.dart';
import '../../../../widget/app_drawer.dart';

class CategeriesScreen extends StatelessWidget {
  CategeriesScreen({super.key});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Good Morning \nHere is Some News For You",
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: AppCategory.categories.length,
                    itemBuilder: (context, index) {
                      return buildCategoryWidget(
                        context,
                        index,
                        AppCategory.categories[index],
                      );
                    }))
          ],
        ),
      ),
    );
  }

  buildCategoryWidget(BuildContext context, int index, AppCategory category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          AppRoutes.newsScreen(category),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(themeProvider.isLightMode
                  ? category.imageDark
                  : category.imageLight),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: index.isEven
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: context.textTheme.displaySmall,
                  ),
                  38.verticalSpace(),
                  Container(
                    decoration: BoxDecoration(
                        color: context.primaryColor.withAlpha(125),
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index.isEven) ...[
                          16.horizontalSpace(),
                          Text("View all"),
                          8.horizontalSpace(),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: context.primaryColor,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.secondaryColor,
                              size: 18,
                            ),
                          )
                        ],
                        if (index.isOdd) ...[
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: context.primaryColor,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: context.secondaryColor,
                              size: 18,
                            ),
                          ),
                          8.horizontalSpace(),
                          Text("View all"),
                          16.horizontalSpace(),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}