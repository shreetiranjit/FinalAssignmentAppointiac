import 'package:flutter/material.dart';

class WelcomePageOne extends StatefulWidget {
  const WelcomePageOne({super.key});

  @override
  _WelcomePageOneState createState() => _WelcomePageOneState();
}

class _WelcomePageOneState extends State<WelcomePageOne> {
  int _currentPage = 0;
  final List<String> _imagesList = [
    "assets/logo1.png",
    "assets/logo2.png",
    "assets/logo3.png",
  ];
  final List<String> _textList = [
    "Welcome to ",
    "Appointiac",
    "Get Started",
  ];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _imagesList.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          _imagesList[index],
                          height: 300.0,
                          width: 300.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            _textList[index],
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(_imagesList.length, _buildDot),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                backgroundColor: const Color.fromARGB(223, 255, 42, 0),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: _currentPage == index ? 24.0 : 10.0,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color.fromARGB(223, 255, 42, 0)
            : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
