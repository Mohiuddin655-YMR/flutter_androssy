enum SubscriptionScreens {
  none("subscription", "Subscription");

  final String name;
  final String title;

  static String get route => none.name;

  const SubscriptionScreens(this.name, this.title);
}
