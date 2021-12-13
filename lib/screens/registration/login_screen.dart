import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otbokhly_app/services/authentication_service.dart';
import 'package:otbokhly_app/widgets/validated_form_widget.dart';
import '../home/recipe_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isVisible = false;

  bool _formValidated() => _formKey.currentState!.validate() ? true : false;

  void _togglePassword() {
    setState(() {
      _isVisible ? _isVisible = false : _isVisible = true;
    });
  }

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RecipeScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.2),
            child: ListView(
              children: [
                SvgPicture.asset(
                  "assets/chef.svg",
                  width: 120,
                  height: 120,
                  color: Colors.orange,
                ),
                const SizedBox(height: 30),
                ValidatedFormWidget(
                  hintText: "Email",
                  validator: (value) =>
                      value!.isEmpty ? "Email can't be empty!" : null,
                  controller: _email,
                  type: TextInputType.emailAddress,
                  action: TextInputAction.next,
                  hiddenText: false,
                ),
                const SizedBox(height: 20),
                ValidatedFormWidget(
                  visibilityButton: IconButton(
                      onPressed: _togglePassword,
                      icon: _isVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.orange,
                            )
                          : const Icon(Icons.visibility, color: Colors.orange)),
                  validator: (value) => value!.length < 6
                      ? "Password can't be less than 6 characters!"
                      : null,
                  hintText: "Password",
                  controller: _password,
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  hiddenText: !_isVisible,
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange,
                  onPressed: () async {
                    if (_formValidated()) {
                      if (await AuthenticationServices()
                              .loginUser(_email.text, _password.text) !=
                          null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Logged in successfully!")));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RecipeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sign in error, can't login!")));
                        _email.clear();
                        _password.clear();
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
