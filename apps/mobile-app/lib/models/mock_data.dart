/// ============================================================
/// ANI-SABI — Mock Data
/// ============================================================
/// Pre-populated data for the hackathon demo. These objects
/// populate every screen so the pitch deck looks alive.
/// ============================================================

import 'package:til_hackathon/models/farm_campaign.dart';
import 'package:til_hackathon/models/solidarity_basket.dart';
import 'package:til_hackathon/models/ussd_log.dart';
import 'package:til_hackathon/models/harvest_log.dart';

// ─────────────────────────────────────────────
// FARM CAMPAIGNS (Bungkalan)
// ─────────────────────────────────────────────

final List<FarmCampaign> mockCampaigns = [
  FarmCampaign(
    id: 'bk-001',
    name: 'Bungkalan ng Tarlac',
    cooperativeName: 'AMBALA Farmers Cooperative',
    municipality: 'Gerona',
    province: 'Tarlac',
    description:
        'A 2-hectare collective rice-and-vegetable farm reclaimed by '
        'landless peasants. Funding supports organic inputs and fair wages.',
    capitalGoal: 150000,
    capitalRaised: 112500,
    backers: 47,
    imageUrl: 'assets/placeholder_farm.png',
    crops: ['Rice', 'Tomato', 'Eggplant', 'Okra'],
    startDate: DateTime(2026, 1, 15),
    expectedHarvest: DateTime(2026, 4, 20),
  ),
  FarmCampaign(
    id: 'bk-002',
    name: 'Bungkalan ng Quezon',
    cooperativeName: 'Samahan ng Magsasaka sa Bondoc',
    municipality: 'San Narciso',
    province: 'Quezon',
    description:
        'Coconut and vegetable inter-cropping initiative run by women '
        'farmers. Proceeds fund a community seed bank.',
    capitalGoal: 95000,
    capitalRaised: 41800,
    backers: 22,
    imageUrl: 'assets/placeholder_farm.png',
    crops: ['Coconut', 'Sitaw', 'Kalabasa', 'Ampalaya'],
    startDate: DateTime(2026, 2, 1),
    expectedHarvest: DateTime(2026, 5, 15),
  ),
  FarmCampaign(
    id: 'bk-003',
    name: 'Bungkalan ng Negros',
    cooperativeName: 'NFSW Hacienda Luisita Alumni',
    municipality: 'Sagay',
    province: 'Negros Occidental',
    description:
        'Sugar-land converted to organic vegetable farming. Goal is to '
        'prove food sovereignty on former plantation soil.',
    capitalGoal: 200000,
    capitalRaised: 188000,
    backers: 63,
    imageUrl: 'assets/placeholder_farm.png',
    crops: ['Kamote', 'Pechay', 'Talong', 'Sili'],
    startDate: DateTime(2025, 12, 1),
    expectedHarvest: DateTime(2026, 3, 10),
  ),
];

// ─────────────────────────────────────────────
// SOLIDARITY BASKETS
// ─────────────────────────────────────────────

const List<SolidarityBasket> mockBaskets = [
  SolidarityBasket(
    id: 'basket-punla',
    tierName: 'Punla',
    tagline: 'Plant a seed of solidarity',
    pricePerMonth: 350,
    estimatedKg: 3,
    typicalItems: ['Pechay', 'Sitaw', 'Kamatis', 'Sili'],
    breakdown: [
      BasketBreakdown(label: 'Seeds & Seedlings', amount: 52.5, percentage: 15),
      BasketBreakdown(label: 'Organic Fertilizer', amount: 35.0, percentage: 10),
      BasketBreakdown(label: 'Farmer Income', amount: 175.0, percentage: 50),
      BasketBreakdown(label: 'Transport & Packaging', amount: 52.5, percentage: 15),
      BasketBreakdown(label: 'Platform & Coop Fund', amount: 35.0, percentage: 10),
    ],
    iconName: 'eco',
  ),
  SolidarityBasket(
    id: 'basket-ani',
    tierName: 'Ani',
    tagline: 'Harvest justice, deliver freshness',
    pricePerMonth: 650,
    estimatedKg: 6,
    typicalItems: ['Talong', 'Okra', 'Kalabasa', 'Ampalaya', 'Kamatis', 'Pechay'],
    breakdown: [
      BasketBreakdown(label: 'Seeds & Seedlings', amount: 97.5, percentage: 15),
      BasketBreakdown(label: 'Organic Fertilizer', amount: 65.0, percentage: 10),
      BasketBreakdown(label: 'Farmer Income', amount: 325.0, percentage: 50),
      BasketBreakdown(label: 'Transport & Packaging', amount: 97.5, percentage: 15),
      BasketBreakdown(label: 'Platform & Coop Fund', amount: 65.0, percentage: 10),
    ],
    iconName: 'local_florist',
  ),
  SolidarityBasket(
    id: 'basket-kapwa',
    tierName: 'Kapwa',
    tagline: 'Feed your neighbor, fund a farmer',
    pricePerMonth: 1100,
    estimatedKg: 10,
    typicalItems: [
      'Talong', 'Okra', 'Kalabasa', 'Ampalaya',
      'Kamatis', 'Pechay', 'Sitaw', 'Sili', 'Kamote',
    ],
    breakdown: [
      BasketBreakdown(label: 'Seeds & Seedlings', amount: 165.0, percentage: 15),
      BasketBreakdown(label: 'Organic Fertilizer', amount: 110.0, percentage: 10),
      BasketBreakdown(label: 'Farmer Income', amount: 550.0, percentage: 50),
      BasketBreakdown(label: 'Transport & Packaging', amount: 165.0, percentage: 15),
      BasketBreakdown(label: 'Platform & Coop Fund', amount: 110.0, percentage: 10),
    ],
    iconName: 'volunteer_activism',
  ),
];

