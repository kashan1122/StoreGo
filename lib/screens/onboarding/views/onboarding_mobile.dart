import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/onboarding/onboarding_model.dart';

class OnBoardingMobile extends StatefulWidget {
  const OnBoardingMobile({super.key});

  @override
  State<OnBoardingMobile> createState() => _OnBoardingMobileState();
}

class _OnBoardingMobileState extends State<OnBoardingMobile> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: "assets/images/onboardingone.png",
      title: "Choose Products",
      description:
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    ),
    OnboardingModel(
      image: "assets/images/onboardingtwo.png",
      title: "Make Payment",
      description:
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    ),
    OnboardingModel(
      image: "assets/images/onboardingthree.png",
      title: "Get Your Order",
      description:
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    ),
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to Home/Login
      context.push('/landing');
      print("Get Started Clicked");
    }
  }

  void skip() {
    _controller.jumpToPage(pages.length - 1);
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${currentIndex + 1}/${pages.length}"),
                  GestureDetector(
                    onTap: skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            /// PageView
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Image
                        Image.asset(
                          item.image,
                          height: 250,
                        ),

                        const SizedBox(height: 40),

                        /// Title
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// Description
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Bottom Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Prev
                  currentIndex > 0
                      ? GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Prev",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  )
                      : const SizedBox(width: 40),

                  /// Indicators
                  Row(
                    children: List.generate(
                      pages.length,
                          (index) => buildDot(index),
                    ),
                  ),

                  /// Next / Get Started
                  GestureDetector(
                    onTap: nextPage,
                    child: Text(
                      currentIndex == pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
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
