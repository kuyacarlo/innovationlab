#!/bin/bash
set -e

echo "Running checks on monorepo..."

echo "1. Checking NodeJS apps (Sarai Sulong, Tanggol Saka, USSD Blaster)"
npm install
npm run build --workspaces --if-present
# Also run check if defined
npm run check --workspaces --if-present

echo "2. Checking Flutter app (Mobile App)"
cd apps/mobile-app
flutter pub get
flutter analyze

echo "Checks completed successfully!"
