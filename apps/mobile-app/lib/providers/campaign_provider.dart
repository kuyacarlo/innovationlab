/// ============================================================
/// ANI-SABI — Campaign Provider
/// ============================================================
/// Exposes the list of Bungkalan (farm campaigns) to the
/// widget tree via Provider. For the MVP, data is sourced
/// from mock_data.dart. In production, this would hit a
/// Firestore collection or REST API.
/// ============================================================

import 'package:flutter/foundation.dart';
import 'package:til_hackathon/models/models.dart';

class CampaignProvider extends ChangeNotifier {
  /// All available farm campaigns.
  final List<FarmCampaign> _campaigns = List.from(mockCampaigns);

  List<FarmCampaign> get campaigns => List.unmodifiable(_campaigns);

  /// Look up a single campaign by its ID.
  FarmCampaign? getCampaignById(String id) {
    try {
      return _campaigns.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Simulate a consumer backing a campaign (adds PHP amount).
  void contribute(String campaignId, double amount) {
    final index = _campaigns.indexWhere((c) => c.id == campaignId);
    if (index == -1) return;

    final old = _campaigns[index];
    _campaigns[index] = FarmCampaign(
      id: old.id,
      name: old.name,
      cooperativeName: old.cooperativeName,
      municipality: old.municipality,
      province: old.province,
      description: old.description,
      capitalGoal: old.capitalGoal,
      capitalRaised: (old.capitalRaised + amount).clamp(0, old.capitalGoal),
      backers: old.backers + 1,
      imageUrl: old.imageUrl,
      crops: old.crops,
      startDate: old.startDate,
      expectedHarvest: old.expectedHarvest,
    );
    notifyListeners();
  }
}
