import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_json_builder/modules/dart_model_maker.dart' as model_maker;

class JsonBuilder with ChangeNotifier, DiagnosticableTreeMixin {
  String output = '';

  void save(String values) {
    final Map<String, dynamic> data = jsonDecode(values);
    model_maker.etch(data);
    output = model_maker.models.join('\n');

    notifyListeners();
  }
}
