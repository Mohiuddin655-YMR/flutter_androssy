part of 'view.dart';

class SettingsTailingSwitch extends StatelessWidget {
  final SettingsViewController controller;

  const SettingsTailingSwitch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AndrossySwitch(
      value: controller.activated,
      config: controller.switchConfig,
    );
  }
}
