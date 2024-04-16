import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

const packageName = 'i18n_talk_library';
void main(List<String> arguments) {
  link(
    arguments,
    (config, output) async {
      final staticLibrary = config.assets
          .firstWhere((asset) => asset.id == 'package:$packageName/staticlib');
      final symbols = config.resources
          ?.map((resource) => resource.metadata)
          .map((metadata) => metadata.toString());
      await CLinker(
        name: 'format',
        assetName: '$packageName.dart',
        linkerOptions: LinkerOptions.treeshake(symbols: symbols),
        sources: [staticLibrary.file!.toFilePath()],
      ).run(
        linkConfig: config,
        linkOutput: output,
        logger: null,
      );
    },
  );
}
