import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/screens/authentication/signIn.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Authentication extends StatefulWidget {
  const Authentication({
    super.key,
  });

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isHover = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  bool isLoading = false;
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(child: SignIn());
  }
}
