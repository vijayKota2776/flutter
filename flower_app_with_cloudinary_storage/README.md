# 🌸 Flower App with Cloudinary Storage & Firebase Firestore

A complete Flutter CRUD application for managing flower catalog items. It uses **Firebase Cloud Firestore** for real-time database management and **Cloudinary REST API** for 100% free image and PDF document uploads, storage, and deletion (as a free alternative to paid Firebase Storage).

---

## 📑 Table of Contents
1. [Project Overview & Architecture](#-project-overview--architecture)
2. [Folder & File Structure](#-folder--file-structure)
3. [Deep-Dive Explanation of All `lib/` Files](#-deep-dive-explanation-of-all-lib-files)
   - [`lib/main.dart`](#1-libmaindart)
   - [`lib/firebase_options.dart`](#2-libfirebase_optionsdart)
   - [`lib/models/flower_model.dart`](#3-libmodelsflower_modeldart)
   - [`lib/screens/flower_list.dart`](#4-libscreensflower_listdart)
   - [`lib/screens/add_flower.dart`](#5-libscreensadd_flowerdart)
   - [`lib/screens/update_flower.dart`](#6-libscreensupdate_flowerdart)
   - [`lib/screens/flower_detail_view.dart`](#7-libscreensflower_detail_viewdart)
   - [`lib/services/cloudinary_config.dart`](#8-libservicescloudinary_configdart)
   - [`lib/services/cloudinary_service.dart`](#9-libservicescloudinary_servicedart)
   - [`lib/services/firebase_service.dart`](#10-libservicesfirebase_servicedart)
   - [`lib/utils/custom_alert_box.dart`](#11-libutilscustom_alert_boxdart)
4. [CI/CD (.github/workflows/build.yml)](#-cicd-github-actions)
5. [Setup & Running Instructions](#-setup--running-instructions)

---

## 🏗️ Project Overview & Architecture

The app follows a clean, modular architecture:
- **UI / Presentation Layer (`lib/screens/` & `lib/utils/`)**: Stateful and Stateless widgets handling user interactions, form inputs, animations, and custom feedback dialogs.
- **Model Layer (`lib/models/`)**: Strongly typed data models with serialization/deserialization methods from Firestore snapshots.
- **Service Layer (`lib/services/`)**: Encapsulates external API communication (Cloudinary REST API multipart upload and SHA-1 signed delete) and Firestore real-time CRUD operations.

```
       +---------------------------------------------+
       |                  UI Screens                 |
       | (FlowerList, AddFlower, UpdateFlower, Detail)|
       +----------------------+----------------------+
                              |
                     Calls Services
                              |
       +----------------------+----------------------+
       |                  Services                   |
       |   FirebaseService    <--->  CloudinaryService|
       +----------+-----------------------+----------+
                  |                       |
        Firestore CRUD              HTTP REST Upload
                  |                       |
                  v                       v
       [ Firebase Firestore ]      [ Cloudinary CDN ]
```

---

## 📂 Folder & File Structure

```
lib/
├── firebase_options.dart          # Firebase configuration for Web, Android, & iOS
├── main.dart                      # App entry point, Material3 theme & named routes
│
├── models/
│   └── flower_model.dart          # Flower data model class & Firestore converter
│
├── screens/
│   ├── flower_list.dart           # Home screen: Real-time list, delete & navigate
│   ├── add_flower.dart            # Add flower form: image & PDF picker + upload
│   ├── update_flower.dart         # Edit flower form: update fields & replace files
│   └── flower_detail_view.dart    # Detail screen: image banner & PDF launcher
│
├── services/
│   ├── cloudinary_config.dart     # Cloudinary API credentials & preset config
│   ├── cloudinary_service.dart    # Cloudinary HTTP client (upload & SHA-1 delete)
│   └── firebase_service.dart      # Firestore database operations (Stream/Add/Edit/Del)
│
└── utils/
    └── custom_alert_box.dart      # Reusable modern dialogs (Success, Error, Warning, Info)
```

---

## 🔍 Deep-Dive Explanation of All `lib/` Files

---

### 1. `lib/main.dart`
**File Path**: [`lib/main.dart`](file:///lib/main.dart)

#### 🎯 Purpose:
Application ka entry point jahan se app start hoti hai, Firebase initialize hota hai, global theme set hoti hai aur page navigation routes define hote hain.

#### 📝 Code Breakdown & Logic:
- **`void main() async`**:
  - `WidgetsFlutterBinding.ensureInitialized()` call karta hai taaki async code (`Firebase.initializeApp`) chalne se pehle Flutter engine ready ho jaye.
  - `DefaultFirebaseOptions.currentPlatform` use karke Firebase initialize karta hai.
  - `runApp(const FlowerApp())` call karke main widget render karta hai.
- **`FlowerApp` (StatelessWidget)**:
  - `MaterialApp` widget return karta hai.
  - **Theme Configuration**: Material 3 enabled (`useMaterial3: true`) with `Colors.teal` seed color aur custom `AppBar` / `FloatingActionButton` styling.
  - **Named Routes (`routes`)**:
    - `'/'`: [FlowerListScreen](file:///lib/screens/flower_list.dart) (Home Screen)
    - `'/add'`: [AddFlowerScreen](file:///lib/screens/add_flower.dart) (Naya flower add karne ke liye)
    - `'/update'`: [UpdateFlowerScreen](file:///lib/screens/update_flower.dart) (Arguments se `Flower` object receive karta hai)
    - `'/detail'`: [FlowerDetailView](file:///lib/screens/flower_detail_view.dart) (Arguments se `Flower` object receive karta hai)

---

### 2. `lib/firebase_options.dart`
**File Path**: [`lib/firebase_options.dart`](file:///lib/firebase_options.dart)

#### 🎯 Purpose:
Firebase CLI dwara automatically generate ki gayi configuration file jisme Android, iOS aur Web platforms ke liye Firebase Project keys (API Key, App ID, Project ID, Messaging Sender ID) store hoti hain.

#### 📝 Code Breakdown & Logic:
- **`DefaultFirebaseOptions.currentPlatform`**:
  - Platform detection logic (`kIsWeb`, `TargetPlatform.android`, `TargetPlatform.iOS`).
  - Running device ke according correct `FirebaseOptions` object return karta hai.
- **Static Configurations**:
  - `web`: Web browser execution ke liye Firebase configuration.
  - `android`: Android app ke liye credentials.
  - `ios`: iOS app ke liye credentials.

---

### 3. `lib/models/flower_model.dart`
**File Path**: [`lib/models/flower_model.dart`](file:///lib/models/flower_model.dart)

#### 🎯 Purpose:
Application ke core data structure (Flower object) ko define karta hai aur Firestore ke JSON/Map data ko strongly-typed Dart model me convert karta hai.

#### 📝 Code Breakdown & Logic:
- **Attributes**:
  - `String id`: Firestore Document ID.
  - `String name`: Flower ka naam.
  - `String description`: Flower ki detail / description.
  - `String imageUrl`: Cloudinary se mili image URL.
  - `String pdfUrl`: Cloudinary se mili PDF document URL.
  - `String pdfFileName`: Upload kiye gaye PDF file ka original naam.
  - `DateTime? createdAt`: Record banne ka timestamp.
- **`Flower.fromFirestore(DocumentSnapshot doc)` (Factory Constructor)**:
  - Firestore snapshot se Map data nikalta hai (`doc.data()`).
  - Firestore ke `Timestamp` ko Dart ke standard `DateTime` me convert karta hai.
  - Null-safety checks ke sath safe defaults (`''`) provide karta hai taaki app crash na ho.

---

### 4. `lib/screens/flower_list.dart`
**File Path**: [`lib/screens/flower_list.dart`](file:///lib/screens/flower_list.dart)

#### 🎯 Purpose:
App ki Home Screen jisme Firestore se real-time flower items ki list show hoti hai. User items dekh sakta hai, edit kar sakta hai, delete kar sakta hai ya detail view me jaa sakta hai.

#### 📝 Code Breakdown & Logic:
- **`StreamBuilder<List<Flower>>`**:
  - `FirebaseService().getFlowersStream()` ko listen karta hai.
  - Jab bhi Firestore me koi item add/edit/delete hota hai, UI bina page reload kiye automatically update ho jata hai.
  - **States handled**: Loading spinner (`CircularProgressIndicator`), Error state, Empty list message (`No flowers yet`), aur Loaded list.
- **`ListView.builder`**:
  - List items ko render karta hai:
    - **`leading`**: `CircleAvatar` me flower ki image show karta hai (agar image na ho to default icon).
    - **`title`**: Flower ka naam.
    - **`subtitle`**: Description text with single line ellipsis.
    - **`trailing`**: Edit button (`/update` route par bhejta hai) aur Delete button.
    - **`onTap`**: Item par click karne se `/detail` route open hota hai.
- **`_handleDelete(BuildContext context, Flower flower)`**:
  - Firestore aur Cloudinary dono se flower aur uski files delete karta hai.
  - User ko `CustomAlertBox.showSuccess` ya `CustomAlertBox.showError` se feedback deta hai.
- **`FloatingActionButton`**:
  - `+` icon button jo user ko `/add` screen par navigate karta hai.

---

### 5. `lib/screens/add_flower.dart`
**File Path**: [`lib/screens/add_flower.dart`](file:///lib/screens/add_flower.dart)

#### 🎯 Purpose:
Naya flower add karne ka form. Isme user Flower Name, Description input karta hai aur Image/PDF choose karke upload karta hai.

#### 📝 Code Breakdown & Logic:
- **State Variables**:
  - `TextEditingController _nameController, _descController`: Input text field values handle karne ke liye.
  - `PlatformFile? _pickedImage, _pickedPdf`: Selected image aur PDF file store karne ke liye.
  - `bool _isLoading`: Save processing ke dauran loading indicator dikhane ke liye.
- **File Picking (`_pickImage()` / `_pickPdf()`)**:
  - `file_picker` package use karta hai with `withData: true` (taaki Web aur Desktop par memory bytes aur Mobile par direct file paths dono support ho sakein).
- **`_saveFlower()` Method**:
  - Validation check karta hai (Name aur Description empty nahi hone chahiye).
  - Web vs Mobile compatibility handle karta hai (`kIsWeb` check karke `File` ya `Uint8List bytes` pass karta hai).
  - `FirebaseService().addFlower(...)` call karta hai jo pehle Cloudinary me upload karta hai aur phir Firestore me entry create karta hai.
  - Success hone par `Navigator.pop(context)` se wapas list screen par le jata hai.

---

### 6. `lib/screens/update_flower.dart`
**File Path**: [`lib/screens/update_flower.dart`](file:///lib/screens/update_flower.dart)

#### 🎯 Purpose:
Existing flower ko edit / update karne ka form. Isme purana data pre-filled aata hai, aur user chahe to details change kar sakta hai ya new Image / PDF replace kar sakta hai.

#### 📝 Code Breakdown & Logic:
- **`initState()`**:
  - `widget.flower.name` aur `widget.flower.description` se text controllers ko initialize karta hai.
- **File Replacement Logic**:
  - User chahe to sirf text change kare, ya nayi image/PDF select kare.
  - Button text dynamically change hota hai (e.g. "Change Image" ya "New Image: xyz.jpg").
- **`_updateFlower()` Method**:
  - `FirebaseService().updateFlower(...)` call karta hai.
  - Agar user ne nayi file upload ki hai, to backend me purani Cloudinary file delete ho jati hai aur nayi file upload ho kar Firestore update hota hai.
  - Operation complete hone ke baad user ko list screen par wapas bhejta hai.

---

### 7. `lib/screens/flower_detail_view.dart`
**File Path**: [`lib/screens/flower_detail_view.dart`](file:///lib/screens/flower_detail_view.dart)

#### 🎯 Purpose:
Flower ki complete detail screen jisme badi banner image, title, complete description aur attached PDF document ko open karne ka button milta hai.

#### 📝 Code Breakdown & Logic:
- **UI Elements**:
  - **Banner Image**: `Image.network` with rounded borders (`ClipRRect`) aur `BoxFit.cover`.
  - **Text Information**: Styled Title and full Description.
  - **PDF Button**: Agar `flower.pdfUrl` present hai, to ek red PDF icon button render hota hai with actual file name.
- **`_openPdf(BuildContext context, String url)`**:
  - `url_launcher` package ka use karta hai.
  - `launchUrl(uri, mode: LaunchMode.externalApplication, webOnlyWindowName: '_blank')` se PDF ko device ke default PDF viewer ya browser me open karta hai.

---

### 8. `lib/services/cloudinary_config.dart`
**File Path**: [`lib/services/cloudinary_config.dart`](file:///lib/services/cloudinary_config.dart)

#### 🎯 Purpose:
Cloudinary REST API ke configuration parameters aur credentials ko ek jagah maintain karne ke liye central config class.

#### 📝 Code Breakdown & Logic:
- `static const String cloudName`: Aapka Cloudinary cloud account name (`dilaghfpg`).
- `static const String uploadPreset`: Unsigned upload preset identifier (`flower_app`).
- `static const String apiKey`: Cloudinary API Key (authenticated deletions ke liye).
- `static const String apiSecret`: Cloudinary API Secret (SHA-1 signature generate karne ke liye).

---

### 9. `lib/services/cloudinary_service.dart`
**File Path**: [`lib/services/cloudinary_service.dart`](file:///lib/services/cloudinary_service.dart)

#### 🎯 Purpose:
Cloudinary REST API ke sath direct communication engine. Yeh files ko bina kisi bulky third-party SDK ke lightweight HTTP multipart requests ke zariye upload aur delete karta hai.

#### 📝 Code Breakdown & Logic:
- **`upload({File? file, Uint8List? bytes, String? name, String type = 'auto'})`**:
  - Endpoint: `https://api.cloudinary.com/v1_1/{cloudName}/{type}/upload`
  - `http.MultipartRequest('POST', ...)` banata hai with `upload_preset`.
  - **Cross-platform**: Agar `bytes` available hain (Web/Memory) to `MultipartFile.fromBytes` use karta hai, warna `MultipartFile.fromPath` (Android/iOS).
  - Response se `secure_url` (HTTPS link) extract karke return karta hai.
- **`delete(String url)`**:
  - Jab koi flower delete ya update hota hai, Cloudinary storage se purani file remove karne ke liye.
  - URL se `public_id` aur file type (`raw` ya `image`) extract karta hai.
  - Current timestamp aur API Secret ke sath **SHA-1 signature** create karta hai:
    `sha1(public_id=...&timestamp=...{apiSecret})`
  - Cloudinary destroy endpoint (`/destroy`) par authenticated POST request bhej kar file delete karta hai.

---

### 10. `lib/services/firebase_service.dart`
**File Path**: [`lib/services/firebase_service.dart`](file:///lib/services/firebase_service.dart)

#### 🎯 Purpose:
Backend coordination service jo Firebase Firestore database aur Cloudinary media storage ke beech business logic ko orchestrate karti hai.

#### 📝 Code Breakdown & Logic:
- **`_db`**: `FirebaseFirestore.instance.collection('flowers')` reference.
- **`getFlowersStream()`**:
  - Firestore se flowers ko `createdAt` descending order me stream karta hai.
  - Snapshots ko `Flower.fromFirestore` mapper ke through `List<Flower>` me map karta hai.
- **`addFlower(...)`**:
  - Pehle Image ko `type: 'image'` aur PDF ko `type: 'raw'` se Cloudinary par upload karta hai.
  - Cloudinary se mili URLs aur text details ko `_db.add(...)` ke through Firestore document me save karta hai with `FieldValue.serverTimestamp()`.
- **`updateFlower(...)`**:
  - Agar nayi image/PDF aayi hai, to purani file Cloudinary se delete karta hai aur nayi upload karta hai.
  - Updated fields ko `_db.doc(id).update(...)` se Firestore me update karta hai.
- **`deleteFlower(Flower flower)`**:
  - Firestore document ko delete karta hai (`_db.doc(flower.id).delete()`).
  - Us flower ke associated image aur PDF dono ko Cloudinary se permanently remove karta hai.

---

### 11. `lib/utils/custom_alert_box.dart`
**File Path**: [`lib/utils/custom_alert_box.dart`](file:///lib/utils/custom_alert_box.dart)

#### 🎯 Purpose:
Poori application ke liye ek standardized, beautiful aur modern popup dialog utility widget jo user ko actions ka visual feedback deta hai.

#### 📝 Code Breakdown & Logic:
- **Static Helper Methods**:
  - `showSuccess(context, title, message)`: Green themed dialog with check circle icon.
  - `showError(context, title, message)`: Red themed dialog with error icon.
  - `showWarning(context, title, message)`: Orange themed dialog with warning icon.
  - `showInfo(context, title, message)`: Blue themed dialog with info icon.
- **`_showAlert(...)`**:
  - Reusable private method jo `showDialog` ke andar `AlertDialog` banata hai.
  - Rounded corners (`BorderRadius.circular(15)`), custom background tint, centered icon, title, message aur custom styled "OK" action button provide karta hai.

---

## ⚙️ CI/CD (GitHub Actions)

A automated CI/CD pipeline is configured in [`.github/workflows/build.yml`](file:///.github/workflows/build.yml):

- **Android Build Job (`build-android`)**:
  - Runs on `ubuntu-latest`.
  - Sets up Java 17 & Flutter Stable channel.
  - Builds Release APK (`flower-app-release-apk`) and Release App Bundle (`flower-app-release-aab`).
- **iOS Build Job (`build-ios`)**:
  - Runs on `macos-latest`.
  - Builds iOS bundle (`--no-codesign`) and packages it into `flower-app-release-ipa`.
- **Download Artifacts**:
  - Build complete hone ke baad GitHub repository ke **Actions** tab se `.apk` aur `.ipa` download kiye jaa sakte hain.

---

## 🚀 Setup & Running Instructions

1. **Clone & Get Packages**:
   ```bash
   flutter pub get
   ```

2. **Run the App**:
   ```bash
   flutter run
   ```

3. **Build APK locally**:
   ```bash
   flutter build apk --release
   ```
