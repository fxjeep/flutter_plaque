import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/consts.dart';
import 'package:fplaque/dash_desk.dart';
import 'package:fplaque/dash_mobile.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/providers/supabase.dart';
import 'package:fplaque/widgets/supabase_login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await SupabaseManager.initialise();
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDark = ref.watch(themeSelectProvider);
    var authEvent = ref.watch(supabaseAuthProvider);
    return MaterialApp(
        title: 'Flutter Plaque',
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Plaque Editor"),
              actions: [
                IconButton(
                  onPressed: () {
                    SupabaseManager.logout();
                  },
                  icon: const Icon(Icons.logout),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(mobileBodyWidget.notifier).state = MainBody.edit;
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(mobileBodyWidget.notifier).state = MainBody.print;
                  },
                  icon: const Icon(Icons.print),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(mobileBodyWidget.notifier).state = MainBody.data;
                  },
                  icon: const Icon(Icons.data_object),
                )
              ],
            ),
            body: authEvent.value?.event != AuthChangeEvent.signedIn &&
                    authEvent.value?.event != AuthChangeEvent.tokenRefreshed
                ? SupabaseLogin()
                : (kIsDesktop && false ? DashDesk() : DashMobile())));
  }
}
