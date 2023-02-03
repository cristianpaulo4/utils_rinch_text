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
  <i>Flutter<i> is an open source mobile app development framework <l>created by Google.<l> 
  It enables the creation of native apps for <i>iOS and Android<i> with a single Dart code base. 
  With its flexible and performant architecture, <o>Flutter has become one of the most 
  popular options for building mobile apps.<o> In addition, it offers a wide range of widgets 
  and animated visual effects that help you create attractive and intuitive applications. <p>
  For more information about Flutter, head over to the main 
  page at <a>https://flutter.dev/<a> and start <b>exploring the possibilities<b> 
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
            children: UtilsRinchText.generate(
              textExample,
              customTags: {
                "<i>": const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                "<l>": const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                "<a>": const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                "<o>": const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
                "<b>": const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 20,
                ),
              },
            ),
          ),
        ),
      ),
    );
  }
}
