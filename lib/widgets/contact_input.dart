import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/providers/supabase_models.dart';
import 'package:fplaque/providers/supabase_repo.dart';
import 'package:fplaque/widgets/new_contact.dart';

class ContactInput extends ConsumerStatefulWidget {
  const ContactInput({super.key});

  ConsumerState<ContactInput> createState() => ContactInputState();
}

class ContactInputState extends ConsumerState<ContactInput> {
  var addNewDialog = NewContact();
  var repo = SupabasePlaqueRepo();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(contactListProvider);
    final searchText = ref.watch(seartchTextProvider);

    var dash = ref.watch(dashTypeProvider);
    var isDark = ref.watch(themeSelectProvider);
    final searchController = TextEditingController();

    if (searchController.text != searchText) {
      searchController.text = searchText;
    }

    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Material(
          child: TextField(
              controller: searchController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(labelText: 'Search name or code'),
              textAlign: TextAlign.start,
              onSubmitted: (String value) async {
                ref.read(seartchTextProvider.notifier).state = searchController.text;
                var list = await repo.searchContacts(searchController.text);
                ref.read(contactListProvider.notifier).state = list;
              }),
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.manage_search,
          size: 24,
        ),
        onPressed: () async {
          var list = await repo.searchContacts(searchController.text);
          ref.read(contactListProvider.notifier).state = list;
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
        var c = Contact.nameCode(val[0], val[1]);
        repo.addOrUpdateContact(c);
      }
    });
  }
}
