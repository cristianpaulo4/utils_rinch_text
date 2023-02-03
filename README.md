This method returns a list of TextSpan ideal for formatting long text
this implementation supports the following tags, see example.


\<a>Link web\<a>  
\<p> add paragraph

![Captura de tela 2023-02-03 195339](https://user-images.githubusercontent.com/45492072/216726806-91313116-297d-4147-928d-f37e635d3268.png)

Add custom tags

## Text de example:
```dart
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
```

## Implementation
```dart
RichText(
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
```