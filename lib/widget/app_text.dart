import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines,
    this.textAlign,
    // this.absorbClickForWebText = true,
    this.containsHtml = false,
    this.isAutoSize = false,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  // final bool absorbClickForWebText;
  final bool containsHtml;
  final bool isAutoSize;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    HtmlUnescape? unescape;
    if (containsHtml) {
      unescape = HtmlUnescape();
    }
    return isAutoSize
        ? AutoSizeText(
            containsHtml ? unescape?.convert(text) ?? "HtmlUnescape Error" : text,
            style: style,
            maxLines: maxLines,
            minFontSize: 8,
            overflow: overflow,
            textAlign: textAlign,
          )
        : true || GetPlatform.isMobile
            ? Text(
                containsHtml ? unescape?.convert(text) ?? "HtmlUnescape Error" : text,
                style: style,
                maxLines: maxLines,
                overflow: overflow,
                textAlign: textAlign,
              )
            : AbsorbPointer(
                // absorbing: absorbClickForWebText,
                absorbing: true,
                child: SelectableText(
                  containsHtml ? unescape?.convert(text) ?? "HtmlUnescape Error" : text,
                  style: style,
                  maxLines: maxLines,
                  textAlign: textAlign,
                ),
              );
  }
}
