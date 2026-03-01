/// ============================================================
/// ANI-SABI — FarmCampaign Model
/// ============================================================
/// Represents a "Bungkalan" (collective farm) campaign.
/// Each campaign has a pre-paid capital goal that consumers
/// can fund via Solidarity Baskets. This is the core unit
/// of the mutual-aid farming model.
/// ============================================================

class FarmCampaign {
  final String id;

  /// Name of the collective farming campaign (e.g., "Bungkalan ng Tarlac").
  final String name;

  /// Name of the partnered cooperative or farmer group.
  final String cooperativeName;

  /// Location / municipality.
  final String municipality;

  /// Province where the farm is located.
  final String province;

  /// Short description of the campaign.
  final String description;

  /// The total pre-paid capital target (in PHP).
  final double capitalGoal;

  /// How much has been raised so far (in PHP).
  final double capitalRaised;

  /// Number of consumer subscribers backing this campaign.
  final int backers;

  /// URL or asset path for the campaign hero image.
  final String imageUrl;

  /// The primary crops being grown.
  final List<String> crops;

  /// Campaign start date.
  final DateTime startDate;

  /// Expected harvest date.
  final DateTime expectedHarvest;

  FarmCampaign({
    required this.id,
    required this.name,
    required this.cooperativeName,
    required this.municipality,
    required this.province,
    required this.description,
    required this.capitalGoal,
    required this.capitalRaised,
    required this.backers,
    required this.imageUrl,
    required this.crops,
    required this.startDate,
    required this.expectedHarvest,
  });

  /// Progress percentage (0.0 – 1.0) for the funding bar.
  double get fundingProgress =>
      (capitalGoal > 0) ? (capitalRaised / capitalGoal).clamp(0.0, 1.0) : 0.0;

  /// Days remaining until expected harvest.
  int get daysUntilHarvest =>
      expectedHarvest.difference(DateTime.now()).inDays.clamp(0, 9999);
}
