import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_body.dart';
import 'package:memo_sample/presentation/page/util/retry_to_fetch_widget.dart';
import 'package:memo_sample/router.dart';

final memoDetailPageProvider =
    Provider<Memo>((ref) => throw UnimplementedError());

class MemoDetailPage extends ConsumerWidget {
  const MemoDetailPage({
    Key? key,
    required this.memoId,
  }) : super(key: key);

  final String memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(memoProvider(memoId)).when(
          data: (memo) => Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).memoDetailName),
              actions: [
                TextButton(
                  onPressed: () => ref.read(routerProvider).go('/$memoId/edit'),
                  child: Text(S.of(context).edit),
                ),
              ],
            ),
            body: const MemoDetailBody(),
          ),
          error: (error, stackTrace) => RetryToFetchWidget(
            text: '${S.of(context).failedToFetch} \nError:${error.toString()}',
            onTap: () => ref.refresh(memoProvider(memoId)),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
