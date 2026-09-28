import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({super.key});

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  // Fake stream data
  Stream<int> generateStream = (() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield 1;
    await Future.delayed(const Duration(seconds: 2));
    yield 2;
    await Future.delayed(const Duration(seconds: 2));
    yield 3;
  })();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: StreamBuilder(
        stream: generateStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator.adaptive();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Text('Done');
          }
          if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              style: TextStyle(fontSize: 16, color: Colors.red),
            );
          } else {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 40),
            );
          }
        },
      ),
    );
  }
}
