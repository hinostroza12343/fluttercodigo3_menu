import 'package:flutter/cupertino.dart';
import 'package:flutter_altoquepez/comon/colors.dart';
import 'package:flutter_altoquepez/comon/typography.dart';

class OurText extends StatelessWidget {
  final String? text;
  final Color? colorText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  OurText({
    required this.text,
    this.colorText,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text!,
      style: TextStyle(
        color: this.colorText,
        fontSize: this.fontSize,
        fontFamily: this.fontFamily,
        fontWeight: this.fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class H1 extends StatelessWidget {
  final String? text;
  H1({required this.text});

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: this.text,
      colorText: COLOR_FONT_PRIMARY,
      fontSize: H1_SIZE,
      fontFamily: 'Source Sans Pro Black',
    );
  }
}

class H2 extends StatelessWidget {
  final String? text;
  H2({required this.text});

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: this.text,
      colorText: COLOR_FONT_SECONDARY,
      fontSize: H2_SIZE,
      fontFamily: 'Source Sans Pro Regular',
    );
  }
}

class TextNormalPrimary extends StatelessWidget {
  final String? text;
  final Color? colorText;
  TextNormalPrimary({required this.text, this.colorText});

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: this.text,
      colorText: colorText,
      fontSize: TITLE_SIZE,
      fontFamily: 'Source Sans Pro Bold',
    );
  }
}
