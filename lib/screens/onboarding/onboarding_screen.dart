import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingData> _pages = const [
    OnboardingData(
      icon: Icons.local_parking_rounded,
      title: 'Find Parking Easily',
      description:
      'Discover nearby parking spaces quickly and avoid wasting time searching for an available spot.',
      label: 'SMART PARKING',
    ),
    OnboardingData(
      icon: Icons.location_on_rounded,
      title: 'Parking Near You',
      description:
      'Use your location to explore nearby parking areas and view available spaces on the map.',
      label: 'LIVE LOCATION',
    ),
    OnboardingData(
      icon: Icons.bookmark_added_rounded,
      title: 'Reserve Your Spot',
      description:
      'Choose a parking space in advance, reserve it, and enjoy a smooth and stress-free parking experience.',
      label: 'EASY RESERVATION',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _skipOnboarding() {
    _finishOnboarding();
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        18,
        24,
        8,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.local_parking_rounded,
              color: AppColors.primary,
              size: 23,
            ),
          ),

          const SizedBox(width: 11),

          Text(
            AppStrings.appName,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          TextButton(
            onPressed: _skipOnboarding,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
            ),
            child: Text(
              AppStrings.skip,
              style: GoogleFonts.poppins(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingData page) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIllustration(page),

          const SizedBox(height: 42),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: 0.08,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              page.label,
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Text(
            page.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 28,
              height: 1.2,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            page.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 13.5,
              height: 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration(OnboardingData page) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(
                alpha: 0.045,
              ),
            ),
          ),

          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(
                alpha: 0.065,
              ),
            ),
          ),

          Positioned(
            top: 35,
            right: 35,
            child: _smallDot(
              size: 9,
              opacity: 0.30,
            ),
          ),

          Positioned(
            top: 75,
            left: 30,
            child: _smallDot(
              size: 6,
              opacity: 0.22,
            ),
          ),

          Positioned(
            bottom: 55,
            right: 30,
            child: _smallDot(
              size: 7,
              opacity: 0.25,
            ),
          ),

          Positioned(
            bottom: 35,
            left: 55,
            child: _smallDot(
              size: 10,
              opacity: 0.18,
            ),
          ),

          Container(
            width: 174,
            height: 174,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(52),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(
                    alpha: 0.12,
                  ),
                  blurRadius: 35,
                  offset: const Offset(0, 18),
                ),
              ],
              border: Border.all(
                color: AppColors.primary.withValues(
                  alpha: 0.08,
                ),
              ),
            ),
            child: Center(
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(
                        alpha: 0.25,
                      ),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  page.icon,
                  color: AppColors.white,
                  size: 55,
                ),
              ),
            ),
          ),

          if (_currentPage == 0)
            Positioned(
              right: 28,
              bottom: 55,
              child: _featureBubble(
                Icons.search_rounded,
              ),
            ),

          if (_currentPage == 1)
            Positioned(
              right: 28,
              top: 58,
              child: _featureBubble(
                Icons.gps_fixed_rounded,
              ),
            ),

          if (_currentPage == 2)
            Positioned(
              left: 28,
              bottom: 55,
              child: _featureBubble(
                Icons.check_rounded,
              ),
            ),
        ],
      ),
    );
  }

  Widget _featureBubble(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.08,
            ),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: AppColors.primary,
        size: 22,
      ),
    );
  }

  Widget _smallDot({
    required double size,
    required double opacity,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: opacity,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBottomSection() {
    final bool isLastPage =
        _currentPage == _pages.length - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        10,
        24,
        28,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
                  (index) => _buildIndicator(index),
            ),
          ),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 0,
                shadowColor: AppColors.primary.withValues(
                  alpha: 0.25,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    isLastPage
                        ? AppStrings.getStarted
                        : AppStrings.next,
                    style: GoogleFonts.poppins(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 9),
                  Icon(
                    isLastPage
                        ? Icons.arrow_forward_rounded
                        : Icons.chevron_right_rounded,
                    size: 21,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 250,
            ),
            child: Text(
              isLastPage
                  ? 'Your smarter parking experience starts here'
                  : 'Swipe or tap next to continue',
              key: ValueKey(isLastPage),
              style: GoogleFonts.poppins(
                color: AppColors.textSecondary,
                fontSize: 10.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    final bool isActive = index == _currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      width: isActive ? 28 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withValues(
          alpha: 0.16,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class OnboardingData {
  final IconData icon;
  final String title;
  final String description;
  final String label;

  const OnboardingData({
    required this.icon,
    required this.title,
    required this.description,
    required this.label,
  });
}