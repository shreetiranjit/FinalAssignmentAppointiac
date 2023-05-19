import 'package:appointiac/features/authentication/login/login_page.dart';
import 'package:appointiac/utils/auth_service.dart';
import 'package:appointiac/utils/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  String _email = '';
  String _password = '';
  bool _obscureText = true;

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (await _authService.login(_email, _password)) {
        // Navigate to the next page or show a success message
      } else {
        // Show an error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.06),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
            onPressed: () {
              print("Pressed");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenHeight = MediaQuery.of(context).size.height;
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: Colors.white,
                  height: screenHeight * 0.2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Center(
                            child: Text(
                              'Hello',
                              style: TextStyle(
                                fontSize:
                                    35 * MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "grotesco",
                                color:  primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "Let's get started!",
                              style: TextStyle(
                                fontSize:
                                    35 * MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "grotesco",
                                color:  primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  height: screenHeight * 0.3,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5.0),
                          const Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 27,
                                fontFamily: "grotesco-medium",
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 17, 17, 17),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          const Text(
                            'Email*',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  !EmailValidator.validate(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value!,
                          ),
                          const SizedBox(height: 32.0),
                          const Text(
                            'Username*',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "grotesco"),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your username',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          const Text(
                            'Password*',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            obscureText: _obscureText,
                            validator: (value) {
                              final RegExp regex = RegExp(
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&\*~]).{6,}$');
                              if (value == null || value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              // Password strength validation
                              if (!regex.hasMatch(value)) {
                                return 'Password must contain at least one uppercase letter, '
                                    'one lowercase letter, one digit, and one special character';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value!,
                          ),
                          const SizedBox(height: 32.0),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 174, 220, 255),
                                  Color.fromARGB(255, 218, 236, 250),
                                  Color(0xFFd7d7d7),
                                ],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () => _submitForm(context),
                              child: const Text(
                                'Create an account',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "We'll take care of your Privacy. ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "grotesco-medium"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
