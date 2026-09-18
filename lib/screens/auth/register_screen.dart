import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
  TextEditingController();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  final TextEditingController _confirmPasswordController =
  TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please agree to the terms and conditions.',
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            24,
            24,
            30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),

                const SizedBox(height: 35),

                Text(
                  'Create Account',
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Create your account and start parking smarter.',
                  style: GoogleFonts.poppins(
                    color: AppColors.textSecondary,
                    fontSize: 13.5,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 28),

                _buildLabel('Full Name'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _nameController,
                  textCapitalization:
                  TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(
                    hint: 'Enter your full name',
                    icon: Icons.person_outline_rounded,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your name';
                    }

                    if (value.trim().length < 2) {
                      return 'Name is too short';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                _buildLabel('Email Address'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(
                    hint: 'Enter your email',
                    icon: Icons.email_outlined,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                _buildLabel('Password'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(
                    hint: 'Create a password',
                    icon: Icons.lock_outline_rounded,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                          !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textSecondary,
                        size: 21,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                _buildLabel('Confirm Password'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  decoration: _inputDecoration(
                    hint: 'Confirm your password',
                    icon: Icons.lock_reset_outlined,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textSecondary,
                        size: 21,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }

                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms =
                                value ?? false;
                          });
                        },
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        'I agree to the Terms & Conditions and Privacy Policy.',
                        style: GoogleFonts.poppins(
                          color: AppColors.textSecondary,
                          fontSize: 11.5,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(17),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Account',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 12.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: AppColors.primary,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.local_parking_rounded,
            color: AppColors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 13),
        Text(
          AppStrings.appName,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.textSecondary,
        fontSize: 13,
      ),
      prefixIcon: Icon(
        icon,
        color: AppColors.textSecondary,
        size: 21,
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
    );
  }
}