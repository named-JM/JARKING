import 'package:final_project_for_flutter_by_jarling/components/myTextfield.dart';
import 'package:final_project_for_flutter_by_jarling/components/signInBtn.dart';
import 'package:final_project_for_flutter_by_jarling/components/squareTile.dart';
import 'package:final_project_for_flutter_by_jarling/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //textfield editing controller!!!
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // signinuser in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //use this to make use of dealing different screen sizes just a handy trick
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              Image.asset(
                'Assets/images/icons/jarcrown.png',
                height: 120,
              ),

              const SizedBox(height: 25),

              //welcome text here !!!!
              Text(
                'Welcome To Jarking Studio! Please Sign in.',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(height: 50),

              //username textfield

              MyTextField(
                //access for line 8
                controller: usernameController,
                hintText: 'Username',
                obscureText: false, //so we can see the characters
              ),

              const SizedBox(height: 15),
              //password textfield
              MyTextField(
                //access for line 9
                controller: passwordController,
                hintText: 'Password',
                obscureText: true, //to hide caharacters
              ),

              const SizedBox(height: 10),

              //forgot password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              //sign in button
              SignInButton(
                //here to fill outy the on Tab in our signinBtn components
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              const SizedBox(height: 25),

              //continue with
              //just a line
              Padding(
                //padding to make the lines have margin space from both sides using horizontal
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      //padding naman dito from both sides of the text para may space betwwen divider at text
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),

              const SizedBox(height: 25),

              //google yahoo button

              Row(
                //to make it to center
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'Assets/images/icons/google.png'),

                  const SizedBox(width: 20),
                  //yahoo button
                  SquareTile(imagePath: 'Assets/images/icons/yahoo.png')
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Register now.',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
