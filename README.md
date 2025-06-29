# Saarthi App 🚩

A demo-ready Flutter app for accessible place discovery, built for portfolio and resume showcase.  
**No backend required – all features work with in-memory mock data!**

---

## ✨ Features

- **Add Accessible Place:**  
  Add new places (Ramp, Elevator, Washroom) with features, image, and location.

- **Home Screen:**  
  See all places in a beautiful list with images and accessibility features.

- **Map View:**  
  Google Map with colored markers for each place type.

- **Place Details:**  
  Full details, features, and a "Navigate" button (opens Google Maps).

- **Profile:**  
  Mock user info, contributions, and saved places.

- **Settings:**  
  Dark mode & large text toggles (Provider-based, instant effect).

- **Modern UX:**  
  Form validation, image placeholders, Hero animation, and more.

---

## 🧑‍💻 How to Run

1. **Clone the repo:**
   ```sh
   git clone https://github.com/yogendra-27-bhange/saarthi-app.git
   cd saarthi-app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

4. **Build APK:**
   ```sh
   flutter build apk --release
   ```
   - Find your APK at: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📱 Screenshots

(Add your app screenshots here for best impact!)

---

## 📝 About

This app is for demo/portfolio purposes.  
All data is mock/in-memory, so you can showcase the full user flow without any backend setup.

---

## How to add Android and iOS folders if missing

If you see errors like `Seems that "android" folder does not exist` during build (e.g., on Codemagic or CI/CD), it means your project is missing the required platform folders.

To generate them, run this command in your project root:

```
flutter create --platforms=android,ios .
```

This will add the necessary `android` and `ios` folders to your Flutter project. Make sure to commit these folders to your repository so that online build tools can find them.

If you cannot run this command locally, ask a team member with Flutter installed to do it, or use a CI/CD step that runs this command before building.

---
## 🚧 Project Status: On Hold

This project is currently **on hold** due to  limited testing infrastructure.  

I’ve built a solid foundation including the complete UI, authentication flow, and Firebase-ready structure.  
However, due to the lack of advanced testing tools and production-level devices, I’ve decided to pause active development.

I plan to revisit this project in the future with fresh improvements, real-time data handling, and community feedback.

---
