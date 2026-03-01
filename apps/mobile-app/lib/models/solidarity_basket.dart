/// ============================================================
/// ANI-SABI — SolidarityBasket Model
/// ============================================================
/// Represents a monthly subscription tier for the "Sulong"
/// consumer interface. Each basket shows a radical-transparency
/// breakdown: exactly how the customer's money flows to seeds,
/// fertiliser, and the farmer's livelihood.
/// ============================================================

class BasketBreakdown {
  /// Label (e.g., "Seeds", "Organic Fertilizer", "Farmer Income").
  final String label;

  /// Amount in PHP.
  final double amount;

  /// Percentage of the basket price.
  final double percentage;

  const BasketBreakdown({
    required this.label,
    required this.amount,
    required this.percentage,
  });
}

class SolidarityBasket {
  final String id;

  /// Display name for the tier (e.g., "Punla", "Ani", "Kapwa").
  final String tierName;

  /// A short tagline describing this tier.
  final String tagline;

  /// Monthly subscription price in PHP.
  final double pricePerMonth;

  /// Estimated weight of vegetables delivered (in kg).
  final double estimatedKg;

  /// Items typically included in this basket.
  final List<String> typicalItems;

  /// Radical-transparency cost breakdown.
  final List<BasketBreakdown> breakdown;

  /// Icon name from Material Icons for the tier.
  final String iconName;

  const SolidarityBasket({
    required this.id,
    required this.tierName,
    required this.tagline,
    required this.pricePerMonth,
    required this.estimatedKg,
    required this.typicalItems,
    required this.breakdown,
    required this.iconName,
  });
}
