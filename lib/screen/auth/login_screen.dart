import 'package:dailydiu/component/widget/custom_text_field.dart';
import 'package:dailydiu/constant/design.dart';
import 'package:dailydiu/screen/auth/forget_screen.dart';
import 'package:dailydiu/screen/auth/reg_screen.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class LoginScreen extends StatelessWidget {
  static final String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Login',style: kauthTitleStyle,
                ),
                const SizedBox(height: 10),
                CustomTextField(keyboardType: TextInputType.emailAddress, lasbels: 'Email', hintText: 'Enter Your Name', prefixIcon: Icon(Icons.email)),
                const SizedBox(height: 8),
                CustomTextField(keyboardType: TextInputType.visiblePassword, lasbels: 'Password', hintText: 'Enter Your Password', prefixIcon: Icon(Icons.lock), obscureText: true,),
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
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    child: const Text('Login',style: TextStyle(
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
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegScreen.id);
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
                // Forget Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetScreen.id);
                      },
                      child: const Text('Forget Password?'),
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
