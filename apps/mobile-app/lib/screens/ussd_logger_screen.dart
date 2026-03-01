/// ============================================================
/// ANI-SABI — USSD Event Logger Screen
/// ============================================================
/// A real-time feed UI that simulates incoming USSD data from
/// farmers. Judges can watch events appear and also push
/// new mock events manually.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:til_hackathon/providers/ussd_log_provider.dart';
import 'package:til_hackathon/theme/app_theme.dart';
import 'package:til_hackathon/widgets/ussd_feed_tile.dart';

class UssdLoggerScreen extends StatelessWidget {
  const UssdLoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<UssdLogProvider>();
    final logs = provider.logs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('USSD Event Logger'),
        actions: [
          // Quick-action buttons for the demo.
          IconButton(
            tooltip: 'Simulate Harvest Log',
            icon: const Icon(Icons.grass),
            onPressed: () {
              provider.simulateHarvestLog(
                farmerName: 'Ka Lito',
                municipality: 'Gerona, Tarlac',
                crop: 'Okra',
                kg: 30,
              );
            },
          ),
          IconButton(
            tooltip: 'Simulate RED ALERT',
            icon: const Icon(Icons.warning, color: Colors.amberAccent),
            onPressed: () {
              provider.simulateRedAlert(
                farmerName: 'Aling Nena',
                municipality: 'Sagay, Negros Occidental',
                alertDescription: 'Typhoon Signal #2',
              );
            },
          ),
          IconButton(
            tooltip: 'Clear logs',
            icon: const Icon(Icons.delete_outline),
            onPressed: () => provider.clearLogs(),
          ),
        ],
      ),
      body: logs.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phonelink_erase,
                      size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 12),
                  Text(
                    'No incoming USSD events yet.\nTap the toolbar icons to simulate.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Feed header ───────────────────────────
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  color: kForestGreen.withValues(alpha: 0.06),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: kAlertRed,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'LIVE — ${logs.length} events',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontFamily: 'monospace',
                          color: kForestGreen,
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Scrollable feed ───────────────────────
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: logs.length,
                    itemBuilder: (context, index) {
                      return UssdFeedTile(log: logs[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
