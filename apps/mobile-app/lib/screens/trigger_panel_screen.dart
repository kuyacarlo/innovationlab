/// ============================================================
/// ANI-SABI — SARAI-SABI Trigger Panel
/// ============================================================
/// Hackathon demo screen that lets judges simulate pushing
/// a SARAI weather/pest advisory to a farmer's feature phone
/// via automated voice call.
///
/// Contains:
///   • Municipality dropdown
///   • Advisory type dropdown (Rainfall, Pest, Typhoon, etc.)
///   • A big "Trigger Automated Call" button
///   • A status card showing the last triggered call
/// ============================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class TriggerPanelScreen extends StatefulWidget {
  const TriggerPanelScreen({super.key});

  @override
  State<TriggerPanelScreen> createState() => _TriggerPanelScreenState();
}

class _TriggerPanelScreenState extends State<TriggerPanelScreen> {
  // ── Dropdown values ─────────────────────────────────────
  String? _selectedMunicipality;
  String? _selectedAdvisoryType;

  // ── Mock municipalities ─────────────────────────────────
  static const _municipalities = [
    'Gerona, Tarlac',
    'San Narciso, Quezon',
    'Sagay, Negros Occidental',
    'Cabanatuan, Nueva Ecija',
    'Sto. Domingo, Albay',
  ];

  // ── Advisory types ──────────────────────────────────────
  static const _advisoryTypes = [
    'Heavy Rainfall',
    'Pest Outbreak',
    'Typhoon Warning',
    'Drought Advisory',
    'Flood Watch',
  ];

  // ── Call history ────────────────────────────────────────
  final List<_CallRecord> _callHistory = [];
  bool _isCalling = false;

  /// Simulates triggering an automated voice call.
  Future<void> _triggerCall() async {
    if (_selectedMunicipality == null || _selectedAdvisoryType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select municipality and advisory type.')),
      );
      return;
    }

    setState(() => _isCalling = true);

    // Simulate a network delay (demo effect).
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isCalling = false;
      _callHistory.insert(
        0,
        _CallRecord(
          municipality: _selectedMunicipality!,
          advisoryType: _selectedAdvisoryType!,
          timestamp: DateTime.now(),
        ),
      );
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kForestGreen,
          content: Text(
            '📞 Voice call dispatched to $_selectedMunicipality!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('SARAI-SABI Panel')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ── Header ──────────────────────────────────────
          Text(
            'Trigger Automated Advisory Call',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Simulate pushing a SARAI climate advisory to '
            'farmers\' feature phones via IVR.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),

          // ── Municipality dropdown ───────────────────────
          DropdownButtonFormField<String>(
            initialValue: _selectedMunicipality,
            decoration: InputDecoration(
              labelText: 'Municipality',
              prefixIcon: const Icon(Icons.location_on),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            items: _municipalities
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (v) => setState(() => _selectedMunicipality = v),
          ),
          const SizedBox(height: 16),

          // ── Advisory type dropdown ──────────────────────
          DropdownButtonFormField<String>(
            initialValue: _selectedAdvisoryType,
            decoration: InputDecoration(
              labelText: 'Advisory Type',
              prefixIcon: const Icon(Icons.warning_amber),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            items: _advisoryTypes
                .map((a) => DropdownMenuItem(value: a, child: Text(a)))
                .toList(),
            onChanged: (v) => setState(() => _selectedAdvisoryType = v),
          ),
          const SizedBox(height: 28),

          // ── Big trigger button ──────────────────────────
          SizedBox(
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _isCalling ? null : _triggerCall,
              icon: _isCalling
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.phone_in_talk, size: 26),
              label: Text(
                _isCalling ? 'Dispatching…' : 'Trigger Automated Call',
                style: const TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: kForestGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // ── Call history ────────────────────────────────
          if (_callHistory.isNotEmpty) ...[
            Text('Call History', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            ..._callHistory.map((record) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kSageGreen.withValues(alpha: 0.2),
                      child: const Icon(Icons.phone_callback,
                          color: kForestGreen, size: 20),
                    ),
                    title: Text(record.advisoryType),
                    subtitle: Text(
                      '${record.municipality} • ${DateFormat('HH:mm:ss').format(record.timestamp)}',
                    ),
                    trailing: const Icon(Icons.check_circle,
                        color: kForestGreen, size: 20),
                  ),
                )),
          ],
        ],
      ),
    );
  }
}

/// Simple record for displaying call history in the demo.
class _CallRecord {
  final String municipality;
  final String advisoryType;
  final DateTime timestamp;

  _CallRecord({
    required this.municipality,
    required this.advisoryType,
    required this.timestamp,
  });
}
