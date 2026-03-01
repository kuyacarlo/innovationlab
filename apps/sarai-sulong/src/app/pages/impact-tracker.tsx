import { Card } from '../components/ui/card';
import { Users, TrendingUp, Leaf, Heart } from 'lucide-react';
import { AreaChart, Area, BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

// Mock data for charts
const monthlyImpactData = [
  { month: 'Sep', farmers: 12, revenue: 8500 },
  { month: 'Oct', farmers: 15, revenue: 12300 },
  { month: 'Nov', farmers: 18, revenue: 15800 },
  { month: 'Dec', farmers: 22, revenue: 19400 },
  { month: 'Jan', farmers: 28, revenue: 24600 },
  { month: 'Feb', farmers: 32, revenue: 28900 },
];

const co2Data = [
  { month: 'Sep', saved: 45 },
  { month: 'Oct', saved: 62 },
  { month: 'Nov', saved: 78 },
  { month: 'Dec', saved: 95 },
  { month: 'Jan', saved: 118 },
  { month: 'Feb', saved: 142 },
];

const impactStats = [
  {
    icon: Users,
    label: 'Nasuportahang Magsasaka',
    value: '32',
    change: '+8 ngayong buwan',
    color: 'text-blue-600',
    bgColor: 'bg-blue-100',
  },
  {
    icon: TrendingUp,
    label: 'Kabuuang Kita ng mga Magsasaka',
    value: '₱108,500',
    change: '+24% mula noong nakaraang buwan',
    color: 'text-green-600',
    bgColor: 'bg-green-100',
  },
  {
    icon: Leaf,
    label: 'CO₂ na Naipon',
    value: '540 kg',
    change: 'laban sa traditional supply chain',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-100',
  },
  {
    icon: Heart,
    label: 'Iskor ng Epekto sa Komunidad',
    value: '94/100',
    change: 'Excellent rating',
    color: 'text-pink-600',
    bgColor: 'bg-pink-100',
  },
];

export function ImpactTrackerPage() {
  return (
    <div className="px-4 md:px-8 py-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-2 tracking-tight">Epektong Tracker</h1>
          <p className="text-gray-600 text-base md:text-lg">Tingnan kung paano nakakatulong ang iyong subscriptions sa mga lokal na magsasaka at sa kapaligiran</p>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-6 md:mb-8">
          {impactStats.map((stat) => {
            const Icon = stat.icon;
            return (
              <Card key={stat.label} className="p-5 md:p-6 rounded-xl border-0 shadow-lg hover:shadow-xl transition-shadow">
                <div className={`${stat.bgColor} ${stat.color} w-12 h-12 rounded-lg flex items-center justify-center mb-4`}>
                  <Icon className="w-6 h-6" />
                </div>
                <h3 className="text-sm font-medium text-gray-600 mb-2">{stat.label}</h3>
                <p className="text-2xl md:text-3xl font-bold text-gray-900 mb-1">{stat.value}</p>
                <p className="text-xs md:text-sm text-gray-500">{stat.change}</p>
              </Card>
            );
          })}
        </div>

        {/* Charts Section */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 md:gap-8 mb-6 md:mb-8">
          {/* Farmers & Revenue Chart */}
          <Card className="p-4 md:p-6 rounded-xl border-0 shadow-lg">
            <h3 className="text-lg md:text-xl font-semibold text-gray-900 mb-4 md:mb-6">Dami ng Nasuportahang Magsasaka</h3>
            <ResponsiveContainer width="100%" height={250}>
              <AreaChart data={monthlyImpactData}>
                <defs>
                  <linearGradient id="colorFarmers" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#1a3d2e" stopOpacity={0.3} />
                    <stop offset="95%" stopColor="#1a3d2e" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="month" stroke="#6b7280" style={{ fontSize: '12px' }} />
                <YAxis stroke="#6b7280" style={{ fontSize: '12px' }} />
                <Tooltip
                  contentStyle={{
                    backgroundColor: 'white',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                    fontSize: '14px'
                  }}
                />
                <Area
                  type="monotone"
                  dataKey="farmers"
                  stroke="#1a3d2e"
                  strokeWidth={2}
                  fillOpacity={1}
                  fill="url(#colorFarmers)"
                />
              </AreaChart>
            </ResponsiveContainer>
          </Card>

          {/* CO2 Savings Chart */}
          <Card className="p-4 md:p-6 rounded-xl border-0 shadow-lg">
            <h3 className="text-lg md:text-xl font-semibold text-gray-900 mb-4 md:mb-6">CO₂ Emissions Saved (kg)</h3>
            <ResponsiveContainer width="100%" height={250}>
              <BarChart data={co2Data}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="month" stroke="#6b7280" style={{ fontSize: '12px' }} />
                <YAxis stroke="#6b7280" style={{ fontSize: '12px' }} />
                <Tooltip
                  contentStyle={{
                    backgroundColor: 'white',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                    fontSize: '14px'
                  }}
                />
                <Bar dataKey="saved" fill="#10b981" radius={[8, 8, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </Card>
        </div>

        {/* Community Stories */}
        <Card className="p-6 md:p-8 rounded-xl border-0 shadow-lg">
          <h3 className="text-xl md:text-2xl font-semibold text-gray-900 mb-4 md:mb-6">Mga Kuwento ng mga Magsasaka</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6">
            {/* Story 1 */}
            <div className="flex gap-3 md:gap-4">
              <div className="w-12 h-12 md:w-16 md:h-16 rounded-full bg-gradient-to-br from-[#1a3d2e] to-[#0f2419] flex items-center justify-center text-white font-bold text-lg md:text-xl flex-shrink-0">
                MR
              </div>
              <div>
                <h4 className="font-semibold text-gray-900 mb-1 text-sm md:text-base">Mang Rodrigo, Benguet</h4>
                <p className="text-xs md:text-sm text-gray-600 leading-relaxed">
                  "Sulong helped me sell my sitaw directly to consumers in Manila. I now earn 40% more than selling to middlemen. My family can afford better education for my children."
                </p>
              </div>
            </div>

            {/* Story 2 */}
            <div className="flex gap-3 md:gap-4">
              <div className="w-12 h-12 md:w-16 md:h-16 rounded-full bg-gradient-to-br from-[#1a3d2e] to-[#0f2419] flex items-center justify-center text-white font-bold text-lg md:text-xl flex-shrink-0">
                AL
              </div>
              <div>
                <h4 className="font-semibold text-gray-900 mb-1 text-sm md:text-base">Aling Lorna, Batangas</h4>
                <p className="text-xs md:text-sm text-gray-600 leading-relaxed">
                  "My tomato harvest used to go to waste because I couldn't reach buyers on time. Now with Sulong's weekly subscriptions, I have guaranteed income and less food waste."
                </p>
              </div>
            </div>
          </div>
        </Card>
      </div>
    </div>
  );
}