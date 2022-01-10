import 'package:flutter/material.dart';
import 'package:memo_sample/generated/l10n.dart';

class Validator {
  static String? memoText({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return S.of(context).required;
    }
    return null;
  }
}
