import { MapPin, Tag } from 'lucide-react';
import { Card } from './ui/card';
import { Button } from './ui/button';
import { ImageWithFallback } from './figma/ImageWithFallback';

export interface CropData {
  id: string;
  name: string;
  farmLocation: string;
  pricePerKg: number;
  image: string;
  stock: string;
}

interface CropCardProps {
  crop: CropData;
  onSubscribe: (crop: CropData) => void;
}

export function CropCard({ crop, onSubscribe }: CropCardProps) {
  return (
    <Card className="overflow-hidden hover:shadow-2xl hover:scale-[1.02] transition-all duration-300 rounded-xl border-0 shadow-lg group">
      <div className="aspect-[4/3] overflow-hidden relative">
        <ImageWithFallback
          src={crop.image}
          alt={crop.name}
          className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
        />
      </div>
      <div className="p-5">
        <h3 className="font-semibold text-lg mb-3 text-gray-900 tracking-tight">{crop.name}</h3>
        <div className="flex items-center gap-2 text-sm text-gray-600 mb-2">
          <MapPin className="w-4 h-4 text-gray-500" />
          <span className="font-medium">{crop.farmLocation}</span>
        </div>
        <div className="flex items-center justify-between mb-5">
          <div className="flex items-center gap-2">
            <Tag className="w-4 h-4 text-[#1a3d2e]" />
            <div>
              <span className="text-2xl font-bold text-[#1a3d2e]">₱{crop.pricePerKg}</span>
              <span className="text-sm text-gray-500 ml-1">/kg</span>
            </div>
          </div>
          <span className="text-xs text-gray-500 bg-gray-100 px-3 py-1 rounded-full font-medium">{crop.stock}</span>
        </div>
        <Button
          onClick={() => onSubscribe(crop)}
          className="w-full text-white font-medium rounded-xl shadow-md hover:shadow-lg transition-all duration-200 hover:scale-[1.02] py-3"
          style={{
            background: 'linear-gradient(135deg, #fb923c 0%, #f97316 100%)',
          }}
        >
          Mag-subscribe
        </Button>
      </div>
    </Card>
  );
}