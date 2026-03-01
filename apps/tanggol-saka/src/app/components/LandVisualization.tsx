import { Radio } from 'lucide-react';

export function LandVisualization() {
  return (
    <div className="bg-white border-2 border-[#1A3D2E] p-6 mb-6">
      <h2 className="text-2xl font-bold text-[#1A3D2E] mb-4 uppercase tracking-wide">
        Mapa ng Lupain
      </h2>
      
      <div className="relative w-full h-[500px] bg-gray-900 rounded-sm overflow-hidden">
        {/* Satellite Map Background */}
        <img 
          src="https://images.unsplash.com/photo-1725308283640-cf46e178bd02?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzYXRlbGxpdGUlMjBtYXAlMjBhZXJpYWwlMjBmYXJtbGFuZHxlbnwxfHx8fDE3NzIzNjk1NTd8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
          alt="Satellite Map"
          className="w-full h-full object-cover opacity-80"
        />
        
        {/* Neon Green Polygon Overlay */}
        <svg 
          className="absolute inset-0 w-full h-full pointer-events-none"
          viewBox="0 0 1000 500"
        >
          <defs>
            <filter id="glow">
              <feGaussianBlur stdDeviation="4" result="coloredBlur"/>
              <feMerge>
                <feMergeNode in="coloredBlur"/>
                <feMergeNode in="SourceGraphic"/>
              </feMerge>
            </filter>
          </defs>
          
          {/* Land Plot Polygon */}
          <polygon 
            points="350,150 650,180 620,350 380,340"
            fill="rgba(34, 197, 94, 0.3)"
            stroke="#22c55e"
            strokeWidth="3"
            filter="url(#glow)"
          />
        </svg>

        {/* Live Signal Pulse Icon */}
        <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2">
          <div className="relative">
            {/* Pulsing rings */}
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="w-20 h-20 rounded-full bg-[#22c55e] opacity-30 animate-ping"></div>
            </div>
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="w-16 h-16 rounded-full bg-[#22c55e] opacity-50 animate-pulse"></div>
            </div>
            
            {/* Icon */}
            <div className="relative bg-[#22c55e] p-3 rounded-full shadow-lg">
              <Radio className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>

        {/* Info Overlay */}
        <div className="absolute bottom-4 left-4 right-4 bg-black/80 backdrop-blur-sm p-4 rounded border border-[#22c55e]">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-white text-sm font-mono">
            <div>
              <span className="text-gray-400">Sukat ng Lupa:</span>
              <span className="ml-2 font-bold text-[#22c55e]">1.2 Ektarya</span>
            </div>
            <div>
              <span className="text-gray-400">Koordinada:</span>
              <span className="ml-2 font-bold text-[#22c55e]">14.79° N, 120.88° E</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}