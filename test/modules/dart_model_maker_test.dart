import 'dart:convert';

import 'package:flutter_json_builder/modules/dart_model_maker.dart' as model_maker;
import 'package:flutter_test/flutter_test.dart';

const _testText = """{
    "instruments": [
        {
            "name": "USD_SEK",
            "type": "CURRENCY",
            "displayName": "USD/SEK",
            "pipLocation": -4,
            "displayPrecision": 5,
            "tradeUnitsPrecision": 0,
            "tags": [
                {
                    "type": "ASSET_CLASS",
                    "name": "CURRENCY"
                }
            ],
            "financing": {
                "longRate": "-0.001",
                "shortRate": "-0.01",
                "financingDaysOfWeek": [
                    {
                        "dayOfWeek": "MONDAY",
                        "daysCharged": 1
                    },
                    {
                        "dayOfWeek": "TUESDAY",
                        "daysCharged": 1
                    },
                    {
                        "dayOfWeek": "WEDNESDAY",
                        "daysCharged": 4
                    },
                    {
                        "dayOfWeek": "THURSDAY",
                        "daysCharged": 0
                    },
                    {
                        "dayOfWeek": "FRIDAY",
                        "daysCharged": 1
                    },
                    {
                        "dayOfWeek": "SATURDAY",
                        "daysCharged": 0
                    },
                    {
                        "dayOfWeek": "SUNDAY",
                        "daysCharged": 0
                    }
                ]
            }
        }
    ],
    "lastTransactionID": "1"
}""";

void main() {
  test('parse json from API response', () {
    final Map<String, dynamic> data = jsonDecode(_testText);

    model_maker.etch(data);

    final String result = model_maker.models.join('\n');
    expect(result.contains('class Response'), true);
    expect(result.contains('class Instruments'), true);
    expect(result.contains('class Tags'), true);
    expect(result.contains('class Financing'), true);
    expect(result.contains('class FinancingDaysOfWeek'), true);
  });
}
