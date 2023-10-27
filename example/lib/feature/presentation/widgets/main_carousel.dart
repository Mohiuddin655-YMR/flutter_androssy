import 'package:app_color/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../index.dart';

class MainCarousel extends StatelessWidget {
  final bool placeholderMode;
  final EdgeInsets? margin;
  final List<Movie> items;

  const MainCarousel({
    super.key,
    this.placeholderMode = false,
    this.margin,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, index, realIndex) {
          var item = items[index];
          if (placeholderMode) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.t50,
              highlightColor: Colors.grey.t25,
              child: YMRView(
                width: double.infinity,
                background: Colors.grey.t50,
                borderRadius: 24,
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              AppNavigator.of(context).push(
                SubscriptionScreens.route,
                arguments: {"data": item},
              );
            },
            child: ImageView(
              width: double.infinity,
              image: item.thumbnail,
              background: Colors.grey.t50,
              borderRadius: 24,
              scaleType: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 9 / 12,
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          enlargeFactor: 0.18,
          autoPlay: true,
        ),
      ),
    );
  }
}

class MainCarouselInfo {
  final dynamic photoUrl;

  const MainCarouselInfo({
    this.photoUrl = "",
  });

  static List<MainCarouselInfo> get demo {
    return [
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img1,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img2,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img3,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img4,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img5,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img6,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img7,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img8,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img9,
      ),
      const MainCarouselInfo(
        photoUrl: DemoPhotoUrls.img10,
      ),
    ];
  }
}
