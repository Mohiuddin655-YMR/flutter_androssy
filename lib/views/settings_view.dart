import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/raw.dart';
import 'package:flutter_androssy/views/switch_view.dart';
import 'package:flutter_androssy/widgets.dart';

enum SettingsViewType {
  arrow,
  checkmark,
  switcher,
  none;

  bool get isArrow => this == SettingsViewType.arrow;

  bool get isCheckmark => this == SettingsViewType.checkmark;

  bool get isSwitcher => this == SettingsViewType.switcher;

  bool get isNone => this == SettingsViewType.none;
}

class SettingsView extends YMRView<SettingsViewController> {
  final dynamic icon;
  final String title;
  final String? summary;
  final ValueState<String>? summaryState;
  final SettingsViewType type;
  final SwitchButtonConfig switchConfig;

  const SettingsView({
    super.key,
    super.activated,
    super.enabled,
    super.rippleColor,
    super.pressedColor,
    this.icon,
    required this.title,
    this.summary,
    this.summaryState,
    super.onClick,
    super.onToggle,
  })  : type = SettingsViewType.none,
        switchConfig = const SwitchButtonConfig();

  const SettingsView.switcher({
    super.key,
    super.activated,
    super.enabled,
    super.rippleColor,
    super.pressedColor,
    this.icon,
    required this.title,
    this.summary,
    this.summaryState,
    super.onClick,
    super.onToggle,
    this.switchConfig = const SwitchButtonConfig(),
  }) : type = SettingsViewType.switcher;

  @override
  SettingsViewController initController() {
    return SettingsViewController();
  }

  @override
  SettingsViewController attachController(controller) {
    return controller.fromSettingsView(this);
  }

  @override
  Widget? attach(context, controller) {
    var mTT = context.textTheme;

    return SettingTile(
      background: Colors.transparent,
      rippleColor: Colors.transparent,
      pressedColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      header: RawTextView(
        text: controller.title,
        textStyle: controller.titleStyle ?? mTT.titleMedium!,
      ),
      body: TextView(
        visibility: controller.summary?.isNotEmpty ?? false,
        text: controller.summary,
        textStyle: controller.summaryStyle ?? mTT.titleSmall!,
      ),
      leading: IconView(
        visibility: controller.icon != null,
        icon: controller.icon,
        size: context.iconTheme.size ?? 24,
        tint: context.iconTheme.color,
        marginEnd: 24,
      ),
      tailing: AbsorbPointer(
        child: SettingsTailingView(controller: controller),
      ),
    );
  }
}

class SettingsTailingView extends StatelessWidget {
  final SettingsViewController controller;

  const SettingsTailingView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    switch (controller.type) {
      case SettingsViewType.arrow:
        return const SettingsTailingArrow();

      case SettingsViewType.checkmark:
        return const SettingsTailingCheckmark();

      case SettingsViewType.switcher:
        return SettingsTailingSwitch(controller: controller);

      default:
        return const SizedBox(
          width: 26,
          height: 40,
        );
    }
  }
}

class SettingsTailingArrow extends StatelessWidget {
  const SettingsTailingArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 26,
      height: 40,
    );
  }
}

class SettingsTailingCheckmark extends StatelessWidget {
  const SettingsTailingCheckmark({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 26,
      height: 40,
    );
  }
}

class SettingsTailingSwitch extends StatelessWidget {
  final SettingsViewController controller;

  const SettingsTailingSwitch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchButton(
      value: controller.activated,
      enabled: controller.enabled,
      config: controller.switchConfig,
    );
  }
}

class SettingsViewController extends ViewController {
  dynamic icon;
  String? title;
  TextStyle? titleStyle;

  String? _summary;
  ValueState<String>? summaryState;
  TextStyle? summaryStyle;

  SettingsViewType type = SettingsViewType.none;

  SwitchButtonConfig switchConfig = const SwitchButtonConfig();

  SettingsViewController fromSettingsView(SettingsView view) {
    super.fromView(view);
    title = view.title;
    summary = view.summary;
    summaryState = view.summaryState;
    icon = view.icon;
    type = view.type;
    switchConfig = view.switchConfig;
    return this;
  }

  String? get summary => summaryState?.fromController(this) ?? _summary;

  set summary(String? value) => _summary = value;

  void setSummary(String? value) {
    onNotifyWithCallback(() => summary = value);
  }
}
