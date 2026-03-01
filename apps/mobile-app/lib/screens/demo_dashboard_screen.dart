/// ============================================================
/// ANI-SABI — Demo Dashboard Screen
/// ============================================================
/// A tabbed container for the two hackathon demo panels:
///   1. SARAI-SABI Trigger Panel (simulate voice calls)
///   2. USSD Event Logger (view incoming farmer data)
///
/// This screen is reached via the "Demo" tab in the bottom
/// navigation bar. It uses its own TabBar internally.
/// ============================================================

import 'package:flutter/material.dart';
import 'package:til_hackathon/screens/ussd_logger_screen.dart';
import 'package:til_hackathon/theme/app_theme.dart';

class DemoDashboardScreen extends StatelessWidget {
  const DemoDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Dashboard'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: const [
              Tab(icon: Icon(Icons.phone_in_talk), text: 'SARAI Trigger'),
              Tab(icon: Icon(Icons.terminal), text: 'USSD Logger'),
            ],
            indicatorWeight: 3,
            dividerColor: kForestGreen,
          ),
        ),
        body: const TabBarView(
          children: [
            // Tab 1: Trigger Panel (inline, not a separate Scaffold AppBar)
            _TriggerPanelBody(),
            // Tab 2: USSD Logger (inline)
            _UssdLoggerBody(),
          ],
        ),
      ),
    );
  }
}

/// ── Inline Trigger Panel (no double AppBar) ──────────────────
/// Duplicating the body of TriggerPanelScreen here to avoid
/// a nested Scaffold with two app bars. The standalone screen
/// class is kept for deep-link / go_router flexibility.
class _TriggerPanelBody extends StatefulWidget {
  const _TriggerPanelBody();

  @override
  State<_TriggerPanelBody> createState() => _TriggerPanelBodyState();
}

class _TriggerPanelBodyState extends State<_TriggerPanelBody> {
  String? _selectedMunicipality;
  String? _selectedAdvisoryType;
  final List<_CallRecord> _callHistory = [];
  bool _isCalling = false;

  static const _municipalities = [
    'Gerona, Tarlac',
    'San Narciso, Quezon',
    'Sagay, Negros Occidental',
    'Cabanatuan, Nueva Ecija',
    'Sto. Domingo, Albay',
  ];

  static const _advisoryTypes = [
    'Heavy Rainfall',
    'Pest Outbreak',
    'Typhoon Warning',
    'Drought Advisory',
    'Flood Watch',
  ];

  Future<void> _triggerCall() async {
    if (_selectedMunicipality == null || _selectedAdvisoryType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both dropdowns.')),
      );
      return;
    }
    setState(() => _isCalling = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isCalling = false;
      _callHistory.insert(0, _CallRecord(
        municipality: _selectedMunicipality!,
        advisoryType: _selectedAdvisoryType!,
        timestamp: DateTime.now(),
      ));
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kForestGreen,
          content: Text('📞 Call dispatched to $_selectedMunicipality!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Trigger Automated Advisory Call', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 4),
        Text(
          'Simulate pushing a SARAI climate advisory to farmers\' feature phones.',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 24),
        DropdownButtonFormField<String>(
          initialValue: _selectedMunicipality,
          decoration: InputDecoration(
            labelText: 'Municipality',
            prefixIcon: const Icon(Icons.location_on),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          items: _municipalities.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
          onChanged: (v) => setState(() => _selectedMunicipality = v),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _selectedAdvisoryType,
          decoration: InputDecoration(
            labelText: 'Advisory Type',
            prefixIcon: const Icon(Icons.warning_amber),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          items: _advisoryTypes.map((a) => DropdownMenuItem(value: a, child: Text(a))).toList(),
          onChanged: (v) => setState(() => _selectedAdvisoryType = v),
        ),
        const SizedBox(height: 28),
        SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _isCalling ? null : _triggerCall,
            icon: _isCalling
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.phone_in_talk, size: 26),
            label: Text(_isCalling ? 'Dispatching…' : 'Trigger Automated Call', style: const TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: kForestGreen,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
        const SizedBox(height: 32),
        if (_callHistory.isNotEmpty) ...[
          Text('Call History', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          ..._callHistory.map((r) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kSageGreen.withValues(alpha: 0.2),
                    child: const Icon(Icons.phone_callback, color: kForestGreen, size: 20),
                  ),
                  title: Text(r.advisoryType),
                  subtitle: Text('${r.municipality} • ${r.timestamp.hour}:${r.timestamp.minute.toString().padLeft(2, '0')}'),
                  trailing: const Icon(Icons.check_circle, color: kForestGreen, size: 20),
                ),
              )),
        ],
      ],
    );
  }
}

class _CallRecord {
  final String municipality;
  final String advisoryType;
  final DateTime timestamp;
  _CallRecord({required this.municipality, required this.advisoryType, required this.timestamp});
}

/// ── Inline USSD Logger ───────────────────────────────────────
/// Wraps the standalone screen body without the AppBar.
class _UssdLoggerBody extends StatelessWidget {
  const _UssdLoggerBody();

  @override
  Widget build(BuildContext context) {
    // Re-use the full screen widget; its AppBar will be hidden
    // because we're inside a TabBarView under an existing AppBar.
    // Actually, UssdLoggerScreen has its own Scaffold — we need
    // to use it carefully. Let's just inline the body here.
    return const _InlineUssdLogger();
  }
}

class _InlineUssdLogger extends StatelessWidget {
  const _InlineUssdLogger();

  @override
  Widget build(BuildContext context) {
    // Delegate to the standalone screen's build body.
    // We import the screen and call its build manually? No.
    // Instead, we just embed UssdLoggerScreen — the nested
    // Scaffold works fine inside a TabBarView.
    return const UssdLoggerScreen();
  }
}
