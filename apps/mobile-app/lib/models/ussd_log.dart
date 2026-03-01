/// ============================================================
/// ANI-SABI — USSDLog Model
/// ============================================================
/// Represents a simulated USSD event from a farmer's feature
/// phone. In production, this would be received from the
/// telco gateway. For the hackathon demo, we generate mock
/// events to demonstrate the farmer-side interaction.
/// ============================================================

enum USSDEventType {
  /// Farmer logging a harvest amount.
  harvestLog,

  /// Farmer reporting a pest or disease sighting.
  pestAlert,

  /// Farmer requesting weather advisory playback.
  weatherRequest,

  /// Emergency solidarity alert (TANGGOL-SAKA).
  redAlert,

  /// Farmer confirming receipt of inputs / seeds.
  inputConfirm,
}

class USSDLog {
  final String id;

  /// Farmer name or phone alias.
  final String farmerName;

  /// Municipality of the farmer.
  final String municipality;

  /// The USSD short-code used (e.g., *710#).
  final String ussdCode;

  /// Menu selection path (e.g., "Menu 1 > Sub 2").
  final String menuPath;

  /// Human-readable description of what the farmer did.
  final String description;

  /// Category of this event.
  final USSDEventType eventType;

  /// Timestamp of the event.
  final DateTime timestamp;

  USSDLog({
    required this.id,
    required this.farmerName,
    required this.municipality,
    required this.ussdCode,
    required this.menuPath,
    required this.description,
    required this.eventType,
    required this.timestamp,
  });

  /// Returns a compact one-line representation for the live feed.
  String get feedLine =>
      '$ussdCode $menuPath: $description';
}
