import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_body.dart';
import 'package:memo_sample/presentation/page/util/retry_to_fetch_widget.dart';

final memoEditPageProvider = Provider<Memo?>((ref) => null);

class MemoEditPage extends ConsumerWidget {
  const MemoEditPage({
    Key? key,
    this.memoId,
  }) : super(key: key);

  final String? memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoId = this.memoId;
    final isUpdating = memoId == null;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).memoEditName),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(S.of(context).save),
          ),
        ],
      ),
      body: isUpdating
          ? const MemoEditBody()
          : ref.watch(memoProvider(memoId)).when(
                data: (memo) => ProviderScope(
                  overrides: [memoEditPageProvider.overrideWithValue(memo)],
                  child: const MemoEditBody(),
                ),
                error: (error, stackTrace) => RetryToFetchWidget(
                  text:
                      '${S.of(context).failedToFetch} \nError:${error.toString()}',
                  onTap: () => ref.refresh(memoProvider(memoId)),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
    );
  }
}
