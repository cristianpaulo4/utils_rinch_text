import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilsRinchText {
  /// This method returns a list of TextSpan ideal for formatting long text
  /// this implementation supports the following tags, see example.
  /// \<a>Link web\<a>

  static List<InlineSpan>? generate(
    String text, {
    Map<String, TextStyle>? customTags,
  }) {
    List<InlineSpan>? textSpanList = [];
    List textList = text.split(" ");
    TextStyle? style;
    String? tagCustom;
    String? textSpan;
    bool isLink = false;

    for (String element in textList) {
      if (element.length > 3 && customTags != null) {
        if (element.startsWith("<")) {
          tagCustom = element.substring(0, 3);
          style = customTags[tagCustom];
        }
      }
      if (element == "<p>") {
        textSpanList.add(_spacer);
      }
      isLink = element.startsWith("<a>");

      if (tagCustom != null) {
        textSpan = element.replaceAll(tagCustom, "").replaceAll("<p>", "");
      } else {
        textSpan = element.replaceAll("<p>", "");
      }

      if (isLink) {
        textSpanList.add(
          _textLink(
            textSpan,
            style: style,
          ),
        );
      } else {
        textSpanList.add(
          _textSpanCustom(
            textSpan,
            style: style,
          ),
        );
      }

      if (element.trim().endsWith(">")) {
        style = null;
        isLink = false;
      }
    }
    return textSpanList;
  }

  static TextSpan get _spacer => const TextSpan(text: "\n");

  static TextSpan _textSpanCustom(String text, {TextStyle? style}) => TextSpan(
        text: "$text ",
        style: style,
      );

  static TextSpan _textLink(String url, {TextStyle? style}) => TextSpan(
        text: "$url ",
        style: style ??
            const TextStyle(
              color: Colors.blue,
            ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            final Uri uri = Uri.parse(url.trim());
            launchUrl(uri);
          },
      );
}
