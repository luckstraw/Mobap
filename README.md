# Lab 3
Flutter CRUD App with Firbase

## Output

<div align="center">
  <img src="/assets/UI.png" alt="Phone Screen" height="600">
</div>

<div align="center">
  <img src="/assets/database.png" alt="Phone Screen">
</div>

## How to Run

1. If you have't already, [install the Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli)

2. Log into Firebase using your Google account by running the following command:
    ```bash
    firebase login
    ```
3. Install the FlutterFire CLI by running the following command from any directory:
    ```bash
    dart pub global activate flutterfire_cli
    ```
4. Go to [Firebase Console](https://console.firebase.google.com/) and create a project. Build Firestore database there

5. Generate the firebase_options.dart located at `lib`:
    ```powershell
    flutterfire configure
    ```

6. If aske to `reuse the values in your existing 'firebase.json' file to configure your project?` select `no`

7. Then pick the project you made in the firebase console at **step 4**

8. Open/Connect your device and run:
    ```bash
    flutter run
    ```