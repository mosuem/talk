import 'dart:asset';

Future<String> calculate() async {
  const asset = ByteAsset('package:use_assets/testAsset');
  var byteBuffer = await asset.load();
  return String.fromCharCodes(byteBuffer);
}
