import 'package:flutter/material.dart';

/// A card widget that displays current theme information.
class ThemeInfoCard extends StatelessWidget {
  final bool isDarkMode;

  const ThemeInfoCard({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shadowColor: isDarkMode ? Colors.black54 : Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Color(0xFF1a1a1a), Color(0xFF0a0a0a)]
                : [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black38 : Colors.blue.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // Animated icon with glow effect
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Color(0xFF8B5CF6).withOpacity(0.2)
                    : Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Color(0xFF8B5CF6).withOpacity(0.3)
                        : Colors.white.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  key: ValueKey(isDarkMode),
                  size: 40,
                  color: isDarkMode ? Color(0xFF8B5CF6) : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Theme status text
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                isDarkMode ? 'Dark Mode Active' : 'Light Mode Active',
                key: ValueKey(isDarkMode),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Removed the description text here
            const SizedBox(height: 16),

            // Theme indicator bar
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isDarkMode
                        ? 0
                        : MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isDarkMode
                        ? MediaQuery.of(context).size.width * 0.3
                        : 0,
                    decoration: BoxDecoration(
                      color: Color(0xFF8B5CF6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
