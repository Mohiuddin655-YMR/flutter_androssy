import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../index.dart';

class MainActivity extends BaseActivity<MainController> {
  const MainActivity({
    super.key,
    super.elevation = 0,
  });

  @override
  MainController init(BuildContext context) {
    return MainController();
  }

  @override
  Widget? onCreateTitle(BuildContext context) {
    if (controller.selectionType.isShows) {
      return const Center(
        child: ImageView(
          image: LogoContent.logo,
          width: 40,
          shape: ViewShape.squire,
        ),
      );
    } else {
      return Center(
        child: Text(
          controller.selectionType.title,
        ),
      );
    }
  }

  @override
  List<Widget>? onCreateActions(BuildContext context) {
    return [
      IconView(
        icon: Icons.search,
        size: 40,
        padding: 8,
        marginEnd: 8,
        shape: ViewShape.circular,
        rippleColor: Colors.white12,
        background: Colors.transparent,
        onClick: (_) {
          if (kDebugMode) {
            print(_);
          }
        },
      ),
    ];
  }

  @override
  Widget? onCreateDrawer(BuildContext context) {
    return HomeActivityDrawer(
      translate: instance.translate,
      currentSelection: controller.selectionType,
      onSelectionChange: controller.onNotifyWithSelection,
    );
  }

  @override
  Widget? onCreateBottomNavigationBar(BuildContext context) {
    var theme = context.bottomNavigationBarTheme;
    return BottomNavigationBar(
      elevation: theme.elevation,
      backgroundColor: theme.backgroundColor,
      currentIndex: controller.index,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: theme.selectedLabelStyle,
      unselectedLabelStyle: theme.unselectedLabelStyle,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: theme.selectedItemColor,
      unselectedItemColor: theme.unselectedItemColor,
      onTap: controller.onNotifyNavigationIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(FluentSystemIcons.ic_fluent_home_regular),
          activeIcon: const Icon(FluentSystemIcons.ic_fluent_home_filled),
          label: translate("Home"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.live_tv_outlined),
          activeIcon: const Icon(Icons.live_tv),
          label: translate("TV"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.movie_creation_outlined),
          activeIcon: const Icon(Icons.movie_creation_rounded),
          label: translate("Movies"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.desktop_mac_outlined),
          activeIcon: const Icon(Icons.desktop_mac),
          label: translate("Drama"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.play_circle_outline),
          activeIcon: const Icon(Icons.play_circle),
          label: translate("Coming Soon"),
        ),
      ],
    );
  }

  @override
  Widget onCreate(context, instance) {
    return IndexedStack(
      index: controller.index,
      children: [
        HomeFragment(translate: translate),
        TVFragment(translate: translate),
        MoviesFragment(translate: translate),
        DramaFragment(translate: translate),
        ComingSoonFragment(translate: translate),
      ],
    );
  }
}