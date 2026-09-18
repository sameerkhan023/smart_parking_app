import 'package:flutter/material.dart';

// ==========================================
// SPLASH & ONBOARDING
// ==========================================

import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';

// ==========================================
// AUTH
// ==========================================

import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/forgot_password_screen.dart';

// ==========================================
// HOME
// ==========================================

import '../screens/home/home_screen.dart';

class AppRoutes {
  // ==========================================
  // SPLASH & ONBOARDING
  // ==========================================

  static const String splash = '/';
  static const String onboarding = '/onboarding';

  // ==========================================
  // AUTH
  // ==========================================

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword =
      '/forgot-password';

  // ==========================================
  // HOME
  // ==========================================

  static const String home = '/home';

  // ==========================================
  // PARKING
  // ==========================================

  static const String parkingList = '/parking-list';
  static const String parkingMap = '/parking-map';
  static const String parkingDetails =
      '/parking-details';
  static const String parkingSlots =
      '/parking-slots';

  // ==========================================
  // RESERVATION
  // ==========================================

  static const String reservation = '/reservation';

  static const String reservationConfirmation =
      '/reservation-confirmation';

  static const String activeReservation =
      '/active-reservation';

  // ==========================================
  // HISTORY
  // ==========================================

  static const String parkingHistory =
      '/parking-history';

  // ==========================================
  // FAVORITES
  // ==========================================

  static const String favorites = '/favorites';

  // ==========================================
  // VEHICLES
  // ==========================================

  static const String vehicles = '/vehicles';
  static const String addVehicle = '/add-vehicle';

  // ==========================================
  // PAYMENT
  // ==========================================

  static const String payment = '/payment';

  // ==========================================
  // NOTIFICATIONS
  // ==========================================

  static const String notifications =
      '/notifications';

  // ==========================================
  // PROFILE
  // ==========================================

  static const String profile = '/profile';
  static const String editProfile =
      '/edit-profile';
  static const String settings = '/settings';

  // ==========================================
  // ROUTE GENERATOR
  // ==========================================

  static Route<dynamic> generateRoute(
      RouteSettings routeSettings,
      ) {
    switch (routeSettings.name) {
    // ==========================================
    // SPLASH
    // ==========================================

      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

    // ==========================================
    // ONBOARDING
    // ==========================================

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

    // ==========================================
    // LOGIN
    // ==========================================

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

    // ==========================================
    // REGISTER
    // ==========================================

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

    // ==========================================
    // FORGOT PASSWORD
    // ==========================================

      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) =>
          const ForgotPasswordScreen(),
        );

    // ==========================================
    // HOME
    // ==========================================

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

    // ==========================================
    // PARKING
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // RESERVATION
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // HISTORY
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // FAVORITES
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // VEHICLES
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // PAYMENT
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // NOTIFICATIONS
    // ==========================================

    // These routes will be connected
    // when their screen is created.

    // ==========================================
    // PROFILE
    // ==========================================

    // These routes will be connected
    // when their screens are created.

    // ==========================================
    // DEFAULT
    // ==========================================

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}