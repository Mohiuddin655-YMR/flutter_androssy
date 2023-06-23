part of '../widgets.dart';

class SplashView extends StatefulWidget {
  final int duration;
  final EdgeInsetsGeometry? contentPadding;
  final Color? statusBarColor;
  final Brightness statusBarBrightness;
  final Widget? home;
  final Widget? custom;
  final String? title, subtitle;
  final Color? titleColor, subtitleColor;
  final double titleExtraSize, subtitleExtraSize;
  final EdgeInsetsGeometry? titlePadding, subtitleMargin;
  final double? titleSize, subtitleSize;
  final TextStyle titleStyle;
  final TextStyle? subtitleStyle;
  final FontWeight? titleWeight, subtitleWeight;
  final String? logo;
  final Color? logoColor;
  final EdgeInsetsGeometry? logoPadding;
  final double? logoSize;
  final Gravity gravity;
  final ContentGravity? contentGravity;

  final Future Function()? onExecute;
  final Function(BuildContext context)? onRoute;

  const SplashView({
    Key? key,
    this.gravity = Gravity.center,
    this.contentGravity,
    this.contentPadding,
    this.duration = 5000,
    this.statusBarColor = Colors.white,
    this.statusBarBrightness = Brightness.dark,
    this.home,
    this.custom,
    this.onRoute,
    this.onExecute,
    this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.titleExtraSize = 1,
    this.subtitleExtraSize = 1,
    this.titlePadding,
    this.subtitleMargin,
    this.titleSize,
    this.subtitleSize,
    this.titleStyle = const TextStyle(),
    this.subtitleStyle,
    this.titleWeight = FontWeight.bold,
    this.subtitleWeight,
    this.logo,
    this.logoColor,
    this.logoPadding,
    this.logoSize,
  }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    if (widget.onExecute != null) {
      widget.onExecute?.call().whenComplete(() => _route());
    } else {
      Timer(Duration(milliseconds: widget.duration), () => _route());
    }
    super.initState();
  }

  _route() {
    if (widget.onRoute == null && widget.home != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.home!),
        (route) => false,
      );
    } else {
      widget.onRoute?.call(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pixel = sqrt((size.width * size.width) + (size.height * size.height));
    final logoSize = pixel * 0.10;
    final titleSize = pixel * 0.02;
    final titlePaddingTop = pixel * 0.02;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: widget.statusBarColor,
          statusBarIconBrightness: widget.statusBarBrightness,
          statusBarBrightness: widget.statusBarBrightness,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Expanded(
          child: Column(
            mainAxisAlignment: widget.gravity.main,
            crossAxisAlignment: widget.gravity.cross,
            children: [
              Container(
                padding: widget.contentPadding,
                child: widget.custom ??
                    Column(
                      mainAxisAlignment:
                          widget.contentGravity?.main ?? widget.gravity.main,
                      crossAxisAlignment:
                          widget.contentGravity?.cross ?? widget.gravity.cross,
                      children: [
                        Container(
                          margin: widget.logoPadding,
                          child: Image.asset(
                            widget.logo ?? "",
                            width: widget.logoSize ?? logoSize,
                            height: widget.logoSize ?? logoSize,
                          ),
                        ),
                        Container(
                          margin: widget.titlePadding ??
                              EdgeInsets.only(
                                top: titlePaddingTop,
                              ),
                          child: Text(
                            widget.title ?? "",
                            textAlign: TextAlign.center,
                            style: widget.titleStyle.copyWith(
                              color: widget.titleColor,
                              fontSize: widget.titleSize ?? titleSize,
                              fontWeight: widget.titleWeight,
                              letterSpacing: widget.titleExtraSize / 10,
                            ),
                          ),
                        ),
                        Container(
                          padding: widget.subtitleMargin,
                          child: Text(
                            widget.subtitle ?? "",
                            textAlign: TextAlign.center,
                            style: (widget.subtitleStyle ?? widget.titleStyle)
                                .copyWith(
                              color: widget.subtitleColor,
                              fontSize: widget.subtitleSize ??
                                  ((widget.titleSize ?? titleSize) * 0.5),
                              fontWeight: widget.subtitleWeight,
                              letterSpacing: widget.subtitleExtraSize / 10,
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Gravity {
  center(main: MainAxisAlignment.center, cross: CrossAxisAlignment.center),
  centerStart(main: MainAxisAlignment.center, cross: CrossAxisAlignment.start),
  centerEnd(main: MainAxisAlignment.center, cross: CrossAxisAlignment.end),
  centerTop(main: MainAxisAlignment.start, cross: CrossAxisAlignment.center),
  centerBottom(main: MainAxisAlignment.end, cross: CrossAxisAlignment.center),
  topStart(main: MainAxisAlignment.start, cross: CrossAxisAlignment.start),
  topEnd(main: MainAxisAlignment.start, cross: CrossAxisAlignment.end),
  bottomStart(main: MainAxisAlignment.end, cross: CrossAxisAlignment.start),
  bottomEnd(main: MainAxisAlignment.end, cross: CrossAxisAlignment.end);

  final MainAxisAlignment main;
  final CrossAxisAlignment cross;

  const Gravity({
    required this.main,
    required this.cross,
  });
}

enum ContentGravity {
  center(main: MainAxisAlignment.center, cross: CrossAxisAlignment.center),
  start(main: MainAxisAlignment.center, cross: CrossAxisAlignment.start),
  end(main: MainAxisAlignment.center, cross: CrossAxisAlignment.end);

  final MainAxisAlignment main;
  final CrossAxisAlignment cross;

  const ContentGravity({
    required this.main,
    required this.cross,
  });
}
