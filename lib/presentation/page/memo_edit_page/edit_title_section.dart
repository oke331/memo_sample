import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_page.dart';

class EditTitleSection extends HookConsumerWidget {
  const EditTitleSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(memoEditPageTitleControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: S.of(context).title,
        ),
      ),
    );
  }
}
