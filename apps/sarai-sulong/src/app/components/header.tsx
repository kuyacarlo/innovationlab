import { Search } from 'lucide-react';
import { Input } from './ui/input';

interface HeaderProps {
  searchQuery: string;
  onSearchChange: (query: string) => void;
}

export function Header({ searchQuery, onSearchChange }: HeaderProps) {
  return (
    <header className="bg-white border-b border-gray-200 px-4 md:px-8 py-6 md:py-8">
      <div className="max-w-7xl mx-auto">
        <h2 className="text-2xl md:text-3xl font-semibold mb-4 md:mb-5 text-gray-900 tracking-tight">Kasalukuyang Ani</h2>
        <div className="relative max-w-xl">
          <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
          <Input
            type="text"
            placeholder="Maghanap ng tanim (halimbawa: Sitaw, Kalabasa)..."
            value={searchQuery}
            onChange={(e) => onSearchChange(e.target.value)}
            className="pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl shadow-sm focus:ring-2 focus:ring-[#1a3d2e] focus:border-transparent transition-all w-full"
          />
        </div>
      </div>
    </header>
  );
}