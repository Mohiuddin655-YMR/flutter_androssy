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
      home: Scaffold(
        body: LinearLayout(
          background: Colors.green.shade50,
          layoutGravity: LayoutGravity.center,
          gravity: Alignment.center,
          children:  [
            TextView(
              ripple: 50,
              onClick: (c){},
              width: 120,
              gravity: Alignment.center,
              background: Colors.white,
              border: 2,
              rippleColor: Colors.white,
              borderColor: Colors.green,
              paddingVertical: 12,
              paddingHorizontal: 24,
              text: "Filled",
              borderRadiusTL: 8,
              borderRadiusTR: 8,
              borderRadiusBL: 8,
              borderRadiusBR: 8,
            ),
            TextView(
              onClick: (c){},
              width: 120,
              gravity: Alignment.center,
              marginTop: 8,
              borderRadius: 8,
              border: 3,
              borderColor: Colors.red,
              //background: Colors.green,
              paddingVertical: 12,
              paddingHorizontal: 24,
              text: "Border",
            ),
          ],
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextView"),
      ),
      body: const TextView(
        scrollable: true,
        padding: 24,
        // extraText: "(৳500) ",
        // extraTextColor: Colors.grey,
        // extraTextDecoration: TextDecoration.lineThrough,
        // extraTextDecorationColor: Colors.grey,
        // extraTextDecorationThickness: 1,
        // extraTextSize: 12,
        // extraTextStyle: FontStyle.italic,
        text:
            "Japan is the eleventh most populous country in the world, as well as one of the most densely populated. About three-fourths of the country's terrain is mountainous, concentrating its highly urbanized population on narrow coastal plains. Japan is divided into 47 administrative prefectures and eight traditional regions. The Greater Tokyo Area is the most populous metropolitan area in the world. Japan has the world's highest life expectancy, though it is experiencing a population decline. \n\nJapan has been inhabited since the Upper Paleolithic period (30,000 BC). Between the 4th and 9th centuries, the kingdoms of Japan became unified under an emperor and the imperial court based in Heian-kyō. Beginning in the 12th century, political power was held by a series of military dictators (shōgun) and feudal lords (daimyō) and enforced by a class of warrior nobility (samurai). After a century-long period of civil war, the country was reunified in 1603 under the Tokugawa shogunate, which enacted an isolationist foreign policy. In 1854, a United States fleet forced Japan to open trade to the West, which led to the end of the shogunate and the restoration of imperial power in 1868. In the Meiji period, the Empire of Japan adopted a Western-modeled constitution and pursued a program of industrialization and modernization. Amidst a rise in militarism and overseas colonization, Japan invaded China in 1937 and entered World War II as an Axis power in 1941. After suffering defeat in the Pacific War and two atomic bombings, Japan surrendered in 1945 and came under a seven-year Allied occupation, during which it adopted a new constitution. \n\nUnder the 1947 constitution, Japan has maintained a unitary parliamentary constitutional monarchy with a bicameral legislature, the National Diet. Japan is a developed country and a great power, having one of the highest gross domestic product per capita, with one of the largest domestic product base. Japan has renounced its right to declare war, though it maintains a Self-Defense Force that rank as one of the world's strongest militaries. A global leader in the automotive, robotics, and electronics industries, the country has made significant contributions to science and technology. It is part of multiple major international and intergovernmental institutions. \n\nJapan is considered a cultural superpower as the culture of Japan is well known around the world, including its art, cuisine, film, music, and popular culture, which encompasses prominent manga, anime, and video game industries.",
        //text: "৳600 ",
        textSize: 14,
        //textColor: Colors.green,
        //fontWeight: FontWeight.bold,
      ),
    );
  }
}
