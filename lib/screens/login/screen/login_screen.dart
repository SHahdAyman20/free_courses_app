import 'package:flutter/material.dart';
import 'package:free_courses_app/const/const.dart';
import 'package:free_courses_app/forget_pass/forget_password.dart';
import 'package:free_courses_app/screens/home/HomeScreen.dart';
import 'package:free_courses_app/screens/register/screen/RegisterScreen.dart';
import 'package:free_courses_app/widgets/custom_button.dart';
import 'package:free_courses_app/widgets/custom_text_field.dart';
import 'package:free_courses_app/widgets/custom_text_field_label.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Image.asset('assets/Web-design.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.contain,
              ),
              //login text
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: kPrimaryColor,
                  fontSize: 45,
                ),
              ),
              //email
              CustomTextFieldLabel(icon: Icons.email, label: 'Email'),
              CustomTextField(
                type: TextInputType.emailAddress,
                action: TextInputAction.next,
                hintText: '  info@example.com',
                controller: emailController,
                validator: (email) {
                  if (email.isEmpty) {
                    return 'this field is required!';
                  } else if (!email.toString().contains('@')) {
                    return 'Email must contain "@" ';
                  } else if (!email.toString().contains('.')) {
                    return 'Email must contain "." ';
                  }
                },
              ),
              // pass
              CustomTextFieldLabel(icon: Icons.lock, label: 'Password'),
              CustomTextField(
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                hintText: '  **********',
                controller: passController,
                obscureText: obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  icon: obscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                validator: (pass) {
                  if (pass.isEmpty) {
                    return 'This field is required!';
                  } else if (pass.toString().length < 8) {
                    return 'this password too weak !';
                  }
                },
              ),
              // forget password ?
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff656363),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ForgetPassword(),
                      ),
                    );
                  },
                ),
              ),
              // login button
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                title: 'Log In',
                  onPressed: (){
                    navigateTo(context,HomeScreen());
                    validateForm();
                  },
              ),
              // if you don't have an account sign up
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: kPrimaryColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => RegisterScreen(),
                          ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void validateForm(){
    if(formKey.currentState!.validate()){
      return;
    }
  }


 // sign in with google

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

// sign in with facebook

/*

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
* */

// sign in with github

/*
Future<UserCredential> signInWithGitHub() async {
  // Create a GitHubSignIn instance
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: clientId,
          clientSecret: clientSecret,
          redirectUrl: 'https://my-project.firebaseapp.com/__/auth/handler');

  // Trigger the sign-in flow
  final result = await gitHubSignIn.signIn(context);

  // Create a credential from the access token
  final githubAuthCredential = GithubAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
}
* */



}
