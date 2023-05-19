import 'package:appointiac/features/navbar/navbar.dart';
import 'package:appointiac/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../common/market_cards_common.dart';
import '../../data/serviceprovider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? selectedIndex;
  List<int> currentCardIndices =
      List<int>.generate(serviceProviders.length, (index) => 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  changeCardIndex(int indx, int index) {
    setState(() {
      currentCardIndices[indx] = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 255, 250, 250),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: primaryColor,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.search,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.06,
                margin: const EdgeInsets.only(bottom: 8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? primaryColor
                              : const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Item $index',
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Column(
                    children: [
                      marketCards(serviceProviders, currentCardIndices, context,
                          screenHeight, changeCardIndex),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
