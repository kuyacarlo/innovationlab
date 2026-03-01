/// ============================================================
/// ANI-SABI — Timeline Tile Widget
/// ============================================================
/// Renders a single entry in the Mag-Ulat (harvest/activity)
/// timeline on the Farmer Impact Screen.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:til_hackathon/models/harvest_log.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class TimelineTile extends StatelessWidget {
  final HarvestLog log;
  final bool isLast;

  const TimelineTile({
    super.key,
    required this.log,
    this.isLast = false,
  });

  /// Resolve icon and colour for each log type.
  (IconData, Color) _iconForType(LogType type) {
    switch (type) {
      case LogType.harvest:
        return (Icons.grass, kForestGreen);
      case LogType.planting:
        return (Icons.eco, kSageGreen);
      case LogType.advisory:
        return (Icons.cloud, Colors.blueGrey);
      case LogType.alert:
        return (Icons.warning_amber_rounded, kAlertRed);
      case LogType.delivery:
        return (Icons.local_shipping, kAmber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color) = _iconForType(log.type);
    final dateStr = DateFormat('MMM d, y').format(log.date);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Left: dot + connecting line ─────────────────
          SizedBox(
            width: 40,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: color.withValues(alpha: 0.15),
                  child: Icon(icon, size: 18, color: color),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // ── Right: content ──────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateStr, style: theme.textTheme.bodySmall),
                  const SizedBox(height: 2),
                  Text(log.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(log.description, style: theme.textTheme.bodyMedium),
                  if (log.quantityKg != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.scale, size: 14, color: kSoilBrown),
                        const SizedBox(width: 4),
                        Text(
                          '${log.quantityKg!.toStringAsFixed(0)} kg ${log.crop ?? ''}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
