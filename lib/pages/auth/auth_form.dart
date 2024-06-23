import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/stores/auth.store.dart';
import 'package:the_menu/utils/validation.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required this.onSubmit});
  final Future<void> Function() onSubmit;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  @override
  void initState() {
    passwordController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final authStore = context.watch<AuthStore>();

    Future<void> submitForm() async {
      if (formKey.currentState!.validate()) {
        authStore.setEmail(emailController.text);
        authStore.setName(nameController.text);
        authStore.setPassword(passwordController.text);
        widget.onSubmit();
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(179, 160, 117, 240),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 25),
                  blurRadius: 20,
                  color: Color.fromARGB(76, 0, 0, 0),
                )
              ],
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(54, 186, 42, 222),
              ),
            ),
            child: Text(
              "The Menu",
              style: textTheme.displayLarge
                  ?.copyWith(color: colorScheme.background),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 20),
            decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 25),
                    blurRadius: 20,
                    color: Color.fromARGB(69, 104, 101, 101),
                  )
                ]),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (authStore.isSignup)
                    TextFormField(
                      key: const ValueKey('name'),
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          const ValidationComposite(validations: [
                        IsEmptyStringValidation(),
                        IsTooShortString(minSize: 4),
                        IsTooLongString(maxSize: 50)
                      ]).validate(value),
                    ),
                  TextFormField(
                    key: const ValueKey('email'),
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        const ValidationComposite(validations: [
                      IsEmptyStringValidation(),
                      IsValidEmail(),
                    ]).validate(value),
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (value) =>
                        const ValidationComposite(validations: [
                      IsEmptyStringValidation(),
                      IsTooShortString(minSize: 5),
                      IsTooLongString(maxSize: 50),
                    ]).validate(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                      (states) => colorScheme.tertiaryContainer,
                    )),
                    onPressed: submitForm,
                    child: Text(
                      authStore.isLogin ? 'Login' : 'Continue',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => setState(() {
                      authStore.toggleAuthMode();
                    }),
                    child: Text(
                      authStore.isSignup
                          ? 'Already have an account?'
                          : 'Create account',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
