import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_body.dart';
import 'package:memo_sample/router.dart';

final memoDetailPageProvider =
    Provider<Memo>((ref) => throw UnimplementedError());

class MemoDetailPage extends HookConsumerWidget {
  const MemoDetailPage({
    Key? key,
    required this.memoId,
  }) : super(key: key);

  final String memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(memoProvider(memoId));
    if (memo == null) {
      return _scaffold(
        body: const SizedBox.shrink(),
      );
    }
    return ProviderScope(
      overrides: [
        memoDetailPageProvider.overrideWithValue(memo),
      ],
      child: _scaffold(
        appBarActions: [
          IconButton(
            onPressed: () =>
                ref.read(routerProvider).go('/detail/$memoId/edit'),
            icon: const Icon(Icons.edit),
          ),
        ],
        body: const MemoDetailBody(),
      ),
    );
  }

  Widget _scaffold({
    required Widget body,
    List<Widget>? appBarActions,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(useContext()).memoDetailName),
        actions: appBarActions,
      ),
      body: body,
    );
  }
}