// ─────────────────────────────────────────────
// USSD EVENT LOGS (mock incoming farmer data)
// ─────────────────────────────────────────────

final List<USSDLog> mockUssdLogs = [
  USSDLog(
    id: 'ussd-001',
    farmerName: 'Mang Andoy',
    municipality: 'Gerona, Tarlac',
    ussdCode: '*710#',
    menuPath: 'Menu 1',
    description: 'Harvest Logged — 50kg Tomatoes',
    eventType: USSDEventType.harvestLog,
    timestamp: DateTime(2026, 2, 26, 8, 12),
  ),
  USSDLog(
    id: 'ussd-002',
    farmerName: 'Aling Rosa',
    municipality: 'Gerona, Tarlac',
    ussdCode: '*710#',
    menuPath: 'Menu 2',
    description: 'Pest Alert — Aphids on Eggplant',
    eventType: USSDEventType.pestAlert,
    timestamp: DateTime(2026, 2, 26, 9, 34),
  ),
  USSDLog(
    id: 'ussd-003',
    farmerName: 'Ka Berto',
    municipality: 'San Narciso, Quezon',
    ussdCode: '*710#',
    menuPath: 'Menu 3',
    description: 'Weather Advisory Requested',
    eventType: USSDEventType.weatherRequest,
    timestamp: DateTime(2026, 2, 26, 10, 5),
  ),
  USSDLog(
    id: 'ussd-004',
    farmerName: 'Nanay Cita',
    municipality: 'Sagay, Negros Occidental',
    ussdCode: '*710#',
    menuPath: 'Menu 4',
    description: 'TANGGOL-SAKA RED ALERT — Flooding',
    eventType: USSDEventType.redAlert,
    timestamp: DateTime(2026, 2, 26, 11, 22),
  ),
  USSDLog(
    id: 'ussd-005',
    farmerName: 'Mang Andoy',
    municipality: 'Gerona, Tarlac',
    ussdCode: '*710#',
    menuPath: 'Menu 5',
    description: 'Input Received — 5kg Organic Fertilizer',
    eventType: USSDEventType.inputConfirm,
    timestamp: DateTime(2026, 2, 26, 13, 0),
  ),
];

// ─────────────────────────────────────────────
// HARVEST / ACTIVITY LOGS (Mag-Ulat timeline)
// ─────────────────────────────────────────────

final List<HarvestLog> mockHarvestLogs = [
  HarvestLog(
    id: 'hl-001',
    title: 'Planted 0.5 ha Tomato Seedlings',
    description: 'AMBALA cooperative started the tomato plot using organic seedlings from the community seed bank.',
    type: LogType.planting,
    date: DateTime(2026, 1, 20),
    crop: 'Tomato',
  ),
  HarvestLog(
    id: 'hl-002',
    title: 'SARAI Advisory: Heavy Rainfall Expected',
    description: 'PAGASA forecast relayed via automated voice call. Farmers advised to reinforce drainage canals.',
    type: LogType.advisory,
    date: DateTime(2026, 2, 3),
  ),
  HarvestLog(
    id: 'hl-003',
    title: 'Harvested 120kg Eggplant',
    description: 'First eggplant harvest of the season. Quality graded A by the coop inspector.',
    type: LogType.harvest,
    date: DateTime(2026, 2, 10),
    crop: 'Eggplant',
    quantityKg: 120,
  ),
  HarvestLog(
    id: 'hl-004',
    title: 'Harvested 50kg Tomatoes',
    description: 'Mid-season tomato pick. Packed and dispatched to Sulong subscribers in Metro Manila.',
    type: LogType.harvest,
    date: DateTime(2026, 2, 20),
    crop: 'Tomato',
    quantityKg: 50,
  ),
  HarvestLog(
    id: 'hl-005',
    title: 'Solidarity Basket Delivery — Batch #12',
    description: '35 baskets delivered to QC and Marikina subscribers. All produce organic-certified.',
    type: LogType.delivery,
    date: DateTime(2026, 2, 24),
  ),
  HarvestLog(
    id: 'hl-006',
    title: 'TANGGOL-SAKA Alert: Pest Outbreak',
    description: 'Aphid outbreak detected on Tarlac eggplant plots. Emergency neem oil distribution initiated.',
    type: LogType.alert,
    date: DateTime(2026, 2, 26),
    crop: 'Eggplant',
  ),
];
