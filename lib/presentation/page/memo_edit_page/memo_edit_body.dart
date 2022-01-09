import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/edit_text_section.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/edit_title_section.dart';

class MemoEditBody extends HookConsumerWidget {
  const MemoEditBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              EditTitleSection(),
              Divider(height: 1),
              EditTextSection(),
            ],
          ),
        ),
      ),
    );
  }
}
