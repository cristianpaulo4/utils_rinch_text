import 'package:flutter/material.dart';
import 'package:utils_rinch_text/utils_rinch_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textExample = """
  Flutter is an open source mobile app development framework *created by Google.* 
  It enables the creation of native apps for *iOS and Android* with a single Dart code base. 
  With its flexible and performant architecture, *Flutter has become one of the most 
  popular options for building mobile apps.* In addition, it offers a wide range of widgets 
  and animated visual effects that help you create attractive and intuitive applications. <p>
  For more information about Flutter, head over to the main 
  page at <a>https://flutter.dev/<a> and start exploring the possibilities 
  of this powerful app development tool.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: UtilsRinchText.generate(textExample),
          ),
        ),
      ),
    );
  }
}
