# Delivery Tracking Prototype

## Overview
An app made for take home assestment that tracks users location and records distance for the duration.

## Features
- Requests "When In Use" location permission.
- Start/stop tracking with buttons.
- Live latitude & longitude display.
- Total distance travelled (in meters).
- Status: Idle / Walking / Running / Driving. (Displayed by icon)

## Assumptions
- Distance is calculated from consecutive `CLLocation` updates.
- Speed calculation is derived from `CLLocation.speed` in m/s and is translated to km/h for calculation.
- Accuracy is limited by GPS and device conditions.

## Time Taken
- The setup time was long because my laptop did not have Xcode and after installing it kept crashing on launch as previous cache may have caused issues. Updated my macOS and installed Xcode a few times before getting it to work. 
- Even after setup, The simulator was not running so I tried installing ios 18 simulator but then turns out Xcode 26 does not support ios 18 simulator so again I had to roll back. 🫠
- Actual development time was ~2 hours (including coding, testing, and documentation).

## Possible Improvements
- Persist trip history.
- Show path on a map while tracking.
- Add unit tests for distance calculations.
- Better handling of location permissions. (Possibly by using better alerts and messages)
