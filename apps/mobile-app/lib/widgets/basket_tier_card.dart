/// ============================================================
/// ANI-SABI — Basket Tier Card Widget
/// ============================================================
/// Displays a single Solidarity Basket subscription tier with
/// price, description, typical items, and the radical-
/// transparency cost-breakdown bars.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:til_hackathon/models/solidarity_basket.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class BasketTierCard extends StatelessWidget {
  final SolidarityBasket basket;
  final bool isSelected;
  final VoidCallback? onTap;

  const BasketTierCard({
    super.key,
    required this.basket,
    this.isSelected = false,
    this.onTap,
  });

  /// Map icon name strings to actual Material Icons.
  IconData _resolveIcon(String name) {
    switch (name) {
      case 'eco':
        return Icons.eco;
      case 'local_florist':
        return Icons.local_florist;
      case 'volunteer_activism':
        return Icons.volunteer_activism;
      default:
        return Icons.shopping_basket;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = isSelected ? kForestGreen : Colors.transparent;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header row: icon + name + price ─────────────
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: kSageGreen.withValues(alpha: 0.2),
                    child: Icon(
                      _resolveIcon(basket.iconName),
                      color: kForestGreen,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(basket.tierName,
                            style: theme.textTheme.headlineMedium),
                        Text(basket.tagline,
                            style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₱${basket.pricePerMonth.toStringAsFixed(0)}',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: kForestGreen,
                        ),
                      ),
                      Text('/month', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // ── Estimated kg + items ────────────────────────
              Text(
                '~${basket.estimatedKg.toStringAsFixed(0)} kg fresh vegetables',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                children: basket.typicalItems.map((item) {
                  return Chip(
                    label: Text(item, style: const TextStyle(fontSize: 11)),
                    backgroundColor: kAmber.withValues(alpha: 0.15),
                    side: BorderSide.none,
                    padding: EdgeInsets.zero,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 8),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // ── Radical-transparency breakdown ──────────────
              Text('Where your money goes:',
                  style: theme.textTheme.labelLarge),
              const SizedBox(height: 8),
              ...basket.breakdown.map((b) => _BreakdownRow(entry: b)),
            ],
          ),
        ),
      ),
    );
  }
}

/// A single row in the cost-breakdown section.
class _BreakdownRow extends StatelessWidget {
  final BasketBreakdown entry;
  const _BreakdownRow({required this.entry});

  @override
  Widget build(BuildContext context) {
    // Pick colour based on label to give visual variety.
    Color barColor;
    if (entry.label.contains('Farmer')) {
      barColor = kForestGreen;
    } else if (entry.label.contains('Seeds')) {
      barColor = kSageGreen;
    } else if (entry.label.contains('Fertilizer')) {
      barColor = kSoilBrown;
    } else if (entry.label.contains('Transport')) {
      barColor = kAmber;
    } else {
      barColor = Colors.blueGrey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              entry.label,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: entry.percentage / 100,
                backgroundColor: Colors.grey.shade200,
                color: barColor,
                minHeight: 10,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '₱${entry.amount.toStringAsFixed(0)} (${entry.percentage.toStringAsFixed(0)}%)',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
