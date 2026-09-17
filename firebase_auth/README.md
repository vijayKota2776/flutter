# 📱 Flutter Firebase Authentication App

Ek complete multi-platform Flutter application jisme **Firebase Authentication** (Email/Password & Google Sign-In) implement kiya gaya hai. Isme clean architecture, error handling ke liye custom dialogs, reactive auth state management, aur automated CI/CD pipeline (GitHub Actions for Android APK & iOS IPA) shamil hai.

---

## 📑 Table of Contents (Vishy-suchi)
1. [🌟 Features](#-features)
2. [📁 Project Structure (Folder Structure)](#-project-structure)
3. [🔍 Detailed Explanation of All Files in `lib/`](#-detailed-explanation-of-all-files-in-lib)
   - [1. `lib/main.dart`](#1-libmaindart)
   - [2. `lib/firebase_options.dart`](#2-libfirebase_optionsdart)
   - [3. `lib/services/auth_service.dart`](#3-libservicesauth_servicedart)
   - [4. `lib/utils/custom_alert_box.dart`](#4-libutilscustom_alert_boxdart)
   - [5. `lib/screens/auth_wrapper.dart`](#5-libscreensauth_wrapperdart)
   - [6. `lib/screens/login_screen.dart`](#6-libscreenslogin_screendart)
   - [7. `lib/screens/register_screen.dart`](#7-libscreensregister_screendart)
   - [8. `lib/screens/home_screen.dart`](#8-libscreenshome_screendart)
   - [9. `lib/screens/profile_screen.dart`](#9-libscreensprofile_screendart)
4. [⚙️ GitHub Actions CI/CD (`.github/workflows/build.yml`)](#️-github-actions-cicd-githubworkflowsbuildyml)
5. [🚀 How to Run Locally (App ko local system par kaise chalayein)](#-how-to-run-locally)

---

## 🌟 Features
- 🔐 **Email & Password Authentication**: Naya account register karna aur login karna.
- 🌐 **Google Sign-In**: Cross-platform Google authentication (Android, iOS & Web).
- 🔄 **Realtime Auth State Listener**: User logged in hai ya logged out, automatically detect karke screen change hoti hai (`AuthWrapper`).
- 🎨 **Modern UI & Material 3**: Beautiful theme aur responsive layout (Mobile, Web & Desktop support).
- 🚨 **Custom Alert Dialogs**: Success, Error, Warning aur Info ke liye stylized custom popups.
- 🤖 **Automated CI/CD**: GitHub Actions ke dwara automated `.apk` (Android) aur `.ipa` (iOS) builds.

---

## 📁 Project Structure

```text
firebase_auth/
├── .github/
│   └── workflows/
│       └── build.yml               <-- GitHub Actions CI/CD for APK & IPA
├── android/                        <-- Android native configurations
├── ios/                            <-- iOS native configurations
├── web/                            <-- Web configuration files
├── windows/                        <-- Windows desktop configurations
├── lib/
│   ├── firebase_options.dart       <-- Firebase platform configuration credentials
│   ├── main.dart                   <-- App entry point & initialization
│   ├── screens/
│   │   ├── auth_wrapper.dart       <-- Auth state listener & routing gate
│   │   ├── home_screen.dart        <-- Home page after successful login
│   │   ├── login_screen.dart       <-- User Login UI & Google Sign-In
│   │   ├── profile_screen.dart     <-- User Profile details (Photo, Name, Email, UID)
│   │   └── register_screen.dart    <-- User Registration / Sign-Up UI
│   ├── services/
│   │   └── auth_service.dart       <-- Firebase Auth & Google Sign-In business logic
│   └── utils/
│       └── custom_alert_box.dart   <-- Reusable Custom Alert Dialogs
├── pubspec.yaml                    <-- Dependencies and assets configuration
└── README.md                       <-- Project Documentation
```

---

## 🔍 Detailed Explanation of All Files in `lib/`

Yahan `lib/` folder ki har ek file ka line-by-line aur conceptual explanation diya gaya hai:

---

### 1. `lib/main.dart`
**Uddeshya (Purpose):** Yeh application ka starting point (Entry point) hai jahan Flutter app bootstrap hoti hai aur Firebase initialize hota hai.

- **`main()` Function:**
  - `WidgetsFlutterBinding.ensureInitialized()`: Flutter ke engine aur native code ke communication channel ko initialize karta hai taaki asynchronous code run ho sake.
  - `await Firebase.initializeApp(...)`: App ko Firebase backend ke sath connect karta hai `DefaultFirebaseOptions.currentPlatform` credentials use karke.
  - `runApp(const MyApp())`: Flutter application tree ko start karta hai.
- **`MyApp` Class (`StatelessWidget`):**
  - Application configuration (`MaterialApp`) define karta hai.
  - `useMaterial3: true`: Modern Material 3 design system activate karta hai.
  - `colorScheme`: Primary purple seed color set karta hai.
  - `home: const AuthWrapper()`: App ka pehla screen `AuthWrapper` set karta hai jo decide karega ki login screen dikhani hai ya home screen.

---

### 2. `lib/firebase_options.dart`
**Uddeshya (Purpose):** Yeh file alag-alag platforms (Android, Web, Windows) ke liye Firebase API keys, project ID aur App IDs ko dynamically provide karti hai.

- **`DefaultFirebaseOptions` Class:**
  - `currentPlatform` getter: Check karta hai ki app Web par chal rahi hai (`kIsWeb`) ya Android/Windows par (`defaultTargetPlatform`), aur uske hisab se suitable `FirebaseOptions` return karta hai.
  - `FirebaseOptions web`: Web platform ke credentials (`apiKey`, `appId`, `projectId`, `storageBucket`, etc.).
  - `FirebaseOptions android`: Android app ke specific credentials.
  - `FirebaseOptions windows`: Windows desktop platform ke credentials.

---

### 3. `lib/services/auth_service.dart`
**Uddeshya (Purpose):** Firebase Authentication aur Google Sign-In ki saari business logic ko ek single service class me encapsulate kiya gaya hai.

- **Fields:**
  - `FirebaseAuth _auth`: Firebase Auth instance.
  - `GoogleSignIn _googleSignIn`: Google Sign-In plugin instance.
- **Getters:**
  - `Stream<User?> get authStateChanges`: Firebase Auth ka realtime stream jo broadcast karta hai jab bhi user login ya logout hota hai.
  - `User? get currentUser`: Currently logged in user ka object return karta hai.
- **Methods:**
  - `signInWithEmail(email, password)`: Email aur password ke through login karne ke liye `_auth.signInWithEmailAndPassword` call karta hai.
  - `signUpWithEmail(email, password)`: Naya account create karne ke liye `_auth.createUserWithEmailAndPassword` call karta hai.
  - `signInWithGoogle()`: Cross-platform Google login logic:
    - *Web par:* `_auth.signInWithPopup(GoogleAuthProvider())` use karta hai.
    - *Mobile par:* Native Google dialog open karta hai (`_googleSignIn.signIn()`), authentication tokens (access token & ID token) extract karta hai, aur Firebase credential banakar `_auth.signInWithCredential(credential)` call karta hai.
  - `signOut()`: Dono Firebase aur Google session ko simultaneously logout karta hai (`Future.wait`).

---

### 4. `lib/utils/custom_alert_box.dart`
**Uddeshya (Purpose):** App me errors, warnings, success aur info messages ko sundar aur modern modal dialog box me show karne ke liye reusable utility class.

- **Static Functions:**
  - `showSuccess(context, title, message)`: Green icon aur light-green background ke sath success alert.
  - `showError(context, title, message)`: Red icon aur light-red background ke sath error message.
  - `showWarning(context, title, message)`: Orange icon ke sath validation warning.
  - `showInfo(context, title, message)`: Blue icon ke sath informational popup.
- **`_showAlert(...)` (Private Helper):**
  - Ek custom `AlertDialog` render karta hai jisme rounded corners (`BorderRadius.circular(15)`), custom icon, dynamic title/message color, aur themed 'OK' button hota hai.

---

### 5. `lib/screens/auth_wrapper.dart`
**Uddeshya (Purpose):** App ka routing gatekeeper. Yeh user ke login state ke hisab se dynamically screen switch karta hai.

- **`StreamBuilder<User?>`:**
  - `AuthService().authStateChanges` stream ko continuously listen karta hai.
  - **State 1 (Loading):** Jab tak Firebase status check kar raha ho (`ConnectionState.waiting`), tab tak `CircularProgressIndicator()` center me dikhata hai.
  - **State 2 (Authenticated):** Agar user logged in hai (`snapshot.hasData`), toh automatically `HomeScreen()` display karta hai.
  - **State 3 (Unauthenticated):** Agar user logged in nahi hai ya logout ho chuka hai, toh `LoginScreen()` display karta hai.

---

### 6. `lib/screens/login_screen.dart`
**Uddeshya (Purpose):** User ko login karne ke liye interface provide karta hai.

- **Controllers & State:**
  - `_emailController` & `_passwordController`: Text input field data manage karne ke liye.
  - `_isLoading`: Loading spinner show/hide karne ke liye boolean flag.
- **Methods:**
  - `_login()`: Email aur password validate karta hai. Khali hone par `CustomAlertBox.showWarning()` dikhata hai. Firebase error aane par `CustomAlertBox.showError()` me readable error throw karta hai.
  - `_loginWithGoogle()`: Google button click par `_authService.signInWithGoogle()` trigger karta hai.
- **UI Components:**
  - Email TextField (Email icon & validation).
  - Password TextField (Obscured text & lock icon).
  - Login Button & Google Sign-In Outlined Button.
  - Navigation link jo user ko `RegisterScreen` par bhejti hai.
  - Responsive box (`ConstrainedBox(maxWidth: 400)`) jo Mobile aur Web/Desktop dono par perfect dikhta hai.

---

### 7. `lib/screens/register_screen.dart`
**Uddeshya (Purpose):** Naye user ke registration / sign up ke liye dedicated screen.

- **Controllers & State:**
  - `_emailController`, `_passwordController`, `_confirmPasswordController`.
  - `_isLoading` flag.
- **Methods:**
  - `_register()`: Check karta hai ki sabhi fields filled hain aur `password == confirmPassword`. Valid hone par `signUpWithEmail()` call karta hai.
  - `_registerWithGoogle()`: Google se direct sign-up enable karta hai.
- **UI Components:**
  - 3 Input fields (Email, Password, Confirm Password).
  - Register button aur Google Sign-In button.
  - 'Already have an account? Login' button jo screen ko pop karke wapas login screen par le jata hai.

---

### 8. `lib/screens/home_screen.dart`
**Uddeshya (Purpose):** Login hone ke baad user ko welcome karne wali dashboard/home screen.

- **Features & UI:**
  - **AppBar:** App title aur top-right corner me **Logout Action Button**.
  - **Welcome Message:** `user?.displayName ?? user?.email` se dynamic welcome text display karta hai.
  - **Action Buttons:**
    - `View Profile`: User ko `ProfileScreen` par navigate karta hai.
    - `Logout`: `AuthService().signOut()` call karta hai jisse `AuthWrapper` automatically user ko Login screen par redirect kar deta hai.

---

### 9. `lib/screens/profile_screen.dart`
**Uddeshya (Purpose):** Logged-in user ki details aur metadata display karne wali screen.

- **Displayed Information:**
  - **Avatar (`CircleAvatar`):** Agar Google user ka photoURL available hai toh `NetworkImage` se photo dikhata hai, warna default person icon.
  - **Display Name:** User ka poora naam (agar available ho).
  - **Email ID:** User ka registered email address.
  - **User UID:** Firebase security identifier (`user.uid`).
  - **Logout Button:** Sign out karke app ke root screen par redirect karta hai.

---

## ⚙️ GitHub Actions CI/CD (`.github/workflows/build.yml`)

Project me automated build pipeline setup kiya gaya hai jo har code push ya manual trigger par **Android `.apk`** aur **iOS `.ipa`** generate karta hai.

### 📄 Workflow File: `.github/workflows/build.yml`

```yaml
name: Build Flutter APK & IPA

on:
  push:
    branches: [ main, master ]
  pull_request:
    branches: [ main, master ]
  workflow_dispatch: # Allows manual one-click trigger from GitHub Actions UI

jobs:
  # ==========================================
  # 1. Android APK Build Job
  # ==========================================
  build-apk:
    name: Build Android APK
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository Code
        uses: actions/checkout@v4

      - name: Setup Java JDK 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'

      - name: Setup Flutter Environment
        uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
          cache: true

      - name: Install Dependencies
        run: flutter pub get

      - name: Compile Release APK
        run: flutter build apk --release

      - name: Upload Android APK
        uses: actions/upload-artifact@v4
        with:
          name: Android-Release-APK
          path: build/app/outputs/flutter-apk/app-release.apk
          retention-days: 14

  # ==========================================
  # 2. iOS IPA Build Job
  # ==========================================
  build-ipa:
    name: Build iOS IPA
    runs-on: macos-latest # 👈 Utilizes cloud-hosted Apple Mac hardware

    steps:
      - name: Checkout Repository Code
        uses: actions/checkout@v4

      - name: Setup Flutter Environment
        uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
          cache: true

      - name: Install Dependencies
        run: flutter pub get

      - name: Build iOS Application (Unsigned)
        run: flutter build ios --release --no-codesign

      - name: Package Payload into Installable .ipa
        run: |
          mkdir -p Payload
          cp -r build/ios/iphoneos/Runner.app Payload/
          zip -r app-release-unsigned.ipa Payload

      - name: Upload iOS IPA
        uses: actions/upload-artifact@v4
        with:
          name: iOS-Release-IPA
          path: app-release-unsigned.ipa
          retention-days: 14
```

### 📥 GitHub se APK aur IPA Kaise Download Karein:
1. Apne GitHub repository me jayein.
2. **"Actions"** tab par click karein.
3. Left side me **"Build Flutter APK & IPA"** workflow select karein.
4. **"Run workflow"** button par click karein (ya code push karein).
5. Workflow complete hone ke baad run details me neeche **Artifacts** section me aapko:
   - 📦 `Android-Release-APK` (Android `.apk` file)
   - 📦 `iOS-Release-IPA` (iOS `.ipa` package)
   download ke liye mil jayenge.

---

## 🚀 How to Run Locally

### Prerequisites:
- Flutter SDK (version ^3.10.4 ya latest stable)
- Java 17 (Android ke liye)
- Xcode (iOS ke liye, macOS only)
- Chrome browser (Web testing ke liye)

### Steps:
1. **Dependencies install karein:**
   ```bash
   flutter pub get
   ```

2. **App run karein:**
   - **Chrome Web:**
     ```bash
     flutter run -d chrome
     ```
   - **Android Device / Emulator:**
     ```bash
     flutter run -d android
     ```
   - **Windows Desktop:**
     ```bash
     flutter run -d windows
     ```

3. **Production Builds Manually Create Karna:**
   - **Android APK:**
     ```bash
     flutter build apk --release
     ```
   - **Android App Bundle:**
     ```bash
     flutter build appbundle --release
     ```
   - **iOS (macOS only):**
     ```bash
     flutter build ios --release --no-codesign
     ```
