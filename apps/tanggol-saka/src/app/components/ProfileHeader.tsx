import { Badge } from './ui/badge';
import { Shield, MapPin } from 'lucide-react';

export function ProfileHeader() {
  return (
    <div className="bg-white border-2 border-[#1A3D2E] p-8 mb-6">
      <div className="flex items-start gap-6">
        {/* Avatar with Initials */}
        <div className="flex-shrink-0">
          <div className="w-24 h-24 bg-[#1A3D2E] rounded-sm flex items-center justify-center border-4 border-[#2563EB]">
            <span className="text-3xl font-bold text-white">JS</span>
          </div>
        </div>

        {/* Profile Information */}
        <div className="flex-1">
          <div className="flex items-start justify-between mb-3">
            <div>
              <h1 className="text-3xl font-bold text-[#1A3D2E] mb-2">
                Jose 'Mang Jose' Santos
              </h1>
              <div className="flex items-center gap-2 mb-3">
                <Badge className="bg-[#2563EB] text-white hover:bg-[#2563EB] text-sm px-3 py-1">
                  <Shield className="w-3 h-3 mr-1" />
                  Napatunayan ng GSM
                </Badge>
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
            <div className="flex items-start gap-2">
              <MapPin className="w-4 h-4 text-[#1A3D2E] mt-0.5 flex-shrink-0" />
              <div>
                <p className="font-semibold text-[#1A3D2E]">Lokasyon</p>
                <p className="text-gray-700">Barangay San Nicolas, Bulakan, Bulacan</p>
              </div>
            </div>
            <div>
              <p className="font-semibold text-[#1A3D2E]">ID ng Miyembro</p>
              <p className="font-mono text-lg text-gray-900 tracking-wider">TS-BUL-2026-0042</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}