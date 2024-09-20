import 'package:asset/hook.dart';

const standardAsset = 'standard_content';
var premiumAsset = 'premium_content';

void main(List<String> args) {
  build(
    args,
    (config, output) async {
      final dataAssetBuilder = DataAssetBuilder(config, output);
      dataAssetBuilder.addStringAsset(
        name: standardAsset,
        file: config.packageRoot.resolve('assets/standard_content.json'),
      );
      dataAssetBuilder.addStringAsset(
        name: premiumAsset,
        file: config.packageRoot.resolve('assets/premium_content.json'),
      );
    },
  );
}
