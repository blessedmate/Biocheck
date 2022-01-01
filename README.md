# Biocheck

A Flutter mobile app that aims to standardize and digitize preoperatory medical evaluations.

## Description

Preoperatory medical evaluations are not standardized and can vary significantly depending on the hospital and doctor's expertise. The idea with this application is to provide a single platform, where doctors can perform these evaluations digitally and give the best and equal attention to patients. 

The main functionality of this application is to create preoperatory evaluations based on predefined templates for different surgeries. The evaluations performed will be stored remotely using Firebase services and on a local database.

Users can also access a profile view and edit personal info, a settings view to edit preferences, and a contacts list where coworkers from the same hospital are displayed and can be contacted via email.

Firebase authentication services are used for registering and login.

This application implements GetX as a state manager.

## Implemented packages

Packages used to build this app are:

- battery_plus: ^2.0.1
- cupertino_icons: ^1.0.2
- firebase_core: ^1.10.0
- font_awesome_flutter: ^9.1.0
- get: 4.3.8
- get_storage: ^2.0.3
- local_auth: ^1.1.8
- location: ^4.2.0
- reactive_forms: ^10.6.2
- sqflite: ^2.0.0+4
- path_provider: ^2.0.6
- cached_network_image: ^3.1.0+1
- cloud_firestore: ^3.1.0
- firebase_auth: ^3.3.0
- url_launcher: ^6.0.17
- image_picker: ^0.8.4+4
- firebase_storage: ^10.2.1
