/// ============================================================
/// ANI-SABI — HarvestLog (Mag-Ulat) Model
/// ============================================================
/// Represents a single entry in the farmer cooperative's
/// harvest / activity timeline ("Mag-Ulat"). Displayed on
/// the Farmer Impact Screen for consumers to see real activity.
/// ============================================================

enum LogType {
  harvest,
  planting,
  advisory,
  alert,
  delivery,
}

class HarvestLog {
  final String id;

  /// Short title (e.g., "Harvested 120kg Eggplant").
  final String title;

  /// Longer description of the activity.
  final String description;

  /// Category tag.
  final LogType type;

  /// When this activity happened.
  final DateTime date;

  /// Optional crop name.
  final String? crop;

  /// Optional quantity in kilograms.
  final double? quantityKg;

  HarvestLog({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.date,
    this.crop,
    this.quantityKg,
  });
}
