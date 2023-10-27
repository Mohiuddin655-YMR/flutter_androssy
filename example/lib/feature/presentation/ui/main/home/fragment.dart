import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../index.dart';

class HomeFragment extends StatelessWidget {
  final String Function(String value) translate;
  final DrawerSelectionType type;

  const HomeFragment({
    super.key,
    required this.translate,
    this.type = DrawerSelectionType.shows,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      width: double.infinity,
      scrollable: true,
      scrollingType: ViewScrollingType.bouncing,
      paddingBottom: 16,
      children: [
        BlocBuilder<MovieCarouselController, DataResponse<Movie>>(
          builder: (context, response) {
            return MainCarousel(
              margin: const EdgeInsets.symmetric(vertical: 12),
              placeholderMode: response.isLoading,
              items: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieLatestController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Best and Latest"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieRecentWatchController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForMedium(
              category: translate("Continue Watching"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MoviePremiumController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Bongo Premium"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Shorts"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading
                  ? Movie()
                  : response.result.reversed.toList()[0],
            );
          },
        ),
        BlocBuilder<MovieFreeController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Free for limited time"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Latest series episodes"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Live TV"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading
                  ? Movie()
                  : response.result.reversed.toList()[1],
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Inspiring women"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Opar bangla golpo"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Latest bongo drama"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading ? Movie() : response.result[2],
            );
          },
        ),
      ],
    );
  }
}

class CategoryMoviesForSmall extends StatelessWidget {
  final bool placeholderMode;
  final double marginTop;
  final String Function(String value) translate;
  final String category;
  final List<Movie> movies;

  const CategoryMoviesForSmall({
    super.key,
    this.placeholderMode = false,
    this.marginTop = 16,
    required this.category,
    required this.movies,
    required this.translate,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      marginTop: marginTop,
      width: double.infinity,
      children: [
        LinearLayout(
          width: double.infinity,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.center,
          paddingHorizontal: 12,
          paddingVertical: 8,
          children: [
            TextView(
              flex: 1,
              text: category,
              textSize: 16,
              textFontWeight: FontWeight.w500,
              textColor: Colors.white70,
              textAllCaps: true,
            ),
            TextView(
              text: translate("See all"),
              textSize: 16,
              textFontWeight: FontWeight.w500,
              textColor: AppColors.secondary,
              textAllCaps: true,
              onClick: (con) {
                AppNavigator.of(context).push(
                  SeeAllScreens.route,
                  arguments: {
                    "category": category,
                  },
                );
              },
            ),
          ],
        ),
        RecyclerView(
          paddingHorizontal: 12,
          scrollingType: ViewScrollingType.bouncing,
          width: double.infinity,
          scrollable: true,
          orientation: Axis.horizontal,
          items: movies,
          spaceBetween: 8,
          builder: (index, content) {
            if (placeholderMode) {
              return const ItemPlaceholderSmall();
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
              child: ItemMovie(
                model: content,
              ),
            );
          },
        ),
      ],
    );
  }
}

class CategoryMoviesForMedium extends StatelessWidget {
  final bool placeholderMode;
  final double marginTop;
  final String Function(String value) translate;
  final String category;
  final List<Movie> movies;

  const CategoryMoviesForMedium({
    super.key,
    this.placeholderMode = false,
    this.marginTop = 16,
    required this.category,
    required this.movies,
    required this.translate,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      marginTop: marginTop,
      width: double.infinity,
      children: [
        LinearLayout(
          width: double.infinity,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.center,
          paddingHorizontal: 12,
          paddingVertical: 8,
          children: [
            TextView(
              flex: 1,
              text: category,
              textSize: 16,
              textFontWeight: FontWeight.w500,
              textColor: Colors.white70,
              textAllCaps: true,
            ),
            TextView(
              text: translate("See all"),
              textSize: 16,
              textFontWeight: FontWeight.w500,
              textColor: AppColors.secondary,
              textAllCaps: true,
              onClick: (con) {
                AppNavigator.of(context).push(
                  SeeAllScreens.route,
                  arguments: {
                    "category": category,
                  },
                );
              },
            ),
          ],
        ),
        RecyclerView(
          paddingHorizontal: 12,
          scrollingType: ViewScrollingType.bouncing,
          width: double.infinity,
          scrollable: true,
          orientation: Axis.horizontal,
          items: movies,
          spaceBetween: 8,
          builder: (index, content) {
            if (placeholderMode) {
              return const ItemPlaceholderDrama();
            }
            return GestureDetector(
              onTap: () {
                AppNavigator.of(context).push(
                  SubscriptionScreens.route,
                  arguments: {
                    "data": content,
                  },
                );
              },
              child: ItemDrama(
                model: content,
              ),
            );
          },
        ),
      ],
    );
  }
}

class CategoryMoviesForTrailer extends StatelessWidget {
  final bool placeholderMode;
  final double marginTop;
  final String Function(String value) translate;
  final String category;
  final Movie movie;

  const CategoryMoviesForTrailer({
    super.key,
    this.placeholderMode = false,
    this.marginTop = 16,
    required this.category,
    required this.movie,
    required this.translate,
  });

  @override
  Widget build(BuildContext context) {
    if (placeholderMode) {
      return const ItemTrailerPlaceholder();
    }
    return GestureDetector(
      onTap: () {
        AppNavigator.of(context).push(
          PlayerScreens.route,
          arguments: {
            "data": movie,
          },
        );
      },
      child: ItemTrailer(
        item: movie,
      ),
    );
  }
}
