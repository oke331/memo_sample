import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_page.dart';

class MemoDetailTextSection extends HookConsumerWidget {
  const MemoDetailTextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text =
        ref.watch(memoDetailPageProvider.select((value) => value.text));
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(text),
    );
  }
}
