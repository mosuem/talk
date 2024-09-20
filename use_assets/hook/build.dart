import 'package:native_assets_cli/native_assets_cli.dart';

void main(List<String> args) => build(
      args,
      (config, output) async {
        output.addAsset(
          DataAsset(
            package: 'use_assets',
            name: 'testAsset',
            file: config.packageRoot.resolve('assets/test.txt'),
          ),
        );
        output.addDependency(config.packageRoot.resolve('hook/build.dart'));
      },
    );
