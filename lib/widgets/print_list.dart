import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';

class PrintList extends ConsumerStatefulWidget {
  const PrintList({super.key});

  ConsumerState<PrintList> createState() => PrintListState();
}

class PrintListState extends ConsumerState<PrintList> {
  @override
  Widget build(BuildContext context) {
    return Text("print list");
  }
}
