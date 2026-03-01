/// ============================================================
/// ANI-SABI — Solidarity Basket Screen
/// ============================================================
/// Subscription page where urban consumers select a monthly
/// vegetable basket tier. Shows radical-transparency cost
/// breakdown for each tier. Linked to a specific Bungkalan
/// campaign via route parameter.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:til_hackathon/models/models.dart';
import 'package:til_hackathon/providers/campaign_provider.dart';
import 'package:til_hackathon/theme/app_theme.dart';
import 'package:til_hackathon/widgets/basket_tier_card.dart';

class BasketScreen extends StatefulWidget {
  /// Campaign ID passed via route parameter.
  final String campaignId;

  const BasketScreen({super.key, required this.campaignId});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  /// Index of the currently selected basket tier.
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final campaign =
        context.watch<CampaignProvider>().getCampaignById(widget.campaignId);

    return Scaffold(
      appBar: AppBar(title: const Text('Solidarity Baskets')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // ── Campaign context header ─────────────────────
          if (campaign != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscribe for ${campaign.name}',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Choose a monthly basket. Every peso is accounted for.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),

          // ── Basket tier cards ───────────────────────────
          ...List.generate(mockBaskets.length, (index) {
            final basket = mockBaskets[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: BasketTierCard(
                basket: basket,
                isSelected: _selectedIndex == index,
                onTap: () => setState(() => _selectedIndex = index),
              ),
            );
          }),

          const SizedBox(height: 20),

          // ── Subscribe CTA ───────────────────────────────
          if (_selectedIndex >= 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Simulate backing the campaign with the selected tier price.
                  if (campaign != null) {
                    context.read<CampaignProvider>().contribute(
                          campaign.id,
                          mockBaskets[_selectedIndex].pricePerMonth,
                        );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kForestGreen,
                      content: Text(
                        'Salamat! You subscribed to the '
                        '${mockBaskets[_selectedIndex].tierName} basket. 🌱',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.volunteer_activism),
                label: Text(
                  'Subscribe — ₱${mockBaskets[_selectedIndex].pricePerMonth.toStringAsFixed(0)}/mo',
                ),
              ),
            ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
