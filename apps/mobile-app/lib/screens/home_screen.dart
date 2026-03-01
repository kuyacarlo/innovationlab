/// ============================================================
/// ANI-SABI — Home Screen (Bungkalan Feed)
/// ============================================================
/// The main landing screen for the Sulong consumer app.
/// Displays a list of active "Bungkalan" (collective farm)
/// campaigns with their funding progress. Each card is
/// tappable to navigate to the Solidarity Basket subscription.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:til_hackathon/providers/campaign_provider.dart';
import 'package:til_hackathon/theme/app_theme.dart';
import 'package:til_hackathon/widgets/campaign_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = context.watch<CampaignProvider>().campaigns;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ANI-SABI'),
        actions: [
          // Small branding icon
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.agriculture, color: Colors.white.withValues(alpha: 0.7)),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // ── Welcome banner ─────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kForestGreen, kForestGreen.withValues(alpha: 0.85)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mabuhay, Kapwa! 🌾',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Fund a farmer. Feed a family.\nBrowse active Bungkalan campaigns below.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Section header ─────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Text(
                'Active Campaigns',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),

          // ── Campaign cards ─────────────────────────────
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final campaign = campaigns[index];
                return CampaignCard(
                  campaign: campaign,
                  onTap: () {
                    // Navigate to Solidarity Basket screen for this campaign.
                    context.push('/basket/${campaign.id}');
                  },
                );
              },
              childCount: campaigns.length,
            ),
          ),

          // Bottom padding so content doesn't hide behind nav bar.
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}
