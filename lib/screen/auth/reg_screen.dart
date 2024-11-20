import 'package:flutter/material.dart';

import '../../component/widget/custom_text_field.dart';
import '../../constant/design.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class RegScreen extends StatelessWidget {
  static const String id = 'reg_screen';

  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/logo/diulogo.png',
                  width: 120,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Register Now',
                style: kauthTitleStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Create an account to access all features.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                keyboardType: TextInputType.name,
                label: 'Name',
                hintText: 'Enter your name',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.number,
                label: 'Registration Number',
                hintText: 'Enter your registration number',
                prefixIcon: const Icon(Icons.confirmation_number),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.name,
                label: 'Department Name',
                hintText: 'Enter your department name',
                prefixIcon: const Icon(Icons.apartment),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.number,
                label: 'Batch Name',
                hintText: 'Enter your batch name',
                prefixIcon: const Icon(Icons.group),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.phone,
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixIcon: const Icon(Icons.phone),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
