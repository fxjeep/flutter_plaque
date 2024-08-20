import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';

class DataManger extends ConsumerStatefulWidget {
  const DataManger({super.key});

  ConsumerState<DataManger> createState() => DataMangerState();
}

class DataMangerState extends ConsumerState<DataManger> {
  @override
  Widget build(BuildContext context) {
    return Text("data manager");
  }
}
