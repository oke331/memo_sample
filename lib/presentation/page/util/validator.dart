import 'package:flutter/material.dart';
import 'package:memo_sample/generated/l10n.dart';

class Validator {
  static String? memoTitle({
    required String? value,
    required BuildContext context,
  }) {
    if (value != null && value.characters.length > 10000) {
      return S.of(context).titleLimited;
    }
    return null;
  }

  static String? memoText({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return S.of(context).required;
    }

    if (value.characters.length > 100000) {
      return S.of(context).textLimited;
    }
    return null;
  }
}
