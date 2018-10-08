## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).


## Initialize Android Maps Secret key as hidden file

- Create lib/keys.dart file, and write ```const googleMapsKey = 'Maps-Key';```
- Create android/app/src/main/res/values/secrets.xml file and write
    ```<?xml version="1.0" encoding="utf-8"?>
       <resources>
           <string name="google_maps_api_key">Maps-key</string>
       </resources>
    ```
- Replace **Maps-key** with actual Google Maps API Key.