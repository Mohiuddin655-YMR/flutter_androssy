import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../../../index.dart';

class SeeAllActivity extends AndrossyActivity {
  final String category;

  const SeeAllActivity({
    super.key,
    required this.category,
  });

  @override
  AndrossyController init(BuildContext context) {
    return AndrossyController();
  }

  @override
  Widget? onCreateTitle(BuildContext context) {
    return Text(category);
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return super.appbarConfig(context).copyWith(titleCenter: true);
  }

  @override
  Widget onCreate(BuildContext context, AndrossyInstance instance) {
    return FutureBuilder(
      future: fetchCurrentVideos(category),
      builder: (context, snapshot) {
        return RecyclerView(
          paddingHorizontal: 12,
          snapCount: 2,
          layoutType: RecyclerLayoutType.grid,
          scrollingType: ViewScrollingType.bouncing,
          width: double.infinity,
          items: snapshot.connectionState == ConnectionState.waiting
              ? List.generate(10, (index) => Movie())
              : snapshot.data ?? [],
          spaceBetween: 8,
          builder: (index, content) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ItemVideoPlaceholder();
            }
            return GestureDetector(
              onTap: () {
                AppNavigator.of(context).push(
                  PlayerScreens.route,
                  arguments: {
                    "data": content,
                  },
                );
              },
              child: ItemVideo(
                data: content,
              ),
            );
          },
        );
      },
    );
  }

  Future<List<Video>> fetchCurrentVideos(String category) {
    return Future.delayed(const Duration(seconds: 5)).then((value) {
      return MovieSource.demoVideos();
    });
  }
}
