import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_page.dart';
import 'package:memo_sample/presentation/page/util/validator.dart';

class EditTextSection extends HookConsumerWidget {
  const EditTextSection({Key? key}) : super(key: key);

  static const textFormFieldKey = ValueKey('EditTextSectionTextFormField');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(memoEditPageTextControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        key: textFormFieldKey,
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: S.of(context).text,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => Validator.memoText(
          value: value,
          context: context,
        ),
      ),
    );
  }
}
