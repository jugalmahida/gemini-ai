import 'package:flutter/material.dart';
import 'package:gemini/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _aniController;

  @override
  void initState() {
    _aniController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Start the animation
    _aniController.repeat();

    super.initState();
    // Navigate to home after delay
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo/Icon
            RotationTransition(
              turns: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(_aniController),
              child: Image.asset(
                "assets/images/gemini_logo.png",
                scale: 2,
              ),
            ),
            SizedBox(height: 24),
            // App Name
            Text(
              'Gemini Mind',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),

            // Tagline
            Text(
              'Powered by AI',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40),

            // Loading indicator
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            // ),
          ],
        ),
      ),
    );
  }
}
