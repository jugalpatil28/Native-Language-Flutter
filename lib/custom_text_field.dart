import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class CustomTextField {

  final double outPrefixSvgWidth;
  final double outPrefixSvgHeight;
  final int outPrefixSvgColor;
  EdgeInsets margin;
  final TextEditingController inputBoxController;
  final bool isPassword;
  final TextInputType keyBoardType;
  final TextAlign textAlign;
  final Widget prefix;
  final Widget suffix;
  final int textColor;
  final String textFont;
  final double textSize;
  final bool clickable;
  final int maxLength;

  CustomTextField(
      {
        this.outPrefixSvgWidth = 22.0,
        this.outPrefixSvgHeight = 22.0,
        this.outPrefixSvgColor,
        this.margin,
        this.inputBoxController,
        this.isPassword = false,
        this.keyBoardType = TextInputType.text,
        this.prefix ,
        this.suffix ,
        this.textColor = 0xFF757575,
        this.textFont = "",
        this.textSize = 12.0,
        this.clickable = true,
        this.maxLength = 0,
        this.textAlign = TextAlign.left});

  Widget textFieldWithOutPrefix(String hint, String errorMsg) {
    Widget loginBtn = Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textField(hint, errorMsg),
        ],
      ),
    );

    return loginBtn;
  }

  Widget textField(String hint, String errorMsg) {
//    FocusNode focusNode =
//    focusNod != null ? focusNod : new FocusNode();

    List<TextInputFormatter> list = maxLength == 0 ? null:[
      LengthLimitingTextInputFormatter(maxLength),
    ];
    Widget loginBtn =
    Expanded(
          child: TextFormField(
            obscureText: isPassword,
            controller: inputBoxController,
            keyboardType: keyBoardType,
            enabled: clickable,
            textAlign: textAlign,
            inputFormatters: list,
            decoration: InputDecoration(
              labelText: hint,
              hintText: hint,
              prefixIcon: prefix,
              suffixIcon: suffix,
            ),
            validator: (val) => val.isEmpty ? errorMsg : null,
            onSaved: (val) => val,
          ),
          flex: 6,
        );

    return loginBtn;
  }
}
