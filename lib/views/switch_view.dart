part of '../widgets.dart';

class SwitchView extends YMRView<SwitchViewController> {
  final String title;
  final ViewToggleContent<String> summary;

  const SwitchView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    ///
    ///
    ///
    ///
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
    super.dimensionRatio,
    super.enabled,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,

    /// LISTENER & CALLBACKS
    super.onToggle,
    super.onActivator,
    required this.title,
    this.summary = const ViewToggleContent(active: ""),
    bool value = false,
  }) : super(activated: value);

  @override
  SwitchViewController initController() {
    return SwitchViewController();
  }

  @override
  SwitchViewController attachController(SwitchViewController controller) {
    return controller.fromSwitchView(this);
  }

  @override
  Widget? attach(BuildContext context, SwitchViewController controller) {
    Color mTC = Colors.black;
    double mTS = 18;
    double mSS = 12;
    String mSummary = summary.detect(controller.activated);
    return SettingTile(
      onClick: (context) => controller.onNotifyToggleWithActivator(),
      header: RawTextView(
        text: title,
        textSize: mTS,
        textColor: mTC,
      ),
      body: mSummary.isNotEmpty
          ? RawTextView(
              text: mSummary,
              textSize: mSS,
              textColor: mTC.withOpacity(0.5),
            )
          : null,
      tailing: controller.isIndicatorVisible
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            )
          : SwitchButton(value: controller.activated),
    );
  }
}

class SwitchViewController extends ViewController {
  SwitchViewController fromSwitchView(SwitchView view) {
    super.fromView(view);
    return this;
  }
}
