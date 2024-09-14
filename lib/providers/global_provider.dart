import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum DashType { desk, mobile }

enum MainBody { edit, print, data }

final dashTypeProvider = StateProvider((ref) => DashType.mobile);

final themeSelectProvider = StateProvider<bool>((ref) {
  return false; //not dark
});

final mobileBodyWidget = StateProvider<MainBody>((ref) {
  return MainBody.edit;
});

final supabaseAuthProvider = StreamProvider.autoDispose<AuthState>((ref) async* {
  if (SupabaseManager.authStream != null) {
    await for (final value in SupabaseManager.authStream!) {
      print(value);
      yield value;
    }
  }
});
