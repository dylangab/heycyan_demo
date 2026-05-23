import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class ImageHelper {
  /// Converts a [Uint8List] to a physical [File] saved in the app's temporary directory.
  Future<File> convertUint8ListToFile(Uint8List bytes, String fileName) async {
    // 1. Get a safe directory to write the file to
    final tempDir = await getTemporaryDirectory();

    // 2. Create the file reference inside that directory
    final file = File('${tempDir.path}/$fileName');

    // 3. Write the bytes asynchronously to prevent UI freezing
    return await file.writeAsBytes(bytes, flush: true);
  }
}
