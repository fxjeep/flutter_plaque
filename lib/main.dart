import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/consts.dart';
import 'package:fplaque/dash_desk.dart';
import 'package:fplaque/dash_mobile.dart';
import 'package:fplaque/providers/global_provider.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDark = ref.watch(themeSelectProvider);

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
            body: kIsDesktop && false ? DashDesk() : DashMobile()));
  }
}
