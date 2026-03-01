/// ============================================================
/// ANI-SABI — USSD Log Provider
/// ============================================================
/// Manages the simulated USSD event log feed. The demo
/// dashboard can push new mock events in real time so judges
/// see the farmer-side interaction come alive.
/// ============================================================

import 'package:flutter/foundation.dart';
import 'package:til_hackathon/models/models.dart';

class UssdLogProvider extends ChangeNotifier {
  /// Live feed of USSD events (newest first).
  final List<USSDLog> _logs = List.from(mockUssdLogs);

  List<USSDLog> get logs => List.unmodifiable(_logs);

  /// Push a new simulated event to the top of the feed.
  void addLog(USSDLog log) {
    _logs.insert(0, log);
    notifyListeners();
  }

  /// Clear all logs (useful for resetting the demo).
  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }

  /// Generate a quick mock "Harvest Logged" event.
  void simulateHarvestLog({
    required String farmerName,
    required String municipality,
    required String crop,
    required double kg,
  }) {
    addLog(USSDLog(
      id: 'ussd-${DateTime.now().millisecondsSinceEpoch}',
      farmerName: farmerName,
      municipality: municipality,
      ussdCode: '*710#',
      menuPath: 'Menu 1',
      description: 'Harvest Logged — ${kg.toStringAsFixed(0)}kg $crop',
      eventType: USSDEventType.harvestLog,
      timestamp: DateTime.now(),
    ));
  }

  /// Generate a "RED ALERT" event.
  void simulateRedAlert({
    required String farmerName,
    required String municipality,
    required String alertDescription,
  }) {
    addLog(USSDLog(
      id: 'ussd-${DateTime.now().millisecondsSinceEpoch}',
      farmerName: farmerName,
      municipality: municipality,
      ussdCode: '*710#',
      menuPath: 'Menu 4',
      description: 'TANGGOL-SAKA RED ALERT — $alertDescription',
      eventType: USSDEventType.redAlert,
      timestamp: DateTime.now(),
    ));
  }
}
