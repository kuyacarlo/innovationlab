import { ShoppingBag, Package, TrendingUp } from 'lucide-react';
import { NavLink } from 'react-router';
import { useState } from 'react';

export function SidebarNav() {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const navItems = [
    { id: 'marketplace', label: 'Pamilihan', icon: ShoppingBag, path: '/' },
    { id: 'subscriptions', label: 'Aking Subscriptions', icon: Package, path: '/subscriptions' },
    { id: 'impact', label: 'Aking Epekto', icon: TrendingUp, path: '/impact' },
  ];

  return (
    <>
      {/* Mobile Menu Button */}
      <button
        onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
        className="md:hidden fixed top-3 left-4 z-50 p-2 bg-white/10 text-white rounded-lg backdrop-blur-md hover:bg-white/20 transition-colors"
        aria-label="Toggle menu"
      >
        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          {isMobileMenuOpen ? (
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
          ) : (
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
          )}
        </svg>
      </button>

      {/* Overlay for mobile */}
      {isMobileMenuOpen && (
        <div
          className="md:hidden fixed inset-0 bg-black/50 z-40"
          onClick={() => setIsMobileMenuOpen(false)}
        />
      )}

      {/* Sidebar */}
      <div
        className={`w-64 h-screen fixed left-0 top-0 flex flex-col z-50 transition-transform duration-300 ${isMobileMenuOpen ? 'translate-x-0' : '-translate-x-full md:translate-x-0'
          }`}
        style={{
          background: 'linear-gradient(180deg, #1a3d2e 0%, #0f2419 100%)',
        }}
      >
        <div className="p-8 border-b border-white/10">
          <h1 className="text-3xl font-bold text-white tracking-tight">Sulong</h1>
          <p className="text-sm text-white/60 mt-1 font-medium tracking-wide">Farm to Table</p>
        </div>
        <nav className="flex-1 p-6">
          <ul className="space-y-2">
            {navItems.map((item) => {
              const Icon = item.icon;
              return (
                <li key={item.id}>
                  <NavLink
                    to={item.path}
                    end={item.path === '/'}
                    onClick={() => setIsMobileMenuOpen(false)}
                    className={({ isActive }) =>
                      `w-full flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-200 font-normal tracking-wide ${isActive
                        ? 'bg-white text-[#1a3d2e] shadow-lg font-medium'
                        : 'text-white/80 hover:bg-white/10 hover:text-white'
                      }`
                    }
                  >
                    <Icon className="w-5 h-5" />
                    <span>{item.label}</span>
                  </NavLink>
                </li>
              );
            })}
          </ul>
        </nav>
      </div>
    </>
  );
}