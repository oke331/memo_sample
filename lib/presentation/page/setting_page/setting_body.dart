import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/presentation/page/setting_page/setting_tile.dart';

class _TileContent {
  _TileContent({
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
}

class SettingBody extends HookConsumerWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tileContents = [
      _TileContent(
        text: 'ログアウト',
        onTap: ref.read(authControllerProvider.notifier).signOut,
      ),
    ];
    return ListView.separated(
      itemCount: _tileContents.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (BuildContext context, int index) => SettingTile(
        text: _tileContents[index].text,
        onTap: _tileContents[index].onTap,
      ),
    );
  }
}
