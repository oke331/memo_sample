import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_page.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_text_section.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_title_section.dart';
import 'package:memo_sample/router.dart';

class MemoDetailBody extends HookConsumerWidget {
  const MemoDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(memoDetailPageProvider);
    final router = ref.watch(routerProvider);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => router.go('/detail/${memo.id}/edit'),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (memo.title.isNotEmpty) ...[
                  const MemoDetailTitleSection(),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  )
                ],
                const MemoDetailTextSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
