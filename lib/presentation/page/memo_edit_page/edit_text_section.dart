import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_page.dart';

class EditTextSection extends HookConsumerWidget {
  const EditTextSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(memoEditPageTextControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          hintText: S.of(context).text,
        ),
      ),
    );
  }
}
