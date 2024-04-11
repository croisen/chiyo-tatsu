#!/bin/sh

LATEST_TAG=$(git describe --abbrev=0 --tags 2>/dev/null || echo "0.0.0")
IFS='.' read -r -a SEMVER_PARTS <<< $(echo "$LATEST_TAG" | sed "s/v//")

SEMVER_PARTS[2]="$((SEMVER_PARTS[2] + 1))"
NEW_TAG="v${SEMVER_PARTS[0]}.${SEMVER_PARTS[1]}.${SEMVER_PARTS[2]}"

echo $NEW_TAG
