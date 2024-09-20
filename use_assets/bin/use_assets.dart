import 'package:use_assets/use_assets.dart' as use_assets;

Future<void> main(List<String> arguments) async {
  print('Hello ${await use_assets.calculate()}');
}
