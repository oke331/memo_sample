import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetryToFetchWidget extends HookConsumerWidget {
  const RetryToFetchWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 7,
            child: Text(
              text,
              style: const TextStyle(height: 1.2),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Icon(
              Icons.refresh,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
