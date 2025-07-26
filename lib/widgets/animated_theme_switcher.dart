import 'package:flutter/material.dart';

/// An animated theme switcher widget for the app bar.
class AnimatedThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;
  final AnimationController animationController;
  final Animation<double> scaleAnimation;

  const AnimatedThemeSwitcher({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
    required this.animationController,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => animationController.forward(),
      onTapUp: (_) => animationController.reverse(),
      onTapCancel: () => animationController.reverse(),
      onTap: onThemeToggle,
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: isDarkMode
                    ? LinearGradient(
                        colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isDarkMode ? null : Colors.white,
                border: isDarkMode
                    ? null
                    : Border.all(color: Color(0xFF8B5CF6), width: 2),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.purple.withOpacity(0.3)
                        : Color(0xFF8B5CF6).withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: onThemeToggle,
                  borderRadius: BorderRadius.circular(25),
                  splashColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.white.withOpacity(0.1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated icon with proper centering
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 700),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                    return RotationTransition(
                                      turns: animation,
                                      child: ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                              child: Icon(
                                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                key: ValueKey(isDarkMode),
                                color: isDarkMode
                                    ? Colors.white
                                    : Color(0xFF8B5CF6),
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Text with better typography and proper overflow handling
                        SizedBox(
                          width: 38, // Enough for 'Light'
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 700),
                            child: Text(
                              isDarkMode ? 'Light' : 'Dark',
                              key: ValueKey(isDarkMode),
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Color(0xFF8B5CF6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                height: 1.2,
                              ),
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
