class AppContents {
  const AppContents._();

  /// LOGO's
  static String logoVertical = "log_vertical.svg".fromSvg;
  static String logoHorizontal = "logo_horizontal.svg".fromSvg;

  static final String txtAnalyticaRtc = "txt_analytica_rtc.svg".fromSvg;

  /// ICON's
  static final String analyticaRtcBold = "ic_analytica_rtc_bold.svg".fromIcons;
  static final String icApiDocRegular = "ic_api_doc_regular.svg".fromIcons;
  static final String icFacebookSolid = "ic_facebook_solid.svg".fromIcons;
  static final String icGithub = "ic_github.svg".fromIcons;
  static final String icGoogle = "ic_google.svg".fromIcons;
  static final String icInstagramRegular = "ic_instagram_regular.svg".fromIcons;
  static final String icInstagramSolid = "ic_instagram_solid.svg".fromIcons;
  static final String icLinkedInSolid = "ic_linked_in_solid.svg".fromIcons;
  static final String icXRegular = "ic_x_regular.svg".fromIcons;
  static final String icYoutubeSolid = "ic_youtube_solid.svg".fromIcons;
}

extension StringExtension on String {
  String get fromContents => "assets/contents/$this";

  String get fromIcons => "assets/icons/$this";

  String get fromImages => "assets/images/$this";

  String get fromSvg => "assets/svg/$this";
}
