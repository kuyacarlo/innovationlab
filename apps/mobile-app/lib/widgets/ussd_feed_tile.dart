/// ============================================================
/// ANI-SABI — USSD Feed Tile Widget
/// ============================================================
/// A single row in the real-time USSD event logger.
/// Colour-coded by event type and shows a compact feed line.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:til_hackathon/models/ussd_log.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class UssdFeedTile extends StatelessWidget {
  final USSDLog log;

  const UssdFeedTile({super.key, required this.log});

  /// Event-type badge colour.
  Color _badgeColor(USSDEventType type) {
    switch (type) {
      case USSDEventType.harvestLog:
        return kForestGreen;
      case USSDEventType.pestAlert:
        return kAmber;
      case USSDEventType.weatherRequest:
        return Colors.blueGrey;
      case USSDEventType.redAlert:
        return kAlertRed;
      case USSDEventType.inputConfirm:
        return kSageGreen;
    }
  }

  /// Short label for the badge.
  String _badgeLabel(USSDEventType type) {
    switch (type) {
      case USSDEventType.harvestLog:
        return 'HARVEST';
      case USSDEventType.pestAlert:
        return 'PEST';
      case USSDEventType.weatherRequest:
        return 'WEATHER';
      case USSDEventType.redAlert:
        return 'RED ALERT';
      case USSDEventType.inputConfirm:
        return 'INPUT';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeStr = DateFormat('HH:mm').format(log.timestamp);
    final color = _badgeColor(log.eventType);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timestamp ──────────────────────────────────
          Text(
            timeStr,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8),

          // ── Badge ──────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              _badgeLabel(log.eventType),
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // ── Feed line ──────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.feedLine,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${log.farmerName} • ${log.municipality}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
