import { useState, useEffect } from 'react';
import { Clock, MapPin, Truck, Navigation } from 'lucide-react';
import { Card } from './ui/card';

export function DeliveryWidget() {
  const [timeRemaining, setTimeRemaining] = useState({
    hours: 12,
    minutes: 34,
    seconds: 56,
  });

  useEffect(() => {
    const interval = setInterval(() => {
      setTimeRemaining((prev) => {
        let { hours, minutes, seconds } = prev;

        if (seconds > 0) {
          seconds--;
        } else {
          seconds = 59;
          if (minutes > 0) {
            minutes--;
          } else {
            minutes = 59;
            if (hours > 0) {
              hours--;
            }
          }
        }

        return { hours, minutes, seconds };
      });
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  return (
    <Card className="p-6 sticky top-6 rounded-xl border-0 shadow-lg">
      <h3 className="font-semibold text-xl mb-6 text-gray-900 tracking-tight">Susunod na Delivery</h3>

      {/* Countdown */}
      <div className="flex items-center gap-3 mb-6">
        <Clock className="w-5 h-5 text-orange-500" />
        <div className="flex gap-2 items-center">
          <div className="bg-gradient-to-br from-[#1a3d2e] to-[#0f2419] text-white px-3 py-2 rounded-lg text-center min-w-[3.5rem] shadow-md">
            <div className="text-2xl font-mono font-bold">{String(timeRemaining.hours).padStart(2, '0')}</div>
            <div className="text-[10px] uppercase tracking-wider font-medium opacity-80">oras</div>
          </div>
          <div className="flex items-center text-2xl font-bold text-gray-400">:</div>
          <div className="bg-gradient-to-br from-[#1a3d2e] to-[#0f2419] text-white px-3 py-2 rounded-lg text-center min-w-[3.5rem] shadow-md">
            <div className="text-2xl font-mono font-bold">{String(timeRemaining.minutes).padStart(2, '0')}</div>
            <div className="text-[10px] uppercase tracking-wider font-medium opacity-80">min</div>
          </div>
          <div className="flex items-center text-2xl font-bold text-gray-400">:</div>
          <div className="bg-gradient-to-br from-[#1a3d2e] to-[#0f2419] text-white px-3 py-2 rounded-lg text-center min-w-[3.5rem] shadow-md">
            <div className="text-2xl font-mono font-bold">{String(timeRemaining.seconds).padStart(2, '0')}</div>
            <div className="text-[10px] uppercase tracking-wider font-medium opacity-80">seg</div>
          </div>
        </div>
      </div>

      {/* Delivery Location */}
      <div className="flex items-center gap-2 mb-5 text-sm text-gray-600">
        <MapPin className="w-4 h-4 text-gray-500" />
        <span className="font-medium">Quezon City, Metro Manila</span>
      </div>

      {/* Map with Truck - Mapbox Style */}
      <div className="relative bg-gradient-to-br from-gray-50 to-gray-100 rounded-xl h-52 overflow-hidden shadow-inner border border-gray-200">
        {/* Enhanced map illustration */}
        <div className="absolute inset-0">
          {/* Grid pattern for map feel */}
          <div className="absolute inset-0 opacity-30">
            <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse">
                  <path d="M 20 0 L 0 0 0 20" fill="none" stroke="#d1d5db" strokeWidth="0.5" />
                </pattern>
              </defs>
              <rect width="100%" height="100%" fill="url(#grid)" />
            </svg>
          </div>

          {/* Subtle terrain features */}
          <svg className="w-full h-full absolute inset-0" viewBox="0 0 300 200" preserveAspectRatio="xMidYMid slice">
            {/* Road paths - more defined */}
            <defs>
              <linearGradient id="roadGradient" x1="0%" y1="0%" x2="100%" y2="0%">
                <stop offset="0%" stopColor="#d1d5db" stopOpacity="0.5" />
                <stop offset="50%" stopColor="#9ca3af" stopOpacity="0.7" />
                <stop offset="100%" stopColor="#d1d5db" stopOpacity="0.5" />
              </linearGradient>
            </defs>

            {/* Main delivery route */}
            <path
              d="M 30 100 Q 90 95, 150 100 T 270 100"
              stroke="url(#roadGradient)"
              strokeWidth="10"
              fill="none"
              strokeLinecap="round"
            />

            {/* Route outline for depth */}
            <path
              d="M 30 100 Q 90 95, 150 100 T 270 100"
              stroke="#e5e7eb"
              strokeWidth="14"
              fill="none"
              strokeLinecap="round"
              opacity="0.5"
            />

            {/* Start point marker - origin */}
            <circle cx="30" cy="100" r="10" fill="#1a3d2e" opacity="0.2" />
            <circle cx="30" cy="100" r="7" fill="#1a3d2e" />
            <circle cx="30" cy="100" r="3" fill="#ffffff" />

            {/* End point marker - destination */}
            <circle cx="270" cy="100" r="10" fill="#fb923c" opacity="0.2" />
            <circle cx="270" cy="100" r="7" fill="#fb923c" />
            <circle cx="270" cy="100" r="3" fill="#ffffff" />
          </svg>

          {/* Animated Truck with enhanced styling */}
          <div
            className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 rounded-full shadow-2xl"
            style={{
              background: 'linear-gradient(135deg, #fb923c 0%, #f97316 100%)',
              padding: '12px',
              animation: 'truckBounce 2s ease-in-out infinite',
            }}
          >
            <Truck className="w-7 h-7 text-white" />
          </div>

          {/* Destination marker icon */}
          <div className="absolute" style={{ top: '50%', right: '15px', transform: 'translateY(-50%)' }}>
            <Navigation className="w-5 h-5 text-[#fb923c]" />
          </div>
        </div>
      </div>

      <div className="mt-5 text-sm text-center">
        <span className="inline-flex items-center gap-2 text-gray-600 font-medium">
          <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></span>
          Papunta na ang iyong delivery!
        </span>
      </div>
    </Card>
  );
}