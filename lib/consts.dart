import 'dart:io';

const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
final kIsDesktop = !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
