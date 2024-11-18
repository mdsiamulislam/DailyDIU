import 'package:flutter/material.dart';

import '../../component/widget/custom_text_field.dart';
import '../../constant/design.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class RegScreen extends StatelessWidget {
  static final String id = 'reg_screen';
  const RegScreen({super.key});

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
                const SizedBox( height: 50 ),
                Image(image: AssetImage('assets/logo/diulogo.png'),width: 100,),
                const SizedBox( height: 20 ),
                Text(
                  'Registation Now',style: kauthTitleStyle,
                ),
                const SizedBox(height: 10),
                CustomTextField(keyboardType: TextInputType.name, lasbels: 'Name', hintText: 'Enter Your name', prefixIcon: const Icon(Icons.person),),
                SizedBox(height: 8),
                CustomTextField( keyboardType: TextInputType.emailAddress, lasbels: 'Email', hintText: 'Enter your email', prefixIcon: const Icon(Icons.email),),
                SizedBox(height: 8),
                CustomTextField( keyboardType: TextInputType.visiblePassword, lasbels: 'Password', hintText: 'Enter your password', prefixIcon: const Icon(Icons.lock),obscureText: true,),
                SizedBox(height: 8),
                // Registation Number
                CustomTextField( keyboardType: TextInputType.number, lasbels: 'Registation Number', hintText: 'Enter your Registation Number', prefixIcon: const Icon(Icons.confirmation_number),),
                SizedBox(height: 8),
                // Department Name
                CustomTextField( keyboardType: TextInputType.name, lasbels: 'Department Name', hintText: 'Enter your Department Name', prefixIcon: const Icon(Icons.apartment),),
                SizedBox(height: 8),
                // Batch Name
                CustomTextField( keyboardType: TextInputType.number, lasbels: 'Batch Name', hintText: 'Enter your Batch Name', prefixIcon: const Icon(Icons.confirmation_number),),
                SizedBox(height: 8),
                // Phone Number
                CustomTextField( keyboardType: TextInputType.phone, lasbels: 'Phone Number', hintText: 'Enter your Phone Number', prefixIcon: const Icon(Icons.phone),),

                //TODO: Image upload
                const SizedBox(height: 8),

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
                    child: const Text('Sing Up',style: TextStyle(
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
                    const Text('Already have an account?'),
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
