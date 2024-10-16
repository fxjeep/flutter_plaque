import 'dart:async';

import 'package:fplaque/consts.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static SupabaseClient? client;
  static Stream<AuthState>? authStream;
  static Future<void> initialise() async {
    await Supabase.initialize(
      url: SuperbaseURL,
      anonKey: SuperbaseKey,
    );

    SupabaseManager.client = Supabase.instance.client;
    authStream = client?.auth.onAuthStateChange;
  }

  static Future<void> login(String email, String password) async {
    await client?.auth.signInWithPassword(email: email, password: password);
  }

  static Future<void> logout() async {
    await client?.auth.signOut();
  }

  static bool shouldShowLogin(AuthState? authEvent) {
    return authEvent?.event != AuthChangeEvent.signedIn &&
        authEvent?.event != AuthChangeEvent.tokenRefreshed;
  }
}
