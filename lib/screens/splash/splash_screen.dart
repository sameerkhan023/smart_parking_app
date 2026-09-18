import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _contentController;

  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late Animation<double> _contentFade;
  late Animation<Offset> _contentSlide;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoScale = Tween<double>(
      begin: 0.65,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOutBack,
      ),
    );

    _logoFade = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _contentFade = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeIn,
    );

    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeOutCubic,
      ),
    );

    _startAnimations();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.onboarding,
      );
    });
  }

  Future<void> _startAnimations() async {
    await _logoController.forward();

    if (!mounted) return;

    await Future.delayed(
      const Duration(milliseconds: 150),
    );

    if (!mounted) return;

    _contentController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF071A35),
              Color(0xFF0B3B73),
              Color(0xFF0E7490),
            ],
            stops: [
              0.0,
              0.55,
              1.0,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Top glow
              Positioned(
                top: -120,
                right: -80,
                child: _glowCircle(
                  size: 300,
                  opacity: 0.08,
                ),
              ),

              // Bottom glow
              Positioned(
                bottom: -140,
                left: -100,
                child: _glowCircle(
                  size: 340,
                  opacity: 0.07,
                ),
              ),

              // Small decorative circles
              Positioned(
                top: 180,
                left: -35,
                child: _glowCircle(
                  size: 100,
                  opacity: 0.04,
                ),
              ),

              Positioned(
                bottom: 220,
                right: -25,
                child: _glowCircle(
                  size: 80,
                  opacity: 0.05,
                ),
              ),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: _logoFade,
                      child: ScaleTransition(
                        scale: _logoScale,
                        child: _buildLogo(),
                      ),
                    ),

                    const SizedBox(height: 32),

                    SlideTransition(
                      position: _contentSlide,
                      child: FadeTransition(
                        opacity: _contentFade,
                        child: Column(
                          children: [
                            Text(
                              AppStrings.appName,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 31,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Text(
                              AppStrings.appTagline,
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 42,
                child: FadeTransition(
                  opacity: _contentFade,
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: 0.10,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(
                              alpha: 0.15,
                            ),
                          ),
                        ),
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Finding your perfect spot...',
                        style: GoogleFonts.poppins(
                          color: Colors.white60,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 132,
      height: 132,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(
          alpha: 0.10,
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: 0.20,
          ),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.20,
            ),
            blurRadius: 35,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 94,
          height: 94,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: 0.12,
                ),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.local_parking_rounded,
              size: 52,
              color: Color(0xFF0B3B73),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glowCircle({
    required double size,
    required double opacity,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(
          alpha: opacity,
        ),
      ),
    );
  }
}