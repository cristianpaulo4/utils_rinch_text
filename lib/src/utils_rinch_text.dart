import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilsRinchText {
  /// This method returns a list of TextSpan ideal for formatting long text
  /// this implementation supports the following tags, see example.
  ///
  /// \*bold text\*
  ///
  /// \<a>Link web\<a>
  ///
  /// \<p>add paragraph\<p>

  static List<InlineSpan>? generate(String text) {
    List<InlineSpan>? textSpanList = [];

    List textList = text.split(" ");

    bool controlerBold = false;
    bool controlerLink = false;

    for (String element in textList) {
      if (element.startsWith("*") || controlerBold) {
        textSpanList.add(_textBold(element.replaceAll("*", "")));

        if (element.endsWith("*")) {
          controlerBold = false;
        } else {
          controlerBold = true;
        }
      } else if (element.startsWith("<a>") || controlerLink) {
        textSpanList.add(_textLink(element.replaceAll("<a>", "")));
        if (element.endsWith("<a>")) {
          controlerLink = false;
        } else {
          controlerLink = true;
        }
      } else {
        if (element.contains("<p>")) {
          textSpanList.add(_spacer);
        }
        textSpanList.add(_textSpan(element.replaceAll("<p>", "")));
      }
    }
    return textSpanList;
  }

  static TextSpan get _spacer => const TextSpan(text: "\n");

  static TextSpan _textSpan(String text) => TextSpan(
        text: "$text ",
        style: const TextStyle(height: 1.8),
      );

  static TextSpan _textBold(String text) => TextSpan(
        text: "$text ",
        style: const TextStyle(
          height: 1.8,
          fontWeight: FontWeight.bold,
        ),
      );

  static TextSpan _textLink(url) => TextSpan(
        text: "$url ",
        style: const TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            final Uri uri = Uri.parse(url);
            launchUrl(uri);
          },
      );
}
