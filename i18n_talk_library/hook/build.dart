// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:native_assets_cli/native_assets_cli.dart';

const packageName = 'i18n_talk_library';
void main(List<String> arguments) async {
  build(
    arguments,
    (config, output) async {
      final library = config.packageRoot.resolve('assets/libformat.so');
      output.addDependencies([
        library,
        config.packageRoot.resolve('hook/build.dart'),
      ]);
      output.addAsset(
        NativeCodeAsset(
          package: packageName,
          linkMode: DynamicLoadingBundled(),
          name: 'mylibrary',
          file: library,
          os: OS.linux,
          architecture: Architecture.x64,
        ),
      );
    },
  );
}
