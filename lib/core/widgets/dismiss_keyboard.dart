import 'package:flutter/material.dart';

class DismissKeyboard {
  static exec(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
