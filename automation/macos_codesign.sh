#!/bin/bash
APP_NAME="$2"
ENTITLEMENTS="automation/macos_entitlements.entitlements"
SIGNING_IDENTITY="$1"

find "$APP_NAME/Contents/MacOS/"|while read fname; do
    if [[ -f $fname ]]; then
        echo "[INFO] Signing $fname"
        codesign --force --timestamp --options=runtime --entitlements "$ENTITLEMENTS" --sign "$SIGNING_IDENTITY" "$fname"
    fi
done

echo "[INFO] Signing app file"

codesign --force --timestamp --options=runtime --entitlements "$ENTITLEMENTS" --sign "$SIGNING_IDENTITY" "$APP_NAME"