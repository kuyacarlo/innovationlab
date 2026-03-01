/// ============================================================
/// ANI-SABI — Router Configuration (go_router)
/// ============================================================
/// Declarative routing setup. Uses a ShellRoute with a
/// BottomNavigationBar that switches between:
///   0 — Home (Bungkalan feed)
///   1 — Impact (Farmer timeline)
///   2 — Demo Panel (SARAI trigger + USSD logger)
///
/// A sub-route under /basket/:id handles the Solidarity
/// Basket subscription screen (pushed on top of the shell).
/// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:til_hackathon/screens/screens.dart';
import 'package:til_hackathon/theme/app_theme.dart';

/// The global router instance consumed by MaterialApp.router.
final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    // ── Shell route: bottom nav bar ─────────────────────────
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return _ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // Branch 0 — Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // Branch 1 — Impact
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/impact',
              builder: (context, state) => const ImpactScreen(),
            ),
          ],
        ),
        // Branch 2 — Demo Dashboard
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/demo',
              builder: (context, state) => const DemoDashboardScreen(),
            ),
          ],
        ),
      ],
    ),

    // ── Basket detail (pushed on top, outside shell) ─────────
    GoRoute(
      path: '/basket/:id',
      builder: (context, state) {
        final campaignId = state.pathParameters['id']!;
        return BasketScreen(campaignId: campaignId);
      },
    ),
  ],
);

// ─────────────────────────────────────────────────────────────
// Scaffold wrapper that hosts the BottomNavigationBar for
// the three main tabs.
// ─────────────────────────────────────────────────────────────

class _ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const _ScaffoldWithNavBar({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          // Navigate to the branch at the given index.
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        backgroundColor: Colors.white,
        indicatorColor: kSageGreen.withValues(alpha: 0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: kForestGreen),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people, color: kForestGreen),
            label: 'Impact',
          ),
          NavigationDestination(
            icon: Icon(Icons.developer_board_outlined),
            selectedIcon: Icon(Icons.developer_board, color: kForestGreen),
            label: 'Demo',
          ),
        ],
      ),
    );
  }
}
