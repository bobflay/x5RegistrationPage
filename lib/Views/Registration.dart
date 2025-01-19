import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Controllers/RegistrationController.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            "Registration Page",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildInputLabel('Name'),
            _buildTextField(
                controller: _registrationController.name,
                hintText: "Enter your full name"),
            const SizedBox(height: 16),
            _buildInputLabel('Email'),
            _buildTextField(
                controller: _registrationController.email,
                hintText: "Enter your email"),
            const SizedBox(height: 16),
            _buildInputLabel('Mobile'),
            _buildTextField(
                controller: _registrationController.phone,
                hintText: "Enter your mobile number"),
            const SizedBox(height: 16),
            _buildInputLabel('Password'),
            _buildTextField(
                controller: _registrationController.password,
                hintText: "Enter your password",
                isPassword: true),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _registrationController.register();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoute.login);
                },
                child: const Text(
                  "Already have an account? Log in",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      TextEditingController? controller,
      bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      obscureText: isPassword,
    );
  }
}
