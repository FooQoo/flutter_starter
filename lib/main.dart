import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  LineSDK.instance.setup("${dotenv.env['LINE_CHANNLE_ID']}").then((_) {
    logger.d("LineSDK Prepared");
  });
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
