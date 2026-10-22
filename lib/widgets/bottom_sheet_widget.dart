import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ),
            );
          },
        );
      },
      child: const Text('Show bottom sheet'),
    );
  }
}
