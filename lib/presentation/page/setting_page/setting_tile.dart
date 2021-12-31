import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingTile extends HookConsumerWidget {
  const SettingTile({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(text),
      onTap: onTap,
      trailing: const SizedBox(
        height: double.infinity,
        child: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
