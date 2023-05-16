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
  final List<List<String>> _textList = [
    ["Welcome To", "Appointiac"],
    ["Explore, Bid and Connect", "all in one place"],
    ["Auction or Resell your", " time engage", "with a community "],
  ];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                            height: 0.4 * screenHeight,
                            width: 0.6 * screenWidth,
                          ),
                          ..._textList[index].map((text) => Padding(
                                padding:
                                    EdgeInsets.only(top: 0.02 * screenHeight),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontFamily: "grotesco",
                                    fontSize: 0.047 * screenHeight,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List<Widget>.generate(_imagesList.length, _buildDot),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 0.02 * screenHeight,
                        right: 0.001 *
                            screenWidth), // 2% of screen height and width
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        backgroundColor: const Color.fromARGB(255, 255, 85, 0),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 0.05 * screenHeight), // 5% of screen height
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: _currentPage == index ? 25.0 : 10.0,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color.fromARGB(223, 255, 42, 0)
            : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
