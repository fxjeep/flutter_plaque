import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/widgets/new_contact.dart';

class ContactInput extends ConsumerStatefulWidget {
  const ContactInput({super.key});

  ConsumerState<ContactInput> createState() => ContactInputState();
}

class ContactInputState extends ConsumerState<ContactInput> {
  var addNewDialog = NewContact();

  @override
  Widget build(BuildContext context) {
    var dash = ref.watch(dashTypeProvider);
    var isDark = ref.watch(themeSelectProvider);

    return Row(mainAxisSize: MainAxisSize.max, children: [
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
          openBox();
        },
      ),
    ]);
  }

  void openBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return addNewDialog;
      },
    ).then((val) {
      if (val.length == 2) {
        print(val[0]);
        print(val[1]);
      }
    });
  }
}
