import '../ui/utilitis/app_assets.dart';

class AppCategory {
  String name;
  String imageDark;
  String imageLight;

  AppCategory(
      {required this.name, required this.imageLight, required this.imageDark});

  static List<AppCategory> get categories => [
    AppCategory(
        name: "General",
        imageLight: AppAssets.generalLight,
        imageDark: AppAssets.generalDark),
    AppCategory(
        name: "Business",
        imageLight: AppAssets.businessLight,
        imageDark: AppAssets.businessDark),
    AppCategory(
        name: "Sports",
        imageLight: AppAssets.sportLight,
        imageDark: AppAssets.sportDark),
    AppCategory(
        name: "Technology",
        imageLight: AppAssets.technologyLight,
        imageDark: AppAssets.technologyDark),
    AppCategory(
        name: "Science",
        imageLight: AppAssets.scienceLight,
        imageDark: AppAssets.scienceDark),
    AppCategory(
        name: "Health",
        imageLight: AppAssets.healthLight,
        imageDark: AppAssets.healthDark),
    AppCategory(
        name: "Entertainment",
        imageLight: AppAssets.entertainmentLight,
        imageDark: AppAssets.entertainmentDark),
  ];
}