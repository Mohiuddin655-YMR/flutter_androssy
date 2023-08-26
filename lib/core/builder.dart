part of '../core.dart';

typedef AndrossyViewBuilder = Widget Function(
  BuildContext context,
  Androssy androssy,
);

class AndrossyBuilder extends StatelessWidget {
  final AndrossyViewBuilder builder;
  final String? message;

  const AndrossyBuilder({
    super.key,
    required this.builder,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.find();
    if (provider != null) {
      return ValueListenableBuilder(
        valueListenable: provider.notifier,
        builder: (context, value, old) => builder(context, value),
      );
    } else {
      throw UnimplementedError(message ?? "Androssy provider not found!");
    }
  }
}
