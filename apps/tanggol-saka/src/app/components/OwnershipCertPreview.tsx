import { Download, Stamp } from 'lucide-react';
import { Button } from './ui/button';

export function OwnershipCertPreview() {
  return (
    <div className="bg-white border-2 border-[#1A3D2E] p-6">
      <h2 className="text-2xl font-bold text-[#1A3D2E] mb-4 uppercase tracking-wide">
        Opisyal na Katibayan ng Lupain
      </h2>
      
      {/* Document Preview */}
      <div className="relative bg-gradient-to-b from-white to-gray-50 border-4 border-[#1A3D2E] p-8 shadow-lg">
        {/* Large SABI Watermark */}
        <div className="absolute inset-0 flex items-center justify-center pointer-events-none opacity-5">
          <div className="text-[12rem] font-bold text-[#1A3D2E] transform -rotate-12">
            SABI
          </div>
        </div>

        {/* Document Content */}
        <div className="relative z-10">
          {/* Header with Seal */}
          <div className="text-center mb-8 border-b-2 border-[#1A3D2E] pb-6">
            <div className="flex items-center justify-center mb-4">
              <Stamp className="w-16 h-16 text-[#2563EB]" />
            </div>
            <h3 className="text-4xl font-serif font-bold text-[#1A3D2E] mb-2">
              KATIBAYAN NG PAGSASAKA
            </h3>
            <p className="text-sm uppercase tracking-widest text-gray-600">
              Sertipiko ng Pagsasaka at Pag-okupa
            </p>
          </div>

          {/* Certificate Details */}
          <div className="space-y-6 text-gray-800 mb-8">
            <div className="grid grid-cols-2 gap-4 text-sm">
              <div>
                <p className="font-semibold text-[#1A3D2E] mb-1">Numero ng Sertipiko</p>
                <p className="font-mono text-lg">TS-BUL-2026-0042</p>
              </div>
              <div>
                <p className="font-semibold text-[#1A3D2E] mb-1">Petsa ng Paglabas</p>
                <p className="font-mono text-lg">Marso 01, 2026</p>
              </div>
            </div>

            <div className="border-t pt-4">
              <p className="font-semibold text-[#1A3D2E] mb-2">Pinatutunayan nito na si:</p>
              <p className="text-xl font-serif mb-4">Jose 'Mang Jose' Santos</p>
              <p className="text-sm leading-relaxed">
                Ay nagpakita ng patuloy na pag-okupa at paggamit sa agrikultura ng parsela ng 
                lupa na matatagpuan sa Barangay San Nicolas, Bulakan, Bulacan, na may koordinada 
                na 14.79° N, 120.88° E, na may sukat na 1.2 ektarya, gaya ng pinatutunayan ng 
                mga naberipikang tala ng lokasyon mula sa GSM at mga talaan ng pag-okupa na 
                pinapanatili sa sistema ng Tanggol-Saka ledger.
              </p>
            </div>

            <div className="border-t pt-4">
              <p className="font-semibold text-[#1A3D2E] mb-2">Detalye ng Lupain:</p>
              <div className="grid grid-cols-2 gap-3 text-sm font-mono">
                <div>
                  <span className="text-gray-600">Sukat:</span>
                  <span className="ml-2 font-bold">1.2 Ektarya</span>
                </div>
                <div>
                  <span className="text-gray-600">Koordinada:</span>
                  <span className="ml-2 font-bold">14.79° N, 120.88° E</span>
                </div>
              </div>
            </div>
          </div>

          {/* Digital Signature Area */}
          <div className="border-t-2 border-[#1A3D2E] pt-6">
            <div className="grid grid-cols-2 gap-8">
              <div className="text-center">
                <div className="h-16 flex items-center justify-center mb-2">
                  <div className="border-b-2 border-[#1A3D2E] w-48 pb-1">
                    <p className="font-serif italic text-2xl text-[#1A3D2E]">J. Santos</p>
                  </div>
                </div>
                <p className="text-xs uppercase tracking-wider text-gray-600">
                  Rehistradong Nag-okupa
                </p>
              </div>
              <div className="text-center">
                <div className="h-16 flex items-center justify-center mb-2">
                  <div className="w-16 h-16 rounded-full bg-[#2563EB] flex items-center justify-center">
                    <Stamp className="w-8 h-8 text-white" />
                  </div>
                </div>
                <p className="text-xs uppercase tracking-wider text-gray-600">
                  Digital na Selyo
                </p>
                <p className="text-xs font-mono text-gray-500 mt-1">
                  Napatunayan: 2026-03-01
                </p>
              </div>
            </div>
          </div>

          {/* Verification Footer */}
          <div className="mt-6 bg-[#1A3D2E] text-white p-4 text-xs font-mono">
            <p className="text-center">
              KODIGO NG PAGPAPATUNAY: TS-CERT-{Math.random().toString(36).substr(2, 9).toUpperCase()}
            </p>
          </div>
        </div>
      </div>

      {/* Download Button */}
      <div className="mt-6 flex justify-center">
        <Button 
          className="bg-[#2563EB] hover:bg-[#1d4ed8] text-white px-8 py-6 text-lg"
          size="lg"
        >
          <Download className="w-5 h-5 mr-2" />
          I-download ang Opisyal na PDF
        </Button>
      </div>
    </div>
  );
}