import 'package:flutter/material.dart';
import 'package:news_app/ui/utilitis/app_assets.dart';
import 'package:news_app/ui/utilitis/extension/context_extension.dart';
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),


      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Image.asset(
              AppAssets.sportLight,
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text(
              "40-year-old man falls 200 feet to his death while canyoneering at national park",style: context.textTheme.bodyMedium,
            ),
            Row(children: [Text("By : Jon Haworth ",style: context.textTheme.labelMedium,), Spacer(), Text("15 minutes ago ",style: context.textTheme.labelMedium,)]),
          ],
        ),
      ),
    );
  }
}
