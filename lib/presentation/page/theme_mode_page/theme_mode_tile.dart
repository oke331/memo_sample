import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModeTile extends HookConsumerWidget {
  const ThemeModeTile({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(title),
      trailing: Checkbox(
        value: selected,
        onChanged: (_) => onTap(),
      ),
      onTap: onTap,
    );
  }
}
