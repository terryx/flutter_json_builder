import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_json_builder/json_builder.dart';

class JsonInputScreen extends StatefulWidget {
  const JsonInputScreen({Key? key}) : super(key: key);

  @override
  _JsonInputScreenState createState() => _JsonInputScreenState();
}

class _JsonInputScreenState extends State<JsonInputScreen> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    labelText: 'Paste json response here',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<JsonBuilder>().save(inputController.text);
          Navigator.pushNamed(context, '/output');
        },
        tooltip: 'Convert to model',
        child: const Icon(Icons.build),
      ),
    );
  }
}
