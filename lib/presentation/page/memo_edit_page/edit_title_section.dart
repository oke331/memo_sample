import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_page.dart';
import 'package:memo_sample/presentation/page/util/validator.dart';

class EditTitleSection extends HookConsumerWidget {
  const EditTitleSection({Key? key}) : super(key: key);

  static const textFormFieldKey = ValueKey('EditTitleSectionTextFormField');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(memoEditPageTitleControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        key: textFormFieldKey,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: S.of(context).title,
        ),
        maxLines: null,
        validator: (value) => Validator.memoTitle(
          value: value,
          context: context,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
