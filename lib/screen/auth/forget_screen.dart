import 'package:flutter/material.dart';

import '../../component/widget/custom_text_field.dart';
import '../../constant/design.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class ForgetScreen extends StatelessWidget {
  static final String id = 'forget_screen';
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //Method for PopUp Message and navigate to login screen . PopUp Message: "Email has been sent to your email address to reset your password"
    // Method for PopUp Message and navigate to login screen. PopUp Message: "Email has been sent to your email address to reset your password"
    void _showEmailSentDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Password Reset'),
            content: const Text('Email has been sent to your email address to reset your password'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const SizedBox( height: 100 ),
                const Center(child: Image(image: AssetImage('assets/logo/diulogo.png'),width: 200,)),
                 const SizedBox( height: 50 ),
                 Text(
                  'Forget Password',style: kauthTitleStyle,
                ),
                const SizedBox(height: 10),
                CustomTextField(keyboardType: TextInputType.emailAddress, lasbels: 'Email', hintText: 'Enter Your Email', prefixIcon: Icon(Icons.email)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: () {
                      // PopUp Message and navigate to login screen . PopUp Message: "Email has been sent to your email address to reset your password"
                      //TODO: PopUp Message and navigate to login screen
                      _showEmailSentDialog(context);
                    },
                    child: const Text('Send Email',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                  ),
                 ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Remember your password?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: const Text('Login'),
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
