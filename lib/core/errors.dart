part of 'core.dart';

const _providerError = """
void main() {
  //...
  runApp(AndrossyProvider<Settings>(
    data: Settings(),
    child: MyApp(),
  ));
}
""";
