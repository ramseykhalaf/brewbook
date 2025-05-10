#!/bin/bash

# Exit on any error
set -e

echo "Building app..."
xcodebuild -scheme brewbook -sdk iphonesimulator -derivedDataPath ./build

APP_PATH="./build/Build/Products/Debug-iphonesimulator/brewbook.app"

if [ ! -d "$APP_PATH" ]; then
    echo "Error: App not found at $APP_PATH"
    exit 1
fi

# Step 1: Get or boot a simulator
DEVICE_NAME="iPhone 16 Pro"
DEVICE_ID=$(xcrun simctl list devices | grep "$DEVICE_NAME" | grep -v "unavailable" | tail -1 | awk -F '[()]' '{print $2}')

if [ -z "$DEVICE_ID" ]; then
    echo "Error: Device '$DEVICE_NAME' not found!"
    exit 1
fi

# Check if simulator is already running
SIMULATOR_STATE=$(xcrun simctl list devices | grep "$DEVICE_NAME" | grep -v "unavailable" | grep -o "Booted" || echo "Shutdown")

if [ "$SIMULATOR_STATE" != "Booted" ]; then
    echo "Booting device: $DEVICE_NAME ($DEVICE_ID)"
    xcrun simctl boot "$DEVICE_ID"
    # Open Simulator app only if we had to boot it
    echo "Opening Simulator..."
    open -a Simulator
else
    echo "Simulator is already running"
fi

# Step 2: Install the app
echo "Installing app..."
xcrun simctl install "$DEVICE_ID" "$APP_PATH"

# Step 3: Launch the app
BUNDLE_ID=$(defaults read "$APP_PATH/Info.plist" CFBundleIdentifier)
if [ -z "$BUNDLE_ID" ]; then
    echo "Error: Could not read bundle identifier from Info.plist"
    exit 1
fi

echo "Launching app with bundle ID: $BUNDLE_ID"
xcrun simctl launch "$DEVICE_ID" "$BUNDLE_ID"

echo "Done! App should be running in the simulator."
