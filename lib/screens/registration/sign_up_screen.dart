import 'package:flutter/material.dart';
import 'package:otbokhly_app/database/database.dart';
import 'package:otbokhly_app/widgets/validated_form_widget.dart';
import 'login_screen.dart';
import '../home/recipe_screen.dart';
import 'package:otbokhly_app/services/authentication_service.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Database _db = Database();
  bool _isVisible = false;

  void _togglePassword() {
    setState(() {
      _isVisible ? _isVisible = false : _isVisible = true;
    });
  }

  bool _formValidated() => _formKey.currentState!.validate() ? true : false;

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
                ValidatedFormWidget(
                  icon: Icons.person,
                  hintText: "Username",
                  validator: (value) =>
                      value!.isEmpty ? "Username can't be empty!" : null,
                  controller: _username,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  hiddenText: false,
                ),
                const SizedBox(height: 20),
                ValidatedFormWidget(
                  icon: Icons.mail,
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
                  icon: Icons.lock,
                  hintText: "Password",
                  validator: (value) => value!.length < 6
                      ? "Password can't be less than 6 characters!"
                      : null,
                  controller: _password,
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  hiddenText: !_isVisible,
                  visibilityButton: IconButton(
                      onPressed: _togglePassword,
                      icon: _isVisible
                          ? const Icon(Icons.visibility_off,
                              color: Colors.orange)
                          : const Icon(Icons.visibility, color: Colors.orange)),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange,
                  onPressed: () async {
                    if (_formValidated()) {
                      if (await _db.userExists(_username.text) == false) {
                        if (await AuthenticationServices()
                                .createNewUser(_email.text, _password.text) !=
                            null) {
                          _db.addData(
                              username:
                                  toBeginningOfSentenceCase(_username.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Signed up successfully!")));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecipeScreen()));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Couldn't Register!")));
                        _username.clear();
                        _email.clear();
                        _password.clear();
                      }
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
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
