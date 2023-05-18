import 'package:appointiac/features/authentication/landing_page/landing_page.dart';
import 'package:appointiac/features/authentication/signup/signup_page.dart';
import 'package:appointiac/features/dashboard/dashboard_page.dart';
import 'package:appointiac/utils/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  String _email = '';
  String _password = '';
  bool _obscureText = true;

  void navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (await _authService.login(_email, _password)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
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
              color: Color(0xFFFF6C3F),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
          ),
        ),
      ),
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
                              style: GoogleFonts.getFont(
                                'Roboto',
                                textStyle: TextStyle(
                                  fontSize: 35 *
                                      MediaQuery.of(context).textScaleFactor,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 108, 63),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              'Welcome back!!!',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                textStyle: TextStyle(
                                  fontSize: 35 *
                                      MediaQuery.of(context).textScaleFactor,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 108, 63),
                                ),
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
                    color: Color.fromARGB(255, 255, 108, 63),
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
                          Center(
                            child: Text(
                              'Log in',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                textStyle: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          Text(
                            'Email*',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
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
                                return;
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value!,
                          ),
                          const SizedBox(height: 32.0),
                          Text(
                            'Password*',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
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
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
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
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF1D1D1D),
                            ),
                            child: TextButton(
                              onPressed: () => {
                                _submitForm(context),
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 108, 63)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => navigateToSignup(context),
                                child: Text(
                                  'Sign up',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
