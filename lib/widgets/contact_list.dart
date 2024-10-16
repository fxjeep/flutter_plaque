import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/providers/supabase_repo.dart';

class ContactList extends ConsumerStatefulWidget {
  const ContactList({super.key});

  ConsumerState<ContactList> createState() => ContactListState();
}

class ContactListState extends ConsumerState<ContactList> {
  final GlobalKey _menuKey = new GlobalKey();
  var repo = new SupabasePlaqueRepo();
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(contactListProvider);

    return Expanded(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              var isodd = index % 2 == 1;
              return ListTile(
                  leading: item.isPrint ? const Icon(Icons.print) : const Text(""),
                  tileColor: isodd ? Colors.cyan : Colors.grey,
                  title: Text(
                    item.name + "(" + item.code + ")",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(item.lastPrintDate),
                  trailing: PopupMenuButton(
                      child: Icon(Icons.more_vert),
                      onSelected: (newValue) {
                        if (newValue.startsWith("delete")) {
                          showDeleteConfirm(context, item.name, item.code);
                          //repo.deleteContact(newValue.replaceAll("delete_", ""));
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'edit_${item.id}',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'detail_${item.id}',
                            child: Text('Detail'),
                            onTap: () {},
                          ),
                          PopupMenuItem(
                            value: 'delete_${item.id}',
                            child: Text('Delete'),
                          )
                        ];
                      }));
            }));
  }

  void showDeleteConfirm(BuildContext context, String name, String code) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Confirm"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Delete"),
      content: Text("Would you like to delete $name($code)"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
