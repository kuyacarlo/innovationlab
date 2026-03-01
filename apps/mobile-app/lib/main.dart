/// ============================================================
/// ANI-SABI — Main Entry Point
/// ============================================================
/// "Ating Nilinang, Simpleng Binalita"
/// Bridging scientific climate foresight and peasant solidarity.
///
/// This is the root of the Flutter application. It:
///   1. Registers Provider-based state management.
///   2. Applies the earthy Material 3 theme.
///   3. Wires up go_router for declarative navigation.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:til_hackathon/providers/providers.dart';
import 'package:til_hackathon/router/app_router.dart';
import 'package:til_hackathon/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AniSabiApp());
}

class AniSabiApp extends StatelessWidget {
  const AniSabiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ── Register all providers at the top of the tree ────
      providers: [
        ChangeNotifierProvider(create: (_) => CampaignProvider()),
        ChangeNotifierProvider(create: (_) => UssdLogProvider()),
      ],
      child: MaterialApp.router(
        title: 'ANI-SABI',
        debugShowCheckedModeBanner: false,

        // Earthy Material 3 theme (forest greens + soil browns).
        theme: buildAniSabiTheme(),

        // Declarative routing via go_router.
        routerConfig: appRouter,
      ),
    );
  }
}
