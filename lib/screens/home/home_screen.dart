import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final TextEditingController _searchController =
  TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(
          context,
          AppRoutes.parkingList,
        );
        break;

      case 2:
        Navigator.pushNamed(
          context,
          AppRoutes.activeReservation,
        );
        break;

      case 3:
        Navigator.pushNamed(
          context,
          AppRoutes.profile,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildLocationCard(),
              _buildQuickActions(),
              _buildActiveReservation(),
              _buildNearbySection(),
              _buildParkingCard(
                name: 'City Center Parking',
                address: 'Main Boulevard, City Center',
                distance: '0.8 km',
                available: 18,
                total: 50,
                price: 'Rs. 80/hr',
                rating: '4.8',
                icon: Icons.local_parking_rounded,
              ),
              _buildParkingCard(
                name: 'Mall Parking',
                address: 'Central Mall, Downtown',
                distance: '1.4 km',
                available: 7,
                total: 35,
                price: 'Rs. 100/hr',
                rating: '4.6',
                icon: Icons.local_parking_rounded,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // =========================================================
  // HEADER
  // =========================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        18,
        20,
        20,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(
                    alpha: 0.18,
                  ),
                  blurRadius: 16,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: const Icon(
              Icons.local_parking_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning 👋',
                  style: GoogleFonts.poppins(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Find Your Parking',
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          _buildHeaderButton(
            icon: Icons.notifications_none_rounded,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.notifications,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withValues(
              alpha: 0.06,
            ),
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 23,
        ),
      ),
    );
  }

  // =========================================================
  // SEARCH
  // =========================================================

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Colors.black.withValues(
              alpha: 0.06,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.025,
              ),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          textInputAction: TextInputAction.search,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            hintText: 'Search parking, area or location',
            hintStyle: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 12.5,
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.primary,
              size: 23,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.parkingMap,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(
                      alpha: 0.08,
                    ),
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.map_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
            border: InputBorder.none,
            contentPadding:
            const EdgeInsets.symmetric(
              vertical: 17,
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================
  // LOCATION
  // =========================================================

  Widget _buildLocationCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        18,
        20,
        0,
      ),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F3D75),
              Color(0xFF167A91),
            ],
          ),
          borderRadius: BorderRadius.circular(21),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(
                alpha: 0.18,
              ),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                  alpha: 0.12,
                ),
                borderRadius:
                BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.location_on_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your current location',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 10.5,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Use my current location',
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                  alpha: 0.12,
                ),
                borderRadius:
                BorderRadius.circular(11),
              ),
              child: Text(
                'Locate',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // QUICK ACTIONS
  // =========================================================

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        25,
        20,
        0,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildQuickAction(
              icon: Icons.search_rounded,
              title: 'Find Parking',
              subtitle: 'Nearby spots',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.parkingList,
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildQuickAction(
              icon: Icons.map_rounded,
              title: 'View Map',
              subtitle: 'Explore area',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.parkingMap,
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildQuickAction(
              icon: Icons.bookmark_rounded,
              title: 'Reservations',
              subtitle: 'Your bookings',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.activeReservation,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.black.withValues(
              alpha: 0.055,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.09,
                ),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(height: 11),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: AppColors.textPrimary,
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: AppColors.textSecondary,
                fontSize: 9.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // ACTIVE RESERVATION
  // =========================================================

  Widget _buildActiveReservation() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        27,
        20,
        0,
      ),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.success.withValues(
              alpha: 0.15,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.local_parking_rounded,
                color: AppColors.success,
                size: 23,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Active Reservation',
                        style:
                        GoogleFonts.poppins(
                          color:
                          AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success
                              .withValues(
                            alpha: 0.10,
                          ),
                          borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Text(
                          'ACTIVE',
                          style:
                          GoogleFonts.poppins(
                            color:
                            AppColors.success,
                            fontSize: 7.5,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'City Center Parking • Slot A-18',
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color:
                      AppColors.textSecondary,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // NEARBY SECTION
  // =========================================================

  Widget _buildNearbySection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        28,
        20,
        14,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Nearby Parking',
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Available parking spaces near you',
                  style: GoogleFonts.poppins(
                    color: AppColors.textSecondary,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.parkingList,
              );
            },
            child: Text(
              'See All',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PARKING CARD
  // =========================================================

  Widget _buildParkingCard({
    required String name,
    required String address,
    required String distance,
    required int available,
    required int total,
    required String price,
    required String rating,
    required IconData icon,
  }) {
    final double availability =
        available / total;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.parkingDetails,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius:
            BorderRadius.circular(19),
            border: Border.all(
              color: Colors.black.withValues(
                alpha: 0.055,
              ),
            ),
          ),
          child: Row(
            children: [
              // Parking Icon
              Container(
                width: 67,
                height: 67,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary
                          .withValues(alpha: 0.12),
                      AppColors.secondary
                          .withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius:
                  BorderRadius.circular(17),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 31,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,
                            style:
                            GoogleFonts.poppins(
                              color: AppColors
                                  .textPrimary,
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.star_rounded,
                          color:
                          AppColors.warning,
                          size: 16,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating,
                          style:
                          GoogleFonts.poppins(
                            color: AppColors
                                .textPrimary,
                            fontSize: 10,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color:
                          AppColors.textSecondary,
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            address,
                            maxLines: 1,
                            overflow:
                            TextOverflow.ellipsis,
                            style:
                            GoogleFonts.poppins(
                              color: AppColors
                                  .textSecondary,
                              fontSize: 9.5,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 9),

                    Row(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets
                              .symmetric(
                            horizontal: 7,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success
                                .withValues(
                              alpha: 0.08,
                            ),
                            borderRadius:
                            BorderRadius.circular(
                              7,
                            ),
                          ),
                          child: Text(
                            '$available spots',
                            style:
                            GoogleFonts.poppins(
                              color:
                              AppColors.success,
                              fontSize: 8.5,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          distance,
                          style: GoogleFonts.poppins(
                            color: AppColors
                                .textSecondary,
                            fontSize: 9,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          price,
                          style: GoogleFonts.poppins(
                            color:
                            AppColors.primary,
                            fontSize: 10,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10),
                      child:
                      LinearProgressIndicator(
                        value: availability,
                        minHeight: 4,
                        backgroundColor:
                        AppColors.background,
                        valueColor:
                        AlwaysStoppedAnimation<
                            Color>(
                          available <= 5
                              ? AppColors.warning
                              : AppColors.success,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // BOTTOM NAVIGATION
  // =========================================================

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.07,
            ),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            12,
            8,
            12,
            8,
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.home_rounded,
                label: 'Home',
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.local_parking_rounded,
                label: 'Parking',
              ),
              _buildNavItem(
                index: 2,
                icon: Icons.bookmark_rounded,
                label: 'Bookings',
              ),
              _buildNavItem(
                index: 3,
                icon: Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected =
        _currentIndex == index;

    return GestureDetector(
      onTap: () => _onNavigationTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(
            alpha: 0.09,
          )
              : Colors.transparent,
          borderRadius:
          BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.textSecondary,
              size: 22,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontSize: 9.5,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}