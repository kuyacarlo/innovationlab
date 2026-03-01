import { CheckCircle2 } from 'lucide-react';

interface LogEntry {
  date: string;
  activity: string;
  towerId: string;
  status: string;
}

const logs: LogEntry[] = [
  {
    date: '2026-02-28',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  },
  {
    date: '2026-02-21',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  },
  {
    date: '2026-02-14',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-NORTH-02',
    status: 'Nakumpirma'
  },
  {
    date: '2026-02-07',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  },
  {
    date: '2026-01-31',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  },
  {
    date: '2026-01-24',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  },
  {
    date: '2026-01-17',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-NORTH-02',
    status: 'Nakumpirma'
  },
  {
    date: '2026-01-10',
    activity: 'Talaan ng Presensya via USSD',
    towerId: 'BUL-CENTRAL',
    status: 'Nakumpirma'
  }
];

export function EvidenceLedger() {
  return (
    <div className="bg-white border-2 border-[#1A3D2E] p-6 mb-6">
      <h2 className="text-2xl font-bold text-[#1A3D2E] mb-4 uppercase tracking-wide">
        Talaan ng Ebidensya: Katibayan ng Pag-okupa
      </h2>
      
      <div className="overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b-2 border-[#1A3D2E]">
              <th className="text-left py-3 px-4 font-bold text-[#1A3D2E] uppercase tracking-wider">Petsa</th>
              <th className="text-left py-3 px-4 font-bold text-[#1A3D2E] uppercase tracking-wider">Aktibidad</th>
              <th className="text-left py-3 px-4 font-bold text-[#1A3D2E] uppercase tracking-wider">Tower ID</th>
              <th className="text-left py-3 px-4 font-bold text-[#1A3D2E] uppercase tracking-wider">Kalagayan</th>
            </tr>
          </thead>
          <tbody className="font-mono">
            {logs.map((log, index) => (
              <tr 
                key={index}
                className="border-b border-gray-200 hover:bg-gray-50 transition-colors"
              >
                <td className="py-3 px-4 text-gray-900">{log.date}</td>
                <td className="py-3 px-4 text-gray-700">{log.activity}</td>
                <td className="py-3 px-4 text-gray-700">{log.towerId}</td>
                <td className="py-3 px-4">
                  <div className="flex items-center gap-2">
                    <CheckCircle2 className="w-4 h-4 text-[#22c55e]" />
                    <span className="text-[#22c55e] font-semibold">{log.status}</span>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      
      <div className="mt-4 text-xs text-gray-500 font-mono border-t pt-3">
        <p>HINDI MABABAGO NA TALAAN | MGA ENTRY: {logs.length} | BLOCKCHAIN HASH: 0x7f9a3b...d2e8</p>
      </div>
    </div>
  );
}