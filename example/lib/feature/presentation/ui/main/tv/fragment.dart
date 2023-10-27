import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../index.dart';

class TVFragment extends StatelessWidget {
  final String Function(String value) translate;

  const TVFragment({
    super.key,
    required this.translate,
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
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieLatestController, DataResponse<Movie>>(
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
        BlocBuilder<MovieRecentWatchController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("News"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MoviePremiumController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Entertainment"),
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
              category: translate("Music"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: 'Movies',
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
      ],
    );
  }
}
