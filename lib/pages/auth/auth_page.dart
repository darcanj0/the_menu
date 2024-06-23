import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/pages/auth/auth_form.dart';
import 'package:the_menu/stores/auth.store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authStore = context.read<AuthStore>();

    Future<void> handleSubmit() async {
      setState(() => isLoading = true);
      if (authStore.isLogin) {
        authStore.login().catchError((e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Incorrect email and/or password'),
            backgroundColor: colorScheme.error,
          ));
        }).then((_) {
          setState(() => isLoading = false);
        });
      } else {
        authStore.signup().catchError((e) {
          debugPrint(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
                'Sorry! There was an error. Please, try again later!'),
            backgroundColor: colorScheme.error,
          ));
        }).then((_) {
          setState(() => isLoading = false);
        });
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: AuthForm(
              onSubmit: handleSubmit,
            ),
          ),
        ),
        if (isLoading)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: colorScheme.scrim.withOpacity(.2)),
            child: CircularProgressIndicator.adaptive(
              backgroundColor: colorScheme.primary,
            ),
          )
      ]),
    );
  }
}
