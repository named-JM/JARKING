import 'package:final_project_for_flutter_by_jarling/User_Auth/firebase_auth_services.dart';
import 'package:final_project_for_flutter_by_jarling/User_Auth/forgot_password.dart';
import 'package:final_project_for_flutter_by_jarling/User_Auth/form_container_widget.dart';
import 'package:final_project_for_flutter_by_jarling/User_Auth/signup.dart';
import 'package:final_project_for_flutter_by_jarling/global/common/toast.dart';
import 'package:final_project_for_flutter_by_jarling/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //auth instance
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                //logo
                Image.asset(
                  'Assets/images/icons/jarcrown.png',
                  height: 120,
                ),

                const SizedBox(height: 25),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 30,
                ),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
                      child: Text('Forgot Password?'),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                //--->SIGN IN WITH GOOGLE BUTTON
                GestureDetector(
                  onTap: () {
                    _signInWithGoogle();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: 21.5,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    //this will add if we type in that testfield it will add into the firebase

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } else {
      showToast(
          message:
              "Email or Password incorrect. Please Check Your Credentials.");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }
}
