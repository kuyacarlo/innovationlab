import { useState } from 'react';
import { Calendar, MapPin, Package, Pause, Play, X } from 'lucide-react';
import { Card } from '../components/ui/card';
import { Button } from '../components/ui/button';
import { toast } from 'sonner';
import { useNavigate } from 'react-router';
import { ImageWithFallback } from '../components/figma/ImageWithFallback';

interface Subscription {
  id: string;
  cropName: string;
  farmLocation: string;
  pricePerKg: number;
  image: string;
  frequency: string;
  nextDelivery: string;
  status: 'active' | 'paused';
  quantityPerDelivery: number;
}

const mockSubscriptions: Subscription[] = [
  {
    id: 'sub-1',
    cropName: 'Sitaw (String Beans)',
    farmLocation: 'Benguet, Cordillera',
    pricePerKg: 85,
    image: 'https://images.unsplash.com/photo-1660255940824-b712b5b03caf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxncmVlbiUyMGJlYW5zJTIwdmVnZXRhYmxlcyUyMGZyZXNofGVufDF8fHx8MTc3MjM1OTEyOXww&ixlib=rb-4.1.0&q=80&w=1080',
    frequency: 'Weekly',
    nextDelivery: 'March 4, 2026',
    status: 'active',
    quantityPerDelivery: 2,
  },
  {
    id: 'sub-2',
    cropName: 'Kamatis (Tomatoes)',
    farmLocation: 'Batangas, Calabarzon',
    pricePerKg: 95,
    image: 'https://images.unsplash.com/photo-1683008952375-410ae668e6b9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx0b21hdG9lcyUyMGZyZXNoJTIwZmFybXxlbnwxfHx8fDE3NzIzNTkxMjl8MA&ixlib=rb-4.1.0&q=80&w=1080',
    frequency: 'Bi-weekly',
    nextDelivery: 'March 8, 2026',
    status: 'active',
    quantityPerDelivery: 3,
  },
  {
    id: 'sub-3',
    cropName: 'Lettuce',
    farmLocation: 'Baguio, Cordillera',
    pricePerKg: 110,
    image: 'https://images.unsplash.com/photo-1741515042603-70545daeb0c4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZXR0dWNlJTIwZnJlc2glMjBncmVlbnN8ZW58MXx8fHwxNzcyMzU5MTMwfDA&ixlib=rb-4.1.0&q=80&w=1080',
    frequency: 'Weekly',
    nextDelivery: 'March 5, 2026',
    status: 'paused',
    quantityPerDelivery: 1.5,
  },
];

