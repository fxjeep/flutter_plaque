import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/providers/supabase_models.dart';
import 'package:fplaque/providers/supabase_repo.dart';

class NewContact extends ConsumerStatefulWidget {
  const NewContact({super.key});

  ConsumerState<NewContact> createState() => NewContactState();
}

class NewContactState extends ConsumerState<NewContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.all(0),
          child: AlertDialog(
              title: Text("Add New Contact"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              content: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                            controller: nameController,
                            autofocus: true,
                            obscureText: false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(labelText: 'Name'),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter contact name';
                              }
                              return null;
                            }),
                        TextFormField(
                            controller: codeController,
                            autofocus: true,
                            obscureText: false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(labelText: 'Code'),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter contact code';
                              }
                              return null;
                            }),
                      ])),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop([nameController.text, codeController.text]);
                    }
                  },
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop([]);
                  },
                  child: Text('Cancel'),
                ),
              ])),
    );
  }
}
