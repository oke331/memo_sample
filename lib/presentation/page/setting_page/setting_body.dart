import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/setting_page/logout_dialog.dart';
import 'package:memo_sample/presentation/page/setting_page/setting_tile.dart';
import 'package:memo_sample/router.dart';

class SettingBody extends HookConsumerWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tileContents = [
      SettingTile(
        text: S.of(context).themeModeName,
        onTap: () => ref.read(routerProvider).go('/setting/theme_setting'),
      ),
      SettingTile(
        text: S.of(context).logout,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (_) => const LogoutDialog(),
          );
        },
      ),
    ];
    return ListView.separated(
      itemCount: _tileContents.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) => _tileContents[index],
    );
  }
}
