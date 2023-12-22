import 'package:flutter/material.dart';
import 'package:free_courses_app/const/const.dart';
import 'package:free_courses_app/forget_pass/forget_password.dart';
import 'package:free_courses_app/screens/home/HomeScreen.dart';
import 'package:free_courses_app/widgets/custom_button.dart';
import 'package:free_courses_app/widgets/custom_text_field.dart';
import 'package:free_courses_app/widgets/custom_text_field_label.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
  
}

class RegisterScreenState extends State<RegisterScreen>{

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
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
              Image.asset(
                'assets/Study-online.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.contain,
              ),
              //register text
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: kPrimaryColor,
                  fontSize: 45,
                ),
              ),
              //name
              CustomTextFieldLabel(icon: Icons.person, label: 'Name'),
              CustomTextField(
                type: TextInputType.text,
                action: TextInputAction.next,
                hintText: '  Shahd Ayman ',
                controller: nameController,
                validator: (name) {
                  if (name.isEmpty) {
                    return 'this field is required!';
                  }else if(name.length <3){
                    return 'the name must be at least 3 char!';
                  }
                },
              ),
              //phone number
              CustomTextFieldLabel(icon: Icons.phone, label: 'Phone Number'),
              CustomTextField(
                type: TextInputType.phone,
                action: TextInputAction.next,
                hintText: '  01212121212',
                controller: phoneNumberController,
                validator: (phone) {
                  if (phone.isEmpty) {
                    return 'this field is required!';
                  } else if (phone.length < 11) {
                    return 'phone number must be 11 number';
                  }
                },
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
              // register button
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                title: 'Register',
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
                    'Already have an account ? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                        'Sign In',
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
  
}