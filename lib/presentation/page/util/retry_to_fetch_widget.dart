import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetryToFetchWidget extends HookConsumerWidget {
  const RetryToFetchWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding = const EdgeInsets.all(20),
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(height: 1.2),
        ),
      ),
    );
  }
}
