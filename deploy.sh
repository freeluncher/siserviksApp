#!/bin/bash

echo "Starting deployment..."

# Pull latest changes from the repository
git pull origin main

# Install backend dependencies
composer install --optimize-autoloader --no-dev

# Run database migrations
php artisan migrate --force

# Install frontend dependencies
npm install
npm run build

# Clear and cache configurations
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Deployment finished successfully."
