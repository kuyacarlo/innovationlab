/// ============================================================
/// ANI-SABI — Campaign Card Widget
/// ============================================================
/// A Material 3 card displaying a single Bungkalan campaign.
/// Shows the campaign name, cooperative, crop tags, funding
/// progress bar, and backer count. Tappable to navigate to
/// the campaign detail / Solidarity Basket screen.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:til_hackathon/models/farm_campaign.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class CampaignCard extends StatelessWidget {
  final FarmCampaign campaign;
  final VoidCallback? onTap;

  const CampaignCard({
    super.key,
    required this.campaign,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero image placeholder ──────────────────────
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kForestGreen, kSageGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  // Decorative farm icon
                  Positioned(
                    right: 16,
                    bottom: 12,
                    child: Icon(
                      Icons.agriculture,
                      size: 64,
                      color: Colors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  // Campaign name overlay
                  Positioned(
                    left: 16,
                    bottom: 12,
                    right: 80,
                    child: Text(
                      campaign.name,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(blurRadius: 8, color: Colors.black38),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Cooperative name ────────────────────────
                  Row(
                    children: [
                      const Icon(Icons.groups, size: 18, color: kSoilBrown),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          campaign.cooperativeName,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: kSoilBrown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // ── Location ────────────────────────────────
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        '${campaign.municipality}, ${campaign.province}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ── Crop tags ───────────────────────────────
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: campaign.crops.map((crop) {
                      return Chip(
                        label: Text(crop, style: const TextStyle(fontSize: 11)),
                        backgroundColor: kSageGreen.withValues(alpha: 0.15),
                        side: BorderSide.none,
                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // ── Funding progress bar ────────────────────
                  LinearPercentIndicator(
                    lineHeight: 14,
                    percent: campaign.fundingProgress,
                    backgroundColor: Colors.grey.shade200,
                    progressColor: kForestGreen,
                    barRadius: const Radius.circular(7),
                    padding: EdgeInsets.zero,
                    center: Text(
                      '${(campaign.fundingProgress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ── Funding detail row ──────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₱${_formatNumber(campaign.capitalRaised)} / ₱${_formatNumber(campaign.capitalGoal)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people, size: 14, color: kSoilBrown),
                          const SizedBox(width: 4),
                          Text(
                            '${campaign.backers} backers',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Format large numbers with comma separators.
  String _formatNumber(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
    }
    return value.toStringAsFixed(0);
  }
}
