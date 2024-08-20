import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';

class ContactList extends ConsumerStatefulWidget {
  const ContactList({super.key});

  ConsumerState<ContactList> createState() => ContactListState();
}

class ContactListState extends ConsumerState<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Text("contact A"),
        Text("contact AB"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
        Text("contact C"),
      ],
    ));
  }
}
