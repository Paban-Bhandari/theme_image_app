# Theme Image App

A modern Flutter application that combines theme switching functionality with image picking capabilities. The app features a beautiful, responsive design with smooth animations and supports both web and mobile platforms.

## Features

### 🎨 Theme Management
- **Dark/Light Mode Toggle**: Smooth animated theme switching
- **Persistent Theme State**: Theme preference is maintained across app sessions
- **Beautiful Gradients**: Custom gradient backgrounds that adapt to theme changes
- **Animated Theme Switcher**: Interactive button with scale animations

### 📸 Image Management
- **Multi-Source Image Picking**: Select images from camera or gallery
- **Cross-Platform Support**: Works seamlessly on web, Android, and iOS
- **Image Grid Display**: Responsive grid layout for selected images
- **Image Removal**: Easy deletion of selected images with visual feedback
- **Image Optimization**: Automatic resizing and quality optimization

### 🎯 User Experience
- **Responsive Design**: Adapts to different screen sizes and orientations
- **Smooth Animations**: Fluid transitions and micro-interactions
- **Modern UI**: Material Design 3 principles with custom styling
- **Accessibility**: Proper contrast ratios and touch targets

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   └── home_screen.dart      # Main screen with theme and image functionality
├── widgets/
│   ├── animated_theme_switcher.dart  # Theme toggle button
│   ├── image_grid.dart              # Image display grid
│   ├── image_selector_card.dart     # Image selection interface
│   └── theme_info_card.dart         # Theme information display
├── services/
│   └── image_service.dart    # Image picking and processing logic
├── providers/
│   └── theme_provider.dart   # Theme state management
└── utils/
    └── app_constants.dart    # App-wide constants and helpers
```

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd theme_image_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android
- Ensure you have Android SDK installed
- Grant camera and storage permissions when prompted

#### iOS
- Ensure you have Xcode installed
- Add camera and photo library usage descriptions in `Info.plist`

#### Web
- No additional setup required
- Camera functionality is limited on web browsers

## Dependencies

- **image_picker**: ^1.0.4 - For camera and gallery access
- **flutter**: SDK - Core Flutter framework
- **cupertino_icons**: ^1.0.8 - iOS-style icons

## Architecture

The app follows a clean architecture pattern with:

- **Separation of Concerns**: UI, business logic, and data layers are separated
- **Widget Composition**: Reusable, modular widgets
- **Service Layer**: Dedicated services for external operations
- **Constants Management**: Centralized configuration and styling

## Future Enhancements

- [ ] **State Management**: Implement Provider/Riverpod for better state management
- [ ] **Image Editing**: Add basic image editing capabilities
- [ ] **Cloud Storage**: Integrate with cloud storage services
- [ ] **Image Sharing**: Add social media sharing functionality
- [ ] **Advanced Themes**: More theme options and customization
- [ ] **Image Filters**: Apply filters and effects to images
- [ ] **Batch Operations**: Select and manage multiple images at once

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you encounter any issues or have questions, please open an issue on the repository.
