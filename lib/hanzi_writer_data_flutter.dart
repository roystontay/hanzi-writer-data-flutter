library hanzi_writer_data_flutter;

import 'dart:convert';
import 'package:flutter/services.dart';

/// Loads parsed stroke order data for a given Chinese character.
///
/// Assumes the JSON file is located at:
/// packages/hanzi_data/assets/hanzi/[character].json
///
/// Example usage:
/// ```dart
/// final data = await loadCharData('我');
/// ```
Future<Map<String, dynamic>> loadCharData(String char) async {
  try {
    final jsonStr = await rootBundle.loadString(
        'packages/hanzi_writer_data_flutter/assets/hanzi/$char.json');
    return json.decode(jsonStr) as Map<String, dynamic>;
  } catch (e) {
    throw Exception(
        "Character data for '$char' not found or failed to load. Error: $e");
  }
}
