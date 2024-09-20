import 'dart:convert';
import 'dart:io';

import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:record_use/record_use.dart';

extension LinkConfigExt on LinkConfig {
// temporary helper method
  RecordedUsages get usages {
    final usagesFile = recordedUsagesFile;
    final usagesContent = File.fromUri(usagesFile!).readAsStringSync();
    final usagesJson = jsonDecode(usagesContent) as Map<String, dynamic>;
    final usages = RecordedUsages.fromJson(usagesJson);
    return usages;
  }
}
