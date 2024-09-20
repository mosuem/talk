// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';
import 'package:record_use/record_use.dart';

const addIdentifier = const Identifier(
  importUri: 'package:treeshaking_native_libs/src/treeshaking_native_libs.dart',
  name: 'add',
);

const multiplyIdentifier = const Identifier(
  importUri: 'package:treeshaking_native_libs/src/treeshaking_native_libs.dart',
  name: 'multiply',
);

void main(List<String> arguments) async {
  await link(
    arguments,
    (config, output) async {
      final staticLibrary = config.assets.single;

      final linker = CLinker.library(
        name: config.packageName,
        assetName: staticLibrary.id.split('/').skip(1).join('/'),
        linkerOptions: LinkerOptions.treeshake(symbols: ['add']),
        sources: [staticLibrary.file!.toFilePath()],
      );
      await linker.run(
        config: config,
        output: output,
        logger: Logger('')
          ..level = Level.ALL
          ..onRecord.listen((record) {
            print('${record.level.name}: ${record.time}: ${record.message}');
          }),
      );
    },
  );
}

// temporary helper method
Future<RecordedUsages> extractUsages(LinkConfig config) async {
  final usagesFile = config.recordedUsagesFile;
  final usagesContent = await File.fromUri(usagesFile!).readAsString();
  final usagesJson = jsonDecode(usagesContent) as Map<String, dynamic>;
  final usages = RecordedUsages.fromJson(usagesJson);
  return usages;
}
