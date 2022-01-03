import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'memo_detail_page.dart';

class MemoDetailTitleSection extends HookConsumerWidget {
  const MemoDetailTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title =
        ref.watch(memoDetailPageProvider.select((value) => value.title));
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
