import { createBrowserRouter } from 'react-router';
import { Layout } from './components/layout';
import { MarketplacePage } from './pages/marketplace';
import { SubscriptionsPage } from './pages/subscriptions';
import { ImpactTrackerPage } from './pages/impact-tracker';
import { NotFoundPage } from './pages/not-found';

export const router = createBrowserRouter([
  {
    path: '/',
    Component: Layout,
    children: [
      { index: true, Component: MarketplacePage },
      { path: 'subscriptions', Component: SubscriptionsPage },
      { path: 'impact', Component: ImpactTrackerPage },
      { path: '*', Component: NotFoundPage },
    ],
  },
]);
