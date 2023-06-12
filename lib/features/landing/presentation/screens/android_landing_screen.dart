import 'package:flutter/material.dart';
import 'package:zeyarah/core/language_helper.dart';
import 'package:zeyarah/core/user_shared_prefs.dart';

class AndroidLandingScreen extends StatelessWidget {
  const AndroidLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoard> listData = [
      OnBoard(
          image: 'assets/images/prophet.png',
          title: context.loc.firstPageIntroHeader,
          description: context.loc.firstPageIntroContent),
      OnBoard(
          image: 'assets/images/prophet.png',
          title: context.loc.secondPageIntroHeader,
          description: context.loc.secondPageIntroContent),
      OnBoard(
          image: 'assets/images/prophet.png',
          title: context.loc.thirdPageIntroHeader,
          description: context.loc.thirdPageIntroContent),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return OnBoardingContent(
                        image: listData[index].image,
                        title: listData[index].title,
                        description: listData[index].description);
                  },
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    listData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotIndecator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        if (_pageIndex == listData.length - 1) {
                          Navigator.pushReplacementNamed(context, "/home");
                          UserSharedPrefs.setFirstRun(false);
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        }
                      },
                      child: const Icon(
                        Icons.forward,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndecator extends StatelessWidget {
  const DotIndecator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.green.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
