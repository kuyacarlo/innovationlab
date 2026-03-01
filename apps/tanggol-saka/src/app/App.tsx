import { ProfileHeader } from './components/ProfileHeader';
import { LandVisualization } from './components/LandVisualization';
import { EvidenceLedger } from './components/EvidenceLedger';
import { OwnershipCertPreview } from './components/OwnershipCertPreview';

export default function App() {
  return (
    <div className="min-h-screen bg-[#F9FAFB] py-8 px-4">
      <div className="max-w-7xl mx-auto">
        {/* Header Banner */}
        <div className="bg-[#1A3D2E] text-white p-6 mb-8 border-4 border-[#1A3D2E]">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold mb-1">TANGGOL-SAKA</h1>
              <p className="text-sm tracking-widest uppercase opacity-90">
                Sistema ng Digital Identity at Pagpapatunay ng Lupain
              </p>
            </div>
            <div className="text-right">
              <p className="text-xs opacity-75">Kalagayan ng Sistema</p>
              <p className="text-lg font-bold text-[#22c55e]">● AKTIBO</p>
            </div>
          </div>
        </div>

        {/* Main Content */}
        <div className="space-y-6">
          <ProfileHeader />
          <LandVisualization />
          <EvidenceLedger />
          <OwnershipCertPreview />
        </div>

        {/* Footer */}
        <div className="mt-8 text-center text-xs text-gray-500 font-mono border-t-2 border-[#1A3D2E] pt-4">
          <p>TANGGOL-SAKA © 2026 | HINDI MABABAGO NA SISTEMA NG TALAAN | LAHAT NG TALA AY LIGTAS SA CRYPTOGRAPHY</p>
        </div>
      </div>
    </div>
  );
}