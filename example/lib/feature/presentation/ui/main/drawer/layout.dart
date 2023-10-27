import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../../index.dart';

class HomeActivityDrawer extends StatelessWidget {
  final DrawerSelectionType currentSelection;
  final OnViewItemClickListener<DrawerSelectionType> onSelectionChange;
  final String Function(String value) translate;

  const HomeActivityDrawer({
    super.key,
    required this.translate,
    required this.currentSelection,
    required this.onSelectionChange,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      widthMax: 280,
      widthMin: 200,
      height: double.infinity,
      scrollable: true,
      background: context.appBarTheme.backgroundColor,
      children: [
        const HomeDrawerHeader(),
        const Divider(),
        HomeDrawerButton(
          isSelected: currentSelection.isShows,
          text: translate("Shows"),
          icon: Icons.videocam_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.shows),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isBoom,
          text: translate("Boom"),
          icon: Icons.star_border_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.boom),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isKids,
          text: translate("Kids"),
          icon: Icons.child_care,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.kids),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isMusic,
          text: translate("Music"),
          icon: Icons.music_note_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.music),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isClips,
          text: translate("Clips"),
          icon: Icons.ads_click,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.clips),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isDiscover,
          text: translate("Discover"),
          icon: Icons.explore_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.discover),
        ),
        const Divider(),
        HomeDrawerButton(
          isSelected: currentSelection.isMyAccount,
          text: translate("My Account"),
          icon: Icons.account_circle_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.myAccount),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isMyWatchlist,
          text: translate("My Watchlist"),
          icon: Icons.list_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.myWatchlist),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isBuyPremium,
          text: translate("Buy Premium"),
          icon: Icons.wallet_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.buyPremium),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isDownloads,
          text: translate("Downloads"),
          icon: Icons.download_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.downloads),
        ),
        const Divider(),
        HomeDrawerButton(
          isSelected: currentSelection.isAppSettings,
          text: translate("App Settings"),
          icon: Icons.settings_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.appSettings),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isLanguage,
          text: translate("Language"),
          icon: Icons.language_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.language),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isHelpAndSupport,
          text: translate("Help & Support"),
          icon: Icons.help_outline,
          onClick: (_) => onSelectionChange(
            _,
            DrawerSelectionType.helpAndSupport,
          ),
        ),
        HomeDrawerButton(
          isSelected: currentSelection.isRateUs,
          text: translate("Rate Us"),
          icon: Icons.star_border_outlined,
          onClick: (_) => onSelectionChange(_, DrawerSelectionType.rateUs),
        ),
        const Divider(),
        HomeDrawerFooter(
          translate: translate,
          onSignIn: (_) {
            Navigator.pop(context);
          },
          onSignUp: (_) {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
