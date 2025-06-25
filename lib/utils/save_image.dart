import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveImage(String url) async {
  final status = await Permission.storage.request();
  if (!status.isGranted) {
    throw Exception('Storage permission not granted');
  }

  final directory = await getExternalStorageDirectory();
  final downloads = Directory('${directory!.path}/Download');

  if (!(await downloads.exists())) {
    await downloads.create(recursive: true);
  }

  final filePath =
      '${downloads.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

  await Dio().download(url, filePath);
}
