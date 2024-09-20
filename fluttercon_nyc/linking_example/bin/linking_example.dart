import 'package:asset/asset.dart';

const package = 'linking_example';

Future<void> main(List<String> arguments) async {
  const isPremiumVersion = bool.fromEnvironment('premium');

  String content;
  if (isPremiumVersion) {
    content = await const StringAsset(
      package: package,
      name: 'premium_content',
    ).load();
  } else {
    content = await const StringAsset(
      package: package,
      name: 'standard_content',
    ).load();
  }
  print(content);
}
