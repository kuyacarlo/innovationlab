/// ============================================================
/// ANI-SABI — Farmer Impact Screen
/// ============================================================
/// Profile view of the partnered cooperative. Shows:
///   • Cooperative stats (members, hectares, crops).
///   • A vertical timeline of "Mag-Ulat" (harvest/activity
///     logs) so consumers can see exactly what the farmers
///     are doing with their money.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:til_hackathon/models/models.dart';
import 'package:til_hackathon/theme/app_theme.dart';
import 'package:til_hackathon/widgets/timeline_tile.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // For the MVP, we hard-reference the first campaign's cooperative.
    final coop = mockCampaigns.first;
    final logs = mockHarvestLogs;

    return Scaffold(
      appBar: AppBar(title: const Text('Farmer Impact')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // ── Cooperative profile card ────────────────────
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: kForestGreen.withValues(alpha: 0.15),
                        child: const Icon(Icons.groups, size: 30, color: kForestGreen),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coop.cooperativeName,
                              style: theme.textTheme.headlineMedium,
                            ),
                            Text(
                              '${coop.municipality}, ${coop.province}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(coop.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 16),

                  // ── Quick stats row ─────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatChip(
                        icon: Icons.people,
                        label: '${coop.backers}',
                        subtitle: 'Backers',
                      ),
                      _StatChip(
                        icon: Icons.terrain,
                        label: '2 ha',
                        subtitle: 'Farm Size',
                      ),
                      _StatChip(
                        icon: Icons.eco,
                        label: '${coop.crops.length}',
                        subtitle: 'Crops',
                      ),
                      _StatChip(
                        icon: Icons.calendar_today,
                        label: '${coop.daysUntilHarvest}d',
                        subtitle: 'To Harvest',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── Mag-Ulat timeline header ────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Mag-Ulat — Activity Timeline',
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 12),

          // ── Timeline entries ────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(logs.length, (i) {
                return TimelineTile(
                  log: logs[i],
                  isLast: i == logs.length - 1,
                );
              }),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Small stat chip used in the cooperative profile.
class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kForestGreen, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: kForestGreen,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
