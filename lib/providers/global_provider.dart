import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DashType { desk, mobile }

enum MainBody { edit, print, data }

final dashTypeProvider = StateProvider((ref) => DashType.mobile);

final themeSelectProvider = StateProvider<bool>((ref) {
  return false; //not dark
});

final mobileBodyWidget = StateProvider<MainBody>((ref) {
  return MainBody.edit;
});
