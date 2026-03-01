import { Outlet } from 'react-router';
import { SidebarNav } from './sidebar-nav';
import { Toaster } from 'sonner';

export function Layout() {
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col md:flex-row">
      <Toaster position="top-right" richColors />
      <SidebarNav />

      {/* Mobile Top Bar */}
      <div className="md:hidden h-16 bg-[#1a3d2e] flex items-center justify-center sticky top-0 z-40 shadow-md">
        <h1 className="text-xl font-bold text-white tracking-tight">Sulong</h1>
      </div>

      <div className="flex-1 md:ml-64">
        <Outlet />
      </div>
    </div>
  );
}