import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import '../widgets/theme_info_card.dart';
import '../widgets/image_grid.dart';
import '../widgets/image_selector_card.dart';
import '../widgets/animated_theme_switcher.dart';

/// The main page of the app, displaying theme info and image picker.
class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<File> _selectedImages = [];
  List<Uint8List> _webImageBytesList = [];
  final ImagePicker _picker = ImagePicker();
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Picks an image from the camera.
  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _webImageBytesList.add(bytes);
          });
        } else {
          setState(() {
            _selectedImages.add(File(image.path));
          });
        }
        // Removed success notification
      }
    } catch (e) {
      _showSnackBar('❌ Error accessing camera: $e', Colors.red);
    }
  }

  /// Picks an image from the gallery.
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _webImageBytesList.add(bytes);
          });
        } else {
          setState(() {
            _selectedImages.add(File(image.path));
          });
        }
        // Removed success notification
      }
    } catch (e) {
      _showSnackBar('❌ Error accessing gallery: $e', Colors.red);
    }
  }

  /// Shows a dialog to select the image source.
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(
                Icons.add_a_photo,
                color: widget.isDarkMode ? Colors.white : Color(0xFF7C3AED),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Select Image Source',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Color(0xFF7C3AED)
                          : Color(0xFFF3E8FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: widget.isDarkMode
                          ? Colors.white
                          : Color(0xFF7C3AED),
                    ),
                  ),
                  title: const Text('Camera'),
                  subtitle: const Text('Take a new photo'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageFromCamera();
                  },
                ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? Color(0xFF8B5CF6)
                        : Color(0xFFE9D5FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.photo_library,
                    color: widget.isDarkMode ? Colors.white : Color(0xFF7C3AED),
                  ),
                ),
                title: const Text('Gallery'),
                subtitle: const Text('Choose from existing photos'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: widget.isDarkMode
                      ? Colors.grey[400]
                      : Colors.grey[600],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Shows a [SnackBar] with the given [message] and [color].
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              color == Colors.green ? Icons.check_circle : Icons.error,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        elevation: 8,
      ),
    );
  }

  /// Removes the selected image.
  void _removeImageAt(int index) {
    setState(() {
      if (kIsWeb) {
        _webImageBytesList.removeAt(index);
      } else {
        _selectedImages.removeAt(index);
      }
    });
    // Removed success notification
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? Color(0xFF000000)
          : Color(0xFFe8eaed),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.photo_camera, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            const Text(
              'Theme Image App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isDarkMode
                  ? [Color(0xFF232526), Color(0xFF414345)]
                  : [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          AnimatedThemeSwitcher(
            isDarkMode: widget.isDarkMode,
            onThemeToggle: widget.onThemeToggle,
            animationController: _animationController,
            scaleAnimation: _scaleAnimation,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: widget.isDarkMode
                ? [Color(0xFF000000), Color(0xFF0a0a0a)]
                : [Color(0xFFe8eaed), Color(0xFFd1d5db)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ThemeInfoCard(isDarkMode: widget.isDarkMode),
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWide = constraints.maxWidth > 600;
                    Widget collageWidget = ImageGrid(
                      isDarkMode: widget.isDarkMode,
                      selectedImages: _selectedImages,
                      webImageBytesList: _webImageBytesList,
                      onRemoveImage: _removeImageAt,
                    );
                    Widget selectCard = ImageSelectorCard(
                      isDarkMode: widget.isDarkMode,
                      onSelectImage: _showImageSourceDialog,
                      isWide: isWide,
                    );
                    return isWide
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: collageWidget),
                              Expanded(flex: 2, child: selectCard),
                            ],
                          )
                        : Column(children: [collageWidget, selectCard]);
                  },
                ),
                // Add extra padding at bottom to ensure gradient covers all pixels
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
