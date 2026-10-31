<div align="center">

# 💳 Bank & Neo-Wallet UI
### Interactive Fintech Flow, Unbounded Layout Resolution & Controller Architecture

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Domain](https://img.shields.io/badge/Fintech-Digital_Banking_UI-10B981?style=for-the-badge)](https://flutter.dev)
[![State](https://img.shields.io/badge/Controller-PageView_Callbacks-4F46E5?style=for-the-badge)](https://flutter.dev)

<p align="center">
  A modern digital banking and card management mobile interface combining continuous swipe navigation, custom transaction receipts, and nested scroll boundary stabilization.
</p>

</div>

---

## 📱 App in Action

<div align="center">

<!-- GitHub Native Playable Video -->
https://github.com/user-attachments/assets/89010351-75ed-4392-b571-564ca2d09b4f

<p align="center">
  <a href="https://github.com/user-attachments/assets/89010351-75ed-4392-b571-564ca2d09b4f" target="_blank">
    <img src="https://img.shields.io/badge/▶️_Open_Full_Video-Wallet_Demo-10B981?style=for-the-badge&logo=quicktime&logoColor=white" alt="Open Video" />
  </a>
</p>

</div>

---

## 📌 Architectural Overview

Fintech applications require responsive visual balance: quick card balance switching, immediate transaction history scanning, and frictionless multi-step checkout sequences.

This project was built to practice coordinating multiple layout systems—resolving common Flutter layout boundary constraints, handling controller delegation down widget trees, and parsing asynchronous user picker inputs into styled confirmation cards.

---

## 🏛️ Engineering & Layout Highlights

### 1. 📲 Master Swipe Controller (`PageView` Delegation)
* Replaced abrupt route navigation with a continuous, horizontal `PageView` linking *Onboarding*, *Account Dashboard*, and *Payment Checkout*.
* Implemented parent-to-child controller reference delegation: child trigger buttons invoke transitions on the root `PageController` via explicit callback channels.

### 2. 🛡️ Resolving Unbounded Height Layout Crashes
* Solved Flutter's common `RenderBox was not laid out` / `unbounded height` constraint conflict when nesting vertical transaction histories inside scrollable dashboard columns.
* Implemented explicit `shrinkWrap: true` viewport boundaries paired with `NeverScrollableScrollPhysics()`, handing gesture control cleanly to the primary scroll parent.

### 3. 🧾 Asynchronous Receipt Dialogs & Native Pickers
* Built custom modal confirmation receipts that intercept asynchronous futures from native date/time pickers.
* Safely maps formatted timestamp strings and transaction amounts directly onto dynamic, print-ready receipt cards.

### 4. 🎨 Micro-Interactions & Financial Presentation
* Clean card hierarchy featuring quick-action utility hubs (Transfer, Pay, Analytics).
* High-contrast credit card assets with smooth shadow depths and balanced typography.

---

## 🛠️ Tech Stack & Patterns
* **Framework:** Flutter
* **Language:** Dart
* **Core Widgets:** `PageView`, `PageController`, `ListView.builder`, `TextFormField`, `showDatePicker`
* **Layout Solutions:** Scroll boundary constraints resolution, explicit physics decoupling, custom callback architecture.

---

<div align="center">
  <sub>Engineered by <b>Laiba Nur</b> • Specialized in Flutter, Riverpod & Mobile Architecture</sub>
</div>
