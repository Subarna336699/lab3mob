# Rotating Picture Frame

A simple Flutter application that displays images in a rotating picture frame style. The app pulls images from AWS cloud storage (or any URL) and displays them with a unique border. The images rotate every 10 seconds, and users can pause/resume the rotation.

## Features
- Displays images from an external URL (e.g., AWS S3) or local assets.
- Rotates through images every 10 seconds.
- Customizable picture frame with an outside border.
- Pause and resume functionality for the image rotation.

## Screenshots
![App Screenshot](assets/images/screenshot.jpg)

## Requirements
- Flutter 3.7.0 or higher
- Android SDK (minimum version 21)
- iOS deployment target 9.0 or higher
- Android NDK version 27.0.12077973

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/rotating-picture-frame.git
cd rotating-picture-frame
