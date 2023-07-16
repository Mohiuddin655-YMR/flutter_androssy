import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Androssy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  TextViewController textController = TextViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextView"),
      ),
      body: TextView(
        controller: textController,
        expandable: true,
        padding: 24,
        text:
            "Japan is the eleventh most populous country in the world, as well as one of the most densely populated. About three-fourths of the country's terrain is mountainous, concentrating its highly urbanized population on narrow coastal plains. Japan is divided into 47 administrative prefectures and eight traditional regions. The Greater Tokyo Area is the most populous metropolitan area in the world. Japan has the world's highest life expectancy, though it is experiencing a population decline. \n\nJapan has been inhabited since the Upper Paleolithic period (30,000 BC). Between the 4th and 9th centuries, the kingdoms of Japan became unified under an emperor and the imperial court based in Heian-kyō. Beginning in the 12th century, political power was held by a series of military dictators (shōgun) and feudal lords (daimyō) and enforced by a class of warrior nobility (samurai). After a century-long period of civil war, the country was reunified in 1603 under the Tokugawa shogunate, which enacted an isolationist foreign policy. In 1854, a United States fleet forced Japan to open trade to the West, which led to the end of the shogunate and the restoration of imperial power in 1868. In the Meiji period, the Empire of Japan adopted a Western-modeled constitution and pursued a program of industrialization and modernization. Amidst a rise in militarism and overseas colonization, Japan invaded China in 1937 and entered World War II as an Axis power in 1941. After suffering defeat in the Pacific War and two atomic bombings, Japan surrendered in 1945 and came under a seven-year Allied occupation, during which it adopted a new constitution. ",
        textSize: 14,
        textColor: Colors.black,
        maxCharacters: 280,
        ellipsizeTextState: ValueState.active(
          activated: "... Less",
          inactivated: "... More",
        ),
        onEllipsizeClick: (context) {
          textController.onToggleNotify();
        },
        ellipsizeFontWeight: FontWeight.w600,
        ellipsizeTextColorState: ValueState.active(
          activated: Colors.red,
          inactivated: Colors.green,
        ),
      ),
    );
  }
}
