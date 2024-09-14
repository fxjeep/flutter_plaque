import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fplaque/providers/global_provider.dart';
import 'package:fplaque/providers/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';

class SupabaseLogin extends ConsumerStatefulWidget {
  const SupabaseLogin({super.key});

  ConsumerState<SupabaseLogin> createState() => SupabaseLoginState();
}

class SupabaseLoginState extends ConsumerState<SupabaseLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  FlashBuilder<bool> flashBuilder(String msg) {
    return (context, controller) => FlashBar(
          controller: controller,
          behavior: FlashBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              color: Colors.yellow,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          margin: const EdgeInsets.all(32.0),
          clipBehavior: Clip.antiAlias,
          indicatorColor: Colors.amber,
          icon: Icon(Icons.tips_and_updates_outlined),
          title: Text('Error'),
          content: Text(msg),
          actions: [TextButton(onPressed: () => controller.dismiss(true), child: Text('Ok'))],
        );
  }

  Future<void> loginSupabase(BuildContext context, String email, String password) async {
    try {
      await SupabaseManager.login(email, password);
    } on AuthException catch (error) {
      context.showFlash<bool>(builder: flashBuilder(error.message));
    } catch (error) {
      context.showFlash<bool>(builder: flashBuilder(error.toString()));
    } finally {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.all(0),
          child: AlertDialog(
              title: Text("Login"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Form(
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
                              decoration: InputDecoration(labelText: 'Email'),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              }),
                          TextFormField(
                            controller: passwordController,
                            autofocus: true,
                            obscureText: !_passwordVisible,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ]))
              ]),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginSupabase(
                          context, nameController.value.text, passwordController.value.text);
                    }
                  },
                  child: Text('Login'),
                )
              ])),
    );
  }
}
