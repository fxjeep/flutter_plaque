import 'dart:io';

const SuperbaseURL = "https://edbatlqruasubecsoezb.supabase.co";
const SuperbaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVkYmF0bHFydWFzdWJlY3NvZXpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2NDIzMDUsImV4cCI6MjAxMTIxODMwNX0.xv71Dlx10cByauCEhw9ZZ1KKAjYuk69oYIx2qd8KsW4";

const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
final kIsDesktop = !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
