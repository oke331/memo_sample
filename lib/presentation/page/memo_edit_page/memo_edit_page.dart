import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_body.dart';
import 'package:memo_sample/presentation/page/util/modal_progress_indicator.dart';
import 'package:memo_sample/presentation/page/util/retry_to_fetch_widget.dart';
import 'package:memo_sample/router.dart';

final memoEditPageProvider = Provider<Memo?>((ref) => null);
final memoEditPageTitleControllerProvider =
    Provider<TextEditingController>((ref) => throw UnimplementedError());
final memoEditPageTextControllerProvider =
    Provider<TextEditingController>((ref) => throw UnimplementedError());

class MemoEditPage extends HookConsumerWidget {
  MemoEditPage({
    Key? key,
    this.memoId,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final String? memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    return ref.watch(memoProvider(memoId)).when(
          data: (memo) => ProviderScope(
            overrides: [
              memoEditPageProvider.overrideWithValue(memo),
              memoEditPageTitleControllerProvider.overrideWithValue(
                useTextEditingController(text: memo?.title),
              ),
              memoEditPageTextControllerProvider.overrideWithValue(
                useTextEditingController(text: memo?.text),
              ),
            ],
            child: Consumer(
              builder: (context, ref, child) => Form(
                key: _formKey,
                child: GestureDetector(
                  onTap: () {
                    final FocusScopeNode currentScope = FocusScope.of(context);
                    if (!currentScope.hasPrimaryFocus &&
                        currentScope.hasFocus) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: ModalProgressIndicator(
                    isLoading: isLoading.value,
                    child: _scaffold(
                      context: context,
                      body: const MemoEditBody(),
                      appBarActions: [
                        IconButton(
                          onPressed: () => onPressedSaveButton(
                            context: context,
                            ref: ref,
                            isLoading: isLoading,
                          ),
                          icon: const Icon(Icons.save),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => _scaffold(
            context: context,
            body: RetryToFetchWidget(
              text:
                  '${S.of(context).failedToFetch} \nError:${error.toString()}',
              onTap: () => ref.refresh(memoProvider(memoId)),
            ),
          ),
          loading: () => _scaffold(
            context: context,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }

  Future<void> onPressedSaveButton({
    required BuildContext context,
    required WidgetRef ref,
    required ValueNotifier<bool> isLoading,
  }) async {
    if (isLoading.value) {
      return;
    }
    isLoading.value = true;
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).inputError)),
      );
      isLoading.value = false;
      return;
    }

    final title = ref.read(memoEditPageTitleControllerProvider).text;
    final text = ref.read(memoEditPageTextControllerProvider).text;
    var memoId = this.memoId;
    if (memoId == null) {
      memoId = await ref.read(memoControllerProvider).add(
            title: title,
            text: text,
          );
    } else {
      await ref.read(memoControllerProvider).update(
            memoId: memoId,
            title: title,
            text: text,
          );
      ref.refresh(memoProvider(memoId));
    }

    final exception = ref.read(memoControllerExceptionProvider.notifier).state;
    if (exception != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(exception.toString())),
      );
      isLoading.value = false;
      return;
    }

    isLoading.value = false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).saveSuccessfully)),
    );
    ref.read(routerProvider).go('/detail/$memoId');
  }

  Widget _scaffold({
    required Widget body,
    required BuildContext context,
    List<Widget>? appBarActions,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          memoId == null
              ? S.of(context).memoCreateName
              : S.of(context).memoEditName,
        ),
        actions: appBarActions,
      ),
      body: body,
    );
  }
}
