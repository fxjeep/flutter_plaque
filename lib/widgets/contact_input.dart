import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';

class ContactInput extends ConsumerStatefulWidget {
  const ContactInput({super.key});

  ConsumerState<ContactInput> createState() => ContactInputState();
}

class ContactInputState extends ConsumerState<ContactInput> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    var dash = ref.watch(dashTypeProvider);
    var isDark = ref.watch(themeSelectProvider);
    return Row(mainAxisSize: MainAxisSize.max, children: [
      // Material(
      //     child: Switch(
      //         value: isDark,
      //         activeColor: Colors.red,
      //         onChanged: (bool value) {
      //           // This is called when the user toggles the switch.
      //           setState(() {
      //             ref.read(themeSelectProvider.notifier).state = value;
      //           });
      //         })),
      // IconButton(
      //   icon: Icon(
      //     Icons.menu,
      //     size: 24,
      //   ),
      //   onPressed: () {
      //     print('menu icon pressed ...');
      //   },
      // ),
      Expanded(
        child: Material(
          child: TextField(
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(labelText: 'Search name or code'),
              textAlign: TextAlign.start),
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.manage_search,
          size: 24,
        ),
        onPressed: () {
          print('search pressed ...');
        },
      ),
      IconButton(
        icon: Icon(
          Icons.person_add_alt,
          size: 24,
        ),
        onPressed: () {
          print('add pressed ...');
        },
      ),
    ]);
  }
}
