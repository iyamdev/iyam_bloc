import 'package:flutter/material.dart';

class PaginationFooter extends StatelessWidget {
  final bool isLoading;
  final bool hasMore;
  final String? error;
  final VoidCallback onRetry;

  const PaginationFooter({
    super.key,
    required this.isLoading,
    required this.hasMore,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (error != null && error!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text(error!),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onRetry,
                child: const Text(
                  'Coba lagi',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!hasMore) {
      return const SizedBox(height: 32);
    }

    return const SizedBox.shrink();
  }
}
