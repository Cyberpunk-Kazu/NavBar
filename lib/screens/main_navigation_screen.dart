import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../models/user_model.dart';
import '../theme/app_theme.dart';
import 'box_office/box_office_screen.dart';
import 'dashboard/actors_dashboard_screen.dart';
import 'favorites/favorites_screen.dart';
import 'profile/user_profile_screen.dart';
import 'spotlight/spotlight_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserModel user;

  const MainNavigationScreen({
    super.key,
    required this.user,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late final PersistentTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<PersistentTabConfig> _buildTabs() {
    return [
      PersistentTabConfig(
        screen: ActorsDashboardScreen(user: widget.user),
        item: ItemConfig(
          icon: const Icon(Icons.grid_view_rounded),
          inactiveIcon: const Icon(Icons.grid_view_outlined),
          title: 'Actors',
          activeForegroundColor: AppTheme.primary,
          inactiveForegroundColor: AppTheme.muted,
        ),
      ),
      PersistentTabConfig(
        screen: const BoxOfficeScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.movie_rounded),
          inactiveIcon: const Icon(Icons.movie_outlined),
          title: 'Films',
          activeForegroundColor: AppTheme.primary,
          inactiveForegroundColor: AppTheme.muted,
        ),
      ),
      PersistentTabConfig(
        screen: const SpotlightScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.star_rounded, color: Colors.white),
          inactiveIcon: const Icon(Icons.star_outline_rounded, color: Colors.white),
          title: 'Spotlight',
          activeForegroundColor: AppTheme.primary,
          inactiveForegroundColor: AppTheme.primary,
        ),
      ),
      PersistentTabConfig(
        screen: const FavoritesScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.bookmark_rounded),
          inactiveIcon: const Icon(Icons.bookmark_border_rounded),
          title: 'Saved',
          activeForegroundColor: AppTheme.primary,
          inactiveForegroundColor: AppTheme.muted,
        ),
      ),
      PersistentTabConfig(
        screen: UserProfileScreen(user: widget.user),
        item: ItemConfig(
          icon: const Icon(Icons.person_rounded),
          inactiveIcon: const Icon(Icons.person_outline_rounded),
          title: 'Profile',
          activeForegroundColor: AppTheme.primary,
          inactiveForegroundColor: AppTheme.muted,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _tabController,
      tabs: _buildTabs(),
      navBarBuilder: (navBarConfig) => Style15BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          color: AppTheme.surface,
          border: Border(
            top: BorderSide(color: AppTheme.border, width: 1),
          ),
        ),
      ),
    );
  }
}
