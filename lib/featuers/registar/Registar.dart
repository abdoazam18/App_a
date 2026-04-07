import 'package:auth/core/assets/app_icone.dart';
import 'package:auth/core/theme/app_colors.dart';
import 'package:auth/core/theme/app_text_style.dart';
import 'package:auth/core/utils/app_responsive.dart';
import 'package:auth/featuers/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registar extends StatefulWidget {
  const Registar({super.key});

  @override
  State<Registar> createState() => _RegistarState();
}

class _RegistarState extends State<Registar> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscurePass = true;
  bool _isObscureConfirm = true;
  bool _isAccepted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsiv.width(context) * 0.06),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppResponsiv.height(context) * 0.02),
                  
                  SvgPicture.asset(
                    APPicone.Icon,
                    width: AppResponsiv.width(context) * 0.12,
                    height: AppResponsiv.height(context) * 0.08,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.01),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Plant", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.hintcolor, fontSize: 20)),
                      Text("Shop", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.primaryColor, fontSize: 20)),
                    ],
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.01),
                  
                  Text(
                    "Create new account",
                    style: AppTextStyle.txtbold20.copyWith(color: AppColors.primaryColor, fontSize: 22),
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.03),

                  // --- Email Field ---
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email Address", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.Textcolor, fontSize: 15)),
                  ),
                  SizedBox(height: AppResponsiv.height(context) * 0.01),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter your email';
                      if (!value.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      hintStyle: AppTextStyle.txtsid16.copyWith(color: AppColors.hintcolor, fontSize: 13),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15), // تصغير الحقل قليلاً
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: AppColors.primaryColor)),
                    ),
                  ),
                  
                  SizedBox(height: AppResponsiv.height(context) * 0.02),

                  // --- Password Field ---
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.Textcolor, fontSize: 15)),
                  ),
                  SizedBox(height: AppResponsiv.height(context) * 0.01),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscurePass,
                    validator: (value) {
                      if (value == null || value.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: AppTextStyle.txtsid16.copyWith(color: AppColors.hintcolor, fontSize: 13),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscurePass ? Icons.visibility_off : Icons.visibility, size: 20, color: Colors.grey),
                        onPressed: () => setState(() => _isObscurePass = !_isObscurePass),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: AppColors.primaryColor)),
                    ),
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.02),

                  // --- Confirm Password Field ---
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Confirm Password", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.Textcolor, fontSize: 15)),
                  ),
                  SizedBox(height: AppResponsiv.height(context) * 0.01),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isObscureConfirm,
                    validator: (value) {
                      if (value != _passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm your password',
                      hintStyle: AppTextStyle.txtsid16.copyWith(color: AppColors.hintcolor, fontSize: 13),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscureConfirm ? Icons.visibility_off : Icons.visibility, size: 20, color: Colors.grey),
                        onPressed: () => setState(() => _isObscureConfirm = !_isObscureConfirm),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: AppColors.primaryColor)),
                    ),
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.015),

                  Row(
                    children: [
                      SizedBox(
                        height: 24, width: 24,
                        child: Checkbox(
                          value: _isAccepted,
                          activeColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          onChanged: (val) => setState(() => _isAccepted = val!),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "I've read and agreed to ",
                            style: AppTextStyle.txtsid16.copyWith(fontSize: 12),
                            children: [
                              TextSpan(text: "User Agreement", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
                              const TextSpan(text: " and "),
                              TextSpan(text: "Privacy Policy", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.03),



                  // --- Sign Up Button ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
  if (_formKey.currentState!.validate()) {
    if (!_isAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept terms and conditions")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), //  
        password: _passwordController.text,
      );

      //  
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.green, content: Text("Success! User created.")),
        );
        Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen ()), //    
);
      }

    } on FirebaseAuthException catch (e) {
      String message = "An error occurred";
      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        message = "The email address is badly formatted.";
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(message)),
        );
      }
    } catch (e) {
      // أي خطأ آخر
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }
},




                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: AppResponsiv.height(context) * 0.02),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text("Sign up", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),




                  SizedBox(height: AppResponsiv.height(context) * 0.03),

                  Text("other way to sign in", style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                  
                  SizedBox(height: AppResponsiv.height(context) * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Social Icon Google
                      Container(
                        padding: const EdgeInsets.all(10), 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Icon(Icons.g_mobiledata, size: AppResponsiv.width(context) * 0.08, color: Colors.red),
                      ),
                      SizedBox(width: AppResponsiv.width(context) * 0.08),
                      // Social Icon Facebook
                      Container(
                        padding: const EdgeInsets.all(10), 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Icon(Icons.facebook, size: AppResponsiv.width(context) * 0.08, color: Colors.blue),
                      ),
                    ],
                  ),

                  SizedBox(height: AppResponsiv.height(context) * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Back to Sign In",
                          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppResponsiv.height(context) * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}