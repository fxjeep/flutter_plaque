import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/widgets/contact_search.dart';
import 'package:fplaque/widgets/data_manage.dart';
import 'package:fplaque/widgets/print_list.dart';

class DashMobile extends ConsumerStatefulWidget {
  const DashMobile({super.key});

  ConsumerState<DashMobile> createState() => DashMobileState();
}

class DashMobileState extends ConsumerState<DashMobile> {
  @override
  Widget build(BuildContext context) {
    var curBody = ref.watch(mobileBodyWidget);

    return SafeArea(child: getBody(curBody));
  }

  Widget getBody(MainBody body) {
    switch (body) {
      case MainBody.edit:
        return ContactSearch();
      case MainBody.data:
        return DataManger();
      case MainBody.print:
        return PrintList();
      default:
        return ContactSearch();
    }
  }
}
