import 'dart:developer';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Androssy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: TextView(
        background: Colors.white,
        scrollable: true,
        padding: 24,
        margin: 24,
        text:
            "I am an innovative and skilled Flutter developer with a passion for crafting elegant and user-friendly mobile applications. With a strong background in Android app development, I have honed my skills over the past four years, gaining valuable experience in the ever-evolving world of technology.  Throughout my journey as a Flutter developer, I have consistently delivered high-quality and visually appealing apps that provide seamless user experiences. My expertise in the Flutter framework allows me to create cross-platform applications efficiently, reaching a broader audience and maximizing the potential for success.  As an Android app developer, I have actively participated in various projects, ranging from small-scale applications to large, complex projects. Over the years, I have acquired a deep understanding of the Android ecosystem, enabling me to leverage the platform's features to their full potential.  My approach to app development is rooted in a combination of creativity and technical prowess. I strive to create intuitive and visually appealing user interfaces while maintaining a strong focus on code quality and performance optimization. My proficiency in problem-solving and attention to detail enable me to tackle challenges head-on and deliver polished and reliable applications.  In my portfolio, you will find a diverse collection of projects that showcase my versatility and dedication to my craft. Each project reflects my commitment to staying up-to-date with the latest industry trends and best practices, ensuring that my work remains at the forefront of innovation.  I am constantly seeking new opportunities to collaborate and contribute to exciting projects. Whether you're a startup looking to bring a groundbreaking idea to life or an established business in need of a technology refresh, I am ready to take on the challenge and help transform your vision into a reality.  Thank you for visiting my portfolio, and I look forward to connecting with you to discuss how we can work together to create exceptional mobile experiences that make a lasting impact. Let's turn ideas into captivating apps that users will love! \n\n"
            "I am an innovative and skilled Flutter developer with a passion for crafting elegant and user-friendly mobile applications. With a strong background in Android app development, I have honed my skills over the past four years, gaining valuable experience in the ever-evolving world of technology.  Throughout my journey as a Flutter developer, I have consistently delivered high-quality and visually appealing apps that provide seamless user experiences. My expertise in the Flutter framework allows me to create cross-platform applications efficiently, reaching a broader audience and maximizing the potential for success.  As an Android app developer, I have actively participated in various projects, ranging from small-scale applications to large, complex projects. Over the years, I have acquired a deep understanding of the Android ecosystem, enabling me to leverage the platform's features to their full potential.  My approach to app development is rooted in a combination of creativity and technical prowess. I strive to create intuitive and visually appealing user interfaces while maintaining a strong focus on code quality and performance optimization. My proficiency in problem-solving and attention to detail enable me to tackle challenges head-on and deliver polished and reliable applications.  In my portfolio, you will find a diverse collection of projects that showcase my versatility and dedication to my craft. Each project reflects my commitment to staying up-to-date with the latest industry trends and best practices, ensuring that my work remains at the forefront of innovation.  I am constantly seeking new opportunities to collaborate and contribute to exciting projects. Whether you're a startup looking to bring a groundbreaking idea to life or an established business in need of a technology refresh, I am ready to take on the challenge and help transform your vision into a reality.  Thank you for visiting my portfolio, and I look forward to connecting with you to discuss how we can work together to create exceptional mobile experiences that make a lasting impact. Let's turn ideas into captivating apps that users will love!"
            "",
        textSize: 14,
        onClick: (context) => log("onClick"),
        onDoubleClick: (context) => log("onDoubleClick"),
        onLongClick: (context) => log("onLongClick"),
      ),
    );
  }
}
