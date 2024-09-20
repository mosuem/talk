import 'package:asset/hook.dart';

void main(List<String> arguments) {
  build(
    arguments,
    (config, output) async {
      DataAssetBuilder(config, output)
        ..addStringAsset(
          name: 'standard_content',
          file: config.packageRoot.resolve('assets/standard_content.json'),
        )
        ..addStringAsset(
          name: 'premium_content',
          file: config.packageRoot.resolve('assets/premium_content.json'),
        );
    },
  );
}
