import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_page.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_text_section.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_title_section.dart';

class MemoDetailBody extends HookConsumerWidget {
  const MemoDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title =
        ref.watch(memoDetailPageProvider.select((value) => value.title));
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty) ...[
              const MemoDetailTitleSection(),
              const Divider(height: 1)
            ],
            const MemoDetailTextSection(),
          ],
        ),
      ),
    );
  }
}
