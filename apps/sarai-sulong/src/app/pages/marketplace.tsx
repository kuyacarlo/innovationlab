import { useState } from 'react';
import { Header } from '../components/header';
import { CropCard, CropData } from '../components/crop-card';
import { DeliveryWidget } from '../components/delivery-widget';
import { toast } from 'sonner';
import { mockCrops } from '../lib/mock-data';

export function MarketplacePage() {
  const [searchQuery, setSearchQuery] = useState('');

  const handleSubscribe = (crop: CropData) => {
    toast.success(`Subscribed to ${crop.name}!`, {
      description: `You'll receive fresh ${crop.name} from ${crop.farmLocation} regularly.`,
    });
  };

  const filteredCrops = mockCrops.filter((crop) =>
    crop.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <>
      <Header searchQuery={searchQuery} onSearchChange={setSearchQuery} />

      <div className="flex flex-col lg:flex-row gap-8 px-4 md:px-8 py-8 max-w-[1600px] mx-auto">
        {/* Main Content Area */}
        <div className="flex-1">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredCrops.map((crop) => (
              <CropCard
                key={crop.id}
                crop={crop}
                onSubscribe={handleSubscribe}
              />
            ))}
          </div>
          {filteredCrops.length === 0 && (
            <div className="text-center py-16">
              <div className="bg-white rounded-xl shadow-lg p-8 max-w-md mx-auto">
                <p className="text-gray-500 text-lg">
                  Walang nakitang tanim na tumutugma sa <span className="font-semibold text-gray-900">"{searchQuery}"</span>
                </p>
                <p className="text-gray-400 text-sm mt-2">Subukan ang ibang salita.</p>
              </div>
            </div>
          )}
        </div>

        {/* Delivery Widget Sidebar */}
        <div className="w-full lg:w-80 flex-shrink-0">
          <DeliveryWidget />
        </div>
      </div>
    </>
  );
}