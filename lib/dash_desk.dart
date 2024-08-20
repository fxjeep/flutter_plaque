import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashDesk extends ConsumerStatefulWidget {
  const DashDesk({super.key});

  ConsumerState<DashDesk> createState() => DashDeskState();
}

class DashDeskState extends ConsumerState<DashDesk> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return const Text("desk dash");
  }
}
