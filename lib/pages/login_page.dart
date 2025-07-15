import 'package:flutter/material.dart';
import 'package:golden_shrunts/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: theme.colorScheme.tertiaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/login.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        16.heightBox,
                        "Welcome $name".text.xl3.bold
                            .color(theme.colorScheme.primary)
                            .make(),
                        "Login to continue".text.sm
                            .color(theme.colorScheme.primary.withOpacity(0.5))
                            .make()
                            .pOnly(bottom: 20),
                        buildLoginForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // Username
        TextFormField(
          style: TextStyle(fontSize: 14, color: theme.colorScheme.primary),
          decoration: InputDecoration(
            hintText: "Enter Username",
            hintStyle: const TextStyle(fontSize: 16),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 30, right: 8),
              child: Icon(Icons.person, size: 20),
            ),
            filled: true,
            fillColor: theme.colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) =>
              (value?.isEmpty ?? true) ? "Username cannot be empty" : null,
          onChanged: (value) => setState(() => name = value),
        ),

        16.heightBox,

        // Password
        TextFormField(
          obscureText: true,
          style: TextStyle(fontSize: 14, color: theme.colorScheme.primary),
          decoration: InputDecoration(
            hintText: "Enter Password",
            hintStyle: const TextStyle(fontSize: 16),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 30, right: 8),
              child: Icon(Icons.lock, size: 20),
            ),
            filled: true,
            fillColor: theme.colorScheme.tertiaryContainer,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return "Password cannot be empty";
            if (value!.length < 6)
              return "Password must be at least 6 characters";
            return null;
          },
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // TODO: Forgot password action
            },
            child: "Forgot Password?".text.sm.color(Colors.blue).make(),
          ),
        ),

        20.heightBox,

        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: Material(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
            child: InkWell(
              onTap: () => moveToHome(context),
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: changeButton ? 50 : 130,
                height: 40,
                alignment: Alignment.center,
                child: changeButton
                    ? const Icon(Icons.done, color: Colors.white)
                    : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ),
        ),

        30.heightBox,

        // Social icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              child: Image.asset(
                isDark
                    ? "assets/icons/google_dark.png"
                    : "assets/icons/google_light.png",
                width: 28,
                height: 28,
              ),
            ),
            16.widthBox,
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              child: Image.asset(
                isDark
                    ? "assets/icons/apple_dark.png"
                    : "assets/icons/apple_light.png",
                width: 28,
                height: 28,
              ),
            ),
          ],
        ),

        30.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Don't have an account?".text.color(Colors.grey).make(),
            TextButton(
              onPressed: () {
                // TODO: Navigate to signup screen
              },
              child: "Sign up".text.color(Colors.blue).semiBold.make(),
            ),
          ],
        ),
      ],
    );
  }
}
