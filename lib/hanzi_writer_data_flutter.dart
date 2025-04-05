library hanzi_writer_data_flutter;

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
Future<String> loadCharData(String char) async {
  try {
    final jsonString = await rootBundle.loadString(
        'packages/hanzi_writer_data_flutter/assets/hanzi/$char.json');
    return jsonString;
  } catch (e) {
    throw Exception(
        "Character data for '$char' not found or failed to load. Error: $e");
  }
}
