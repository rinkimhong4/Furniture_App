import 'package:flutter/material.dart';
import 'package:furniture_app/core/data/app_data.dart';
import 'package:furniture_app/views/home/home_screen.dart';
import 'package:furniture_app/widgets/smartImage.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => _currentPage == AppData.onboardingData.length - 1;

  void _goToNext() {
    if (!_isLastPage) {
      _pageController.nextPage(
        duration: AppData.pageAnimation,
        curve: Curves.easeInOutCubic,
      );
    } else {
      // Navigate to HomeScreen and remove onboarding from stack
      Get.off(HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppData.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.off(HomeScreen()),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black54,
                    textStyle: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Skip'),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: AppData.onboardingData.length,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemBuilder: (context, index) {
                  final data = AppData.onboardingData[index];
                  return OnboardContent(
                    illustration: data['image'] as String,
                    title: data['title'] as String,
                    description: data['text'] as String,
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: AppData.onboardingData.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 16,
                  activeDotColor: AppData.primaryColor,
                  dotColor: (AppData.secondaryColor).withValues(alpha: 0.4),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _goToNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppData.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withValues(alpha: 0.2),
                        textStyle: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      child: Text(_isLastPage ? 'Get Started' : 'Next'),
                    ),
                  ),

                  if (_isLastPage) ...[
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black87,
                      ),
                      child: const Text(
                        'Already have an account? Log in',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.description,
  });

  final String illustration;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.07),
                    blurRadius: 32,
                    offset: const Offset(0, 16),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: smartImage(illustration),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Text(
            title,
            textAlign: TextAlign.center,
            style:
                textTheme.headlineMedium?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.22,
                  letterSpacing: -0.3,
                  color: Colors.black87,
                ) ??
                const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.22,
                  letterSpacing: -0.3,
                  color: Colors.black87,
                ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            textAlign: TextAlign.center,
            style:
                textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  height: 1.55,
                  color: Colors.black54,
                  letterSpacing: 0.2,
                ) ??
                const TextStyle(
                  fontSize: 16,
                  height: 1.55,
                  color: Colors.black54,
                  letterSpacing: 0.2,
                ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppData.primaryColor : (AppData.secondaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
