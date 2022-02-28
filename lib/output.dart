import 'package:flutter/material.dart';
import 'package:flutter_json_builder/json_builder.dart';
import 'package:provider/provider.dart';

class JsonOutputScreen extends StatelessWidget {
  const JsonOutputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<JsonBuilder>(
            builder: (context, notifier, child) {
              return SelectableText(notifier.output);
            },
          ),
        ),
      ),
    );
  }
}
