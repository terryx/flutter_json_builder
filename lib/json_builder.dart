import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_json_builder/modules/dart_model_maker.dart'
    as model_maker;

class JsonBuilder with ChangeNotifier, DiagnosticableTreeMixin {
  String output = '';

  void save(String values) {
    try {
      final Map<String, dynamic> data = jsonDecode(values);
      _clear();
      model_maker.etch(data);
      output = model_maker.models.join('\n');
    } catch (_) {
      _clear();
    } finally {
      notifyListeners();
    }
  }

  void _clear() {
    model_maker.models.clear();
    output = '';
  }
}
