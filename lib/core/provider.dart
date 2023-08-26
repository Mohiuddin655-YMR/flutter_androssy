part of '../core.dart';

class AndrossyProvider extends InheritedWidget {
  final Androssy androssy;
  final AndrossyConfigure configure;
  final AndrossyLocalizer localizer;
  final AndrossyNotifier<Androssy> notifier;

  AndrossyProvider({
    super.key,
    this.configure = const AndrossyConfigure.none(),
    this.localizer = const AndrossyLocalizer.none(),
    this.androssy = const Androssy(),
    required super.child,
  }) : notifier = AndrossyNotifier(androssy);

  static AndrossyProvider? of<T extends Androssy>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AndrossyProvider>();
  }

  I getInstance<I>() => configure.getInstance<I>();

  @override
  bool updateShouldNotify(covariant AndrossyProvider oldWidget) {
    return notifier.value != oldWidget.notifier.value;
  }

  String localize(String language, String name) {
    return localizer.localize(language, name);
  }

  void notify(Androssy data) => notifier.setValue(data);
}

extension AndrossyContextExtension on BuildContext {
  AndrossyProvider? find() {
    return dependOnInheritedWidgetOfExactType<AndrossyProvider>();
  }

  AndrossyProvider? notify(Androssy data) {
    var provider = dependOnInheritedWidgetOfExactType<AndrossyProvider>();
    if (provider != null) {
      provider.notify(data);
    }
    return provider;
  }
}
