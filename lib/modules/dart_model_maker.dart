library dart_model_maker;

import 'package:recase/recase.dart';

final RegExp specialCharRegExp = RegExp(r'-');

dynamic generateSimpleModel(Map<String, dynamic> data, String parentKey) {
  String definitions = '';
  String identifiers = '';

  for (String dkey in data.keys) {
    final ReCase rc = ReCase(dkey);
    final String key = rc.camelCase;
    final String capsKey = _capitalise(key);

    if (data[dkey] is String) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final String? $key; \n";
    }

    if (data[dkey] is num) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final num? $key; \n";
    }

    if (data[dkey] is bool) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final bool? $key; \n";
    }

    if (data[dkey] is Map) {
      definitions += "$key = json['$key'] == null ? null : $capsKey.fromJson(json['$key']),\n";
      identifiers += "final $capsKey? $key;\n";
    }

    if (data[dkey] is List) {
      if (data[dkey].isNotEmpty) {
        definitions +=
            "$key = json['$key'] == null ? null : List<Map<String, dynamic>>.from(json['$key']).map((dynamic value) => $capsKey.fromJson(value)).toList(),\n";
        identifiers += "final List<$capsKey>? $key;\n";
      }
    }
  }

  if (definitions.isNotEmpty) {
    definitions = definitions.substring(0, definitions.length - 2);
  }

  final String contents = """
class $parentKey {
   $parentKey.fromJson(Map<String, dynamic> json) :
   $definitions;

$identifiers
}
    """;

  return contents;
}

String _capitalise(String s) => s[0].toUpperCase() + s.substring(1);

// Recursive function to add key/value into models
final List<String> models = [];

dynamic etch(Map<String, dynamic> data, [String parentKey = 'Response']) {
  models.add(generateSimpleModel(data, parentKey));

  for (String dkey in data.keys) {
    final ReCase rc = ReCase(dkey);
    final String key = rc.camelCase;
    final String capsKey = _capitalise(key);

    if (data[dkey] is Map) {
      etch(data[dkey], capsKey);
    }

    if (data[dkey] is List) {
      if (data[dkey].isNotEmpty) {
        etch(data[dkey][0], capsKey);
      }
    }
  }
}
