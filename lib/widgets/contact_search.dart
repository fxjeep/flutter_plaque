import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/widgets/contact_input.dart';
import 'package:fplaque/widgets/contact_list.dart';

class ContactSearch extends ConsumerStatefulWidget {
  const ContactSearch({super.key});

  ConsumerState<ContactSearch> createState() => ContactSearchState();
}

class ContactSearchState extends ConsumerState<ContactSearch> {
  @override
  Widget build(BuildContext context) {
    var dash = ref.watch(dashTypeProvider);
    return SafeArea(
        top: true,
        child: Column(mainAxisSize: MainAxisSize.max, 
                          children: [
                            ContactInput(), 
                            ContactList()
                          ]));
  }
}
