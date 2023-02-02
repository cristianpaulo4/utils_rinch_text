This method returns a list of TextSpan ideal for formatting long text
this implementation supports the following tags, see example.
  
\*bold text\*  
\<a>Link web\<a>  
\<p>add paragraph\<p>

![Captura de tela 2023-02-02 180728](https://user-images.githubusercontent.com/45492072/216449815-b733bd09-4ffd-4743-90ee-cb375376881b.png)

## Text de example:
```dart
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
```

## Implementation
```dart
RichText(
    text: TextSpan(
      children: UtilsRinchText.generate(textExample),
    ),
),
```