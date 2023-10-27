import 'package:app_color/app_color.dart';
import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../index.dart';

class PlayerActivity extends AndrossyActivity<PlayerController> {
  final Video data;

  const PlayerActivity({
    super.key,
    required this.data,
  });

  @override
  PlayerController init(BuildContext context) {
    return PlayerController();
  }

  @override
  Widget? onCreateTitle(BuildContext context) {
    return const ImageView(
      image: LogoContent.logo,
      width: 40,
      shape: ViewShape.squire,
    );
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return super.appbarConfig(context).copyWith(titleCenter: true);
  }

  @override
  Widget onCreate(BuildContext context, AndrossyInstance instance) {
    return LinearLayout(
      scrollable: true,
      children: [
        VideoView(
          autoPlay: true,
          width: double.infinity,
          videoThumbnail: data.thumbnail,
          video: data.videoUrl,
        ),
        LinearLayout(
          paddingHorizontal: 16,
          paddingVertical: 16,
          children: [
            TextView(
              text: data.name,
              textFontWeight: FontWeight.w600,
              textSize: 20,
              textColor: Colors.white.withOpacity(0.8),
            ),
            LinearLayout(
              marginTop: 4,
              orientation: Axis.horizontal,
              crossGravity: CrossAxisAlignment.center,
              children: [
                TextView(
                  text: "2018",
                  textSize: 14,
                  textColor: Colors.white.withOpacity(0.5),
                ),
                YMRView(
                  padding: 4,
                  borderRadius: 8,
                  background: Colors.white.withOpacity(0.5),
                  marginHorizontal: 12,
                ),
                TextView(
                  text: "TV Series",
                  textSize: 14,
                  textColor: Colors.white.withOpacity(0.5),
                ),
                YMRView(
                  padding: 4,
                  borderRadius: 8,
                  background: Colors.white.withOpacity(0.5),
                  marginHorizontal: 12,
                ),
                TextView(
                  text: "20m 13s",
                  textSize: 14,
                  textColor: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
            TextView(
              marginTop: 8,
              text: data.description,
              textColor: Colors.white.withOpacity(0.8),
              textSize: 16,
              maxLines: 2,
              maxCharacters: 120,
              ellipsis: "... Show more",
            ),
          ],
        ),
        BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (index) {},
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: "My List",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.thumb_up_alt_outlined,
              ),
              label: "Vote",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_outlined,
              ),
              label: "Comment",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.share_outlined,
              ),
              label: "Share",
            ),
          ],
        ),
        LinearLayout(
          children: [
            LinearLayout(
              orientation: Axis.horizontal,
              crossGravity: CrossAxisAlignment.center,
              paddingVertical: 12,
              paddingHorizontal: 16,
              children: [
                TextView(
                  paddingBottom: 8,
                  controller: controller.tvEpisodes,
                  activated: controller.tabIndex == 0,
                  text: "Episodes",
                  textColorState: const ValueState(
                    primary: Colors.grey,
                    secondary: Colors.white,
                  ),
                  textFontWeightState: const ValueState(
                    primary: FontWeight.normal,
                    secondary: FontWeight.w500,
                  ),
                  textSize: 14,
                  borderBottom: 2,
                  borderColorState: const ValueState(
                    primary: Colors.transparent,
                    secondary: Colors.redAccent,
                  ),
                  marginEnd: 16,
                ),
                TextView(
                  paddingBottom: 8,
                  controller: controller.tvRelative,
                  activated: controller.tabIndex == 1,
                  text: "More Like This",
                  textColorState: const ValueState(
                    primary: Colors.grey,
                    secondary: Colors.white,
                  ),
                  textFontWeightState: const ValueState(
                    primary: FontWeight.normal,
                    secondary: FontWeight.w500,
                  ),
                  textSize: 14,
                  borderBottom: 2,
                  borderColorState: const ValueState(
                    primary: Colors.transparent,
                    secondary: Colors.redAccent,
                  ),
                  marginEnd: 16,
                ),
              ],
            ),
            IndexedStack(
              index: controller.tabIndex,
              children: [
                LinearLayout(
                  children: [
                    DropdownView(
                      visibility: false,
                      width: double.infinity,
                      background: Colors.white.t20,
                      marginHorizontal: 16,
                      borderRadius: 12,
                      trailingIcon: Icons.keyboard_arrow_down,
                      trailingIconTint: Colors.white,
                      leadingIconVisible: false,
                      paddingStart: 16,
                      items: const [
                        DropdownItem(value: 1, name: "Season 1"),
                      ],
                    ),
                    BlocBuilder<MovieLatestController, DataResponse<Movie>>(
                      builder: (context, response) {
                        return RecyclerView(
                          paddingHorizontal: 12,
                          scrollingType: ViewScrollingType.bouncing,
                          width: double.infinity,
                          items: response.isLoading
                              ? List.generate(10, (index) => Movie())
                              : response.result,
                          spaceBetween: 8,
                          builder: (index, content) {
                            if (response.isLoading) {
                              return const ItemEpisodePlaceholder();
                            }
                            return GestureDetector(
                              onTap: () {
                                AppNavigator.of(context).push(
                                  PlayerScreens.route,
                                  flag: Flag.replacement,
                                  arguments: {
                                    "data": content,
                                  },
                                );
                              },
                              child: ItemEpisode(
                                data: content,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                BlocBuilder<MovieLatestController, DataResponse<Movie>>(
                  builder: (context, response) {
                    return RecyclerView(
                      paddingHorizontal: 12,
                      layoutType: RecyclerLayoutType.grid,
                      snapCount: 2,
                      scrollingType: ViewScrollingType.bouncing,
                      width: double.infinity,
                      items: response.isLoading
                          ? List.generate(10, (index) => Movie())
                          : response.result.reversed.toList(),
                      spaceBetween: 8,
                      builder: (index, content) {
                        if (response.isLoading) {
                          return const ItemRelativePlaceholder();
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
                          child: ItemRelative(
                            video: content,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
