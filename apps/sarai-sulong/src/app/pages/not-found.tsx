import { AlertCircle } from 'lucide-react';
import { Button } from '../components/ui/button';
import { Link } from 'react-router';

export function NotFoundPage() {
  return (
    <div className="min-h-screen flex items-center justify-center px-8">
      <div className="text-center max-w-md">
        <div className="mb-6 flex justify-center">
          <div className="w-24 h-24 rounded-full bg-gray-100 flex items-center justify-center">
            <AlertCircle className="w-12 h-12 text-gray-400" />
          </div>
        </div>
        <h1 className="text-6xl font-bold text-gray-900 mb-4">404</h1>
        <h2 className="text-2xl font-semibold text-gray-900 mb-3">Page Not Found</h2>
        <p className="text-gray-600 mb-8">
          The page you're looking for doesn't exist or has been moved.
        </p>
        <Link to="/">
          <Button
            className="text-white font-medium rounded-xl shadow-md"
            style={{
              background: 'linear-gradient(135deg, #fb923c 0%, #f97316 100%)',
            }}
          >
            Back to Marketplace
          </Button>
        </Link>
      </div>
    </div>
  );
}
