import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/auth/auth_event.dart';
import 'desktop_sidebar.dart';
import 'tablet_rail.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const List<_NavItem> _items = [
    _NavItem('Home', Icons.home_rounded, '/dashboard/home'),
    _NavItem(
      'Budget',
      Icons.account_balance_wallet_rounded,
      '/dashboard/budget',
    ),
    _NavItem('Analytics', Icons.bar_chart_rounded, '/dashboard/analytics'),
    _NavItem('AI Assistant', Icons.auto_awesome_rounded, '/dashboard/ai'),
    _NavItem('Settings', Icons.settings_rounded, '/dashboard/settings'),
  ];

  int _activeIndex(BuildContext context) {
    final matchedLocation = GoRouterState.of(context).matchedLocation;
    final index = _items.indexWhere(
      (item) => matchedLocation.startsWith(item.route),
    );
    return index < 0 ? 0 : index;
  }

  void _goToIndex(BuildContext context, int index) {
    context.go(_items[index].route);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _activeIndex(context);
    final railDestinations = _items
        .map(
          (item) => NavigationRailDestination(
            icon: Icon(item.icon, size: 3.h),
            label: const SizedBox.shrink(),
          ),
        )
        .toList();

    final desktopDestinations = _items
        .map((item) => DesktopDestination(label: item.label, icon: item.icon))
        .toList();

    final content = AppBreakpoints.isDesktop(context)
        ? Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: child,
            ),
          )
        : child;

    if (AppBreakpoints.isMobile(context)) {
      return Scaffold(
        body: content,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _goToIndex(context, index),
          items: _items
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon, size: 3.h),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      );
    }

    if (AppBreakpoints.isTablet(context)) {
      return Scaffold(
        body: Row(
          children: [
            TabletRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => _goToIndex(context, index),
              destinations: railDestinations,
            ),
            Expanded(child: content),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          DesktopSidebar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => _goToIndex(context, index),
            destinations: desktopDestinations,
            onLogout: () {
              context.read<AuthBloc>().add(const AuthEvent.signOutRequested());
              context.go('/login');
            },
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
  final String route;
}