export function SubscriptionsPage() {
  const [subscriptions, setSubscriptions] = useState<Subscription[]>(mockSubscriptions);
  const navigate = useNavigate();

  const handleToggleStatus = (id: string) => {
    const sub = subscriptions.find((s) => s.id === id);
    if (!sub) return;

    const newStatus = sub.status === 'active' ? 'paused' : 'active';

    setSubscriptions((prev) =>
      prev.map((s) =>
        s.id === id
          ? { ...s, status: newStatus }
          : s
      )
    );

    toast.success(
      newStatus === 'paused'
        ? `Subscription to ${sub.cropName} paused`
        : `Subscription to ${sub.cropName} resumed`
    );
  };

  const handleCancelSubscription = (id: string) => {
    const sub = subscriptions.find((s) => s.id === id);
    if (!sub) return;

    setSubscriptions((prev) => prev.filter((s) => s.id !== id));
    toast.success(`Subscription to ${sub.cropName} cancelled`);
  };

  return (
    <div className="px-4 md:px-8 py-8">
      <div className="max-w-5xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-2 tracking-tight">Aking Subscriptions</h1>
          <p className="text-gray-600 text-base md:text-lg">Pamahalaan ang iyong mga aktibong subscription at iskedyul ng delivery</p>
        </div>

        {/* Subscriptions List */}
        {subscriptions.length > 0 ? (
          <div className="space-y-6">
            {subscriptions.map((subscription) => (
              <Card key={subscription.id} className="p-4 md:p-6 rounded-xl border-0 shadow-lg hover:shadow-xl transition-shadow group">
                <div className="flex flex-col md:flex-row gap-4 md:gap-6">
                  {/* Crop Image */}
                  <div className="w-full md:w-32 h-48 md:h-32 rounded-lg overflow-hidden flex-shrink-0 relative">
                    <ImageWithFallback
                      src={subscription.image}
                      alt={subscription.cropName}
                      className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                    />
                  </div>

                  {/* Subscription Details */}
                  <div className="flex-1">
                    <div className="flex flex-col md:flex-row md:items-start justify-between mb-3 gap-2">
                      <div>
                        <h3 className="text-lg md:text-xl font-semibold text-gray-900 mb-1">{subscription.cropName}</h3>
                        <div className="flex items-center gap-2 text-sm text-gray-600">
                          <MapPin className="w-4 h-4" />
                          <span>{subscription.farmLocation}</span>
                        </div>
                      </div>
                      <div className={`px-3 py-1 rounded-full text-xs font-medium self-start ${subscription.status === 'active'
                        ? 'bg-green-100 text-green-700'
                        : 'bg-gray-100 text-gray-700'
                        }`}>
                        {subscription.status === 'active' ? 'Aktibo' : 'Nakahinto'}
                      </div>
                    </div>

                    {/* Subscription Info Grid */}
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-3 md:gap-4 mb-4">
                      <div className="flex items-center gap-2">
                        <Package className="w-4 h-4 text-gray-500" />
                        <div>
                          <p className="text-xs text-gray-500">Dami</p>
                          <p className="text-sm font-medium text-gray-900">{subscription.quantityPerDelivery}kg / delivery</p>
                        </div>
                      </div>
                      <div className="flex items-center gap-2">
                        <Calendar className="w-4 h-4 text-gray-500" />
                        <div>
                          <p className="text-xs text-gray-500">Dalas</p>
                          <p className="text-sm font-medium text-gray-900">{subscription.frequency}</p>
                        </div>
                      </div>
                      <div>
                        <p className="text-xs text-gray-500">Susunod na Delivery</p>
                        <p className="text-sm font-medium text-gray-900">{subscription.nextDelivery}</p>
                      </div>
                    </div>

                    {/* Price */}
                    <div className="mb-4">
                      <span className="text-xl md:text-2xl font-bold text-[#1a3d2e]">₱{subscription.pricePerKg * subscription.quantityPerDelivery}</span>
                      <span className="text-sm text-gray-500 ml-1">per delivery</span>
                    </div>

                    {/* Actions */}
                    <div className="flex flex-col sm:flex-row gap-3">
                      <Button
                        onClick={() => handleToggleStatus(subscription.id)}
                        variant="outline"
                        className="flex items-center justify-center gap-2"
                      >
                        {subscription.status === 'active' ? (
                          <>
                            <Pause className="w-4 h-4" />
                            I-hinto
                          </>
                        ) : (
                          <>
                            <Play className="w-4 h-4" />
                            Ituloy
                          </>
                        )}
                      </Button>
                      <Button
                        onClick={() => handleCancelSubscription(subscription.id)}
                        variant="outline"
                        className="flex items-center justify-center gap-2 text-red-600 hover:text-red-700 hover:bg-red-50"
                      >
                        <X className="w-4 h-4" />
                        Kanselahin
                      </Button>
                    </div>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        ) : (
          <Card className="p-8 md:p-12 text-center rounded-xl border-0 shadow-lg">
            <Package className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">Walang Aktibong Subscriptions</h3>
            <p className="text-gray-600 mb-6">Magsimulang mag-subscribe sa mga sariwang tanim mula sa mga lokal na magsasaka</p>
            <Button
              onClick={() => navigate('/')}
              className="text-white font-medium rounded-xl shadow-md transition-transform hover:scale-105"
              style={{
                background: 'linear-gradient(135deg, #fb923c 0%, #f97316 100%)',
              }}
            >
              Tingnan ang Marketplace
            </Button>
          </Card>
        )}
      </div>
    </div>
  );
}