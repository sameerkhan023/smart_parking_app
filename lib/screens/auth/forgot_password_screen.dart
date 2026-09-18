import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();

  final TextEditingController _emailController =
  TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Password reset link sent to your email.',
          style: GoogleFonts.poppins(
            fontSize: 13,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.success,
      ),
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
            20,
            24,
            30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                // ==========================================
                // BACK BUTTON
                // ==========================================

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius:
                      BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black.withValues(
                          alpha: 0.06,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.textPrimary,
                      size: 21,
                    ),
                  ),
                ),

                const SizedBox(height: 42),

                // ==========================================
                // ICON
                // ==========================================

                Center(
                  child: Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(
                        alpha: 0.10,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock_reset_rounded,
                      color: AppColors.primary,
                      size: 42,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ==========================================
                // TITLE
                // ==========================================

                Center(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Center(
                  child: Text(
                    'Enter your email address and we\'ll send you a link to reset your password.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textSecondary,
                      fontSize: 13.5,
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // ==========================================
                // EMAIL LABEL
                // ==========================================

                Text(
                  'Email Address',
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 9),

                // ==========================================
                // EMAIL FIELD
                // ==========================================

                TextFormField(
                  controller: _emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 13.5,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.poppins(
                      color: AppColors.textSecondary
                          .withValues(alpha: 0.65),
                      fontSize: 13,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.textSecondary,
                      size: 21,
                    ),
                    filled: true,
                    fillColor: AppColors.surface,
                    contentPadding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 17,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black.withValues(
                          alpha: 0.06,
                        ),
                      ),
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.3,
                      ),
                    ),
                    errorBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                      ),
                    ),
                    focusedErrorBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    final emailRegex = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    );

                    if (!emailRegex.hasMatch(
                      value.trim(),
                    )) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                  onFieldSubmitted: (_) {
                    _sendResetLink();
                  },
                ),

                const SizedBox(height: 28),

                // ==========================================
                // RESET BUTTON
                // ==========================================

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed:
                    _isLoading ? null : _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primary,
                      foregroundColor:
                      AppColors.white,
                      disabledBackgroundColor:
                      AppColors.primary
                          .withValues(alpha: 0.6),
                      elevation: 0,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                      width: 22,
                      height: 22,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2.3,
                        valueColor:
                        AlwaysStoppedAnimation<
                            Color>(
                          Colors.white,
                        ),
                      ),
                    )
                        : Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send Reset Link',
                          style:
                          GoogleFonts.poppins(
                            fontSize: 14.5,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 9),
                        const Icon(
                          Icons
                              .arrow_forward_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ==========================================
                // BACK TO LOGIN
                // ==========================================

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Remember your password? ',
                        style: GoogleFonts.poppins(
                          color:
                          AppColors.textSecondary,
                          fontSize: 12.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style:
                            GoogleFonts.poppins(
                              color:
                              AppColors.primary,
                              fontSize: 12.5,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ==========================================
                // SECURITY NOTE
                // ==========================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary
                        .withValues(alpha: 0.05),
                    borderRadius:
                    BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary
                          .withValues(alpha: 0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.verified_user_outlined,
                        color: AppColors.primary,
                        size: 21,
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Text(
                          'For your security, we only send password reset instructions to the email associated with your account.',
                          style:
                          GoogleFonts.poppins(
                            color:
                            AppColors.textSecondary,
                            fontSize: 11.5,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}