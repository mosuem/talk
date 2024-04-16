// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:native_assets_cli/native_assets_cli.dart';

const packageName = 'i18n_talk_library';
void main(List<String> arguments) async {
  build(
    arguments,
    (config, output) async {
      output.addAsset(
        DataAsset(
          package: packageName,
          name: 'staticlib',
          file: config.packageRoot.resolve('assets/libformat.a'),
        ),
        linkInPackage: packageName,
      );

      output.addAsset(
        placeholderAsset(config),
        linkInPackage: packageName,
      );
    },
  );
}

NativeCodeAsset placeholderAsset(HookConfig config) {
  final String libraryFileName = config.targetOS.libraryFileName(
    packageName,
    DynamicLoadingBundled(),
  );
  final uri = config.outputDirectory.resolve(libraryFileName);

  return NativeCodeAsset(
    package: packageName,
    name: '$packageName.dart',
    linkMode: DynamicLoadingBundled(),
    file: uri,
    os: config.targetOS,
  );
}
