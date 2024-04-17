#!/bin/bash

echo "Running Script"

read -p "Enter the project name: " project_name
# Create a new React app with Vite using TypeScript
echo "Creating a new React app with Vite and TypeScript..."
npm create vite@latest $project_name -- --template react-ts

# Navigate to the project directory
echo "Navigating to the project directory..."
cd $project_name

# Install dependencies
echo "Installing dependencies..."
npm install

# Install Tailwind CSS and related packages
echo "Installing Tailwind CSS and related packages..."
npm install -D tailwindcss postcss autoprefixer

# Initialize Tailwind CSS configuration
echo "Initializing Tailwind CSS configuration..."
npx tailwindcss init -p

# Update Tailwind CSS configuration in tailwind.config.js
echo "Updating Tailwind CSS configuration in tailwind.config.js..."
echo "/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}" > tailwind.config.js

# Create index.css file with Tailwind CSS directives
echo "Creating index.css file with Tailwind CSS directives..."
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/index.css


echo "Configuring the App.tsx"
echo "const App = () => {
  return <div>App</div>;
};

export default App;" > src/App.tsx

# remove App.css
rm src/App.css


# Modifying index.html
echo "<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$project_name</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html> " > index.html

# Install additional dependencies
echo "Installing additional dependencies..."
npm install react-icons react-router-dom

# Start the development server
echo "Starting the development server..."
npm run dev