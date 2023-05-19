import 'package:appointiac/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Drawer(
          child: Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: constraints.maxHeight * 0.15,
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: constraints.maxWidth * 0.2,
                          height: constraints.maxWidth * 0.2,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/200'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Service Provider',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'user.email@example.com',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.home,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Home',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Home page
                          },
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        ListTile(
                          leading: const Icon(
                            Icons.category,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Categories',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Categories page
                          },
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        ListTile(
                          leading: const Icon(
                            Icons.message,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Messages',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Messages page
                          },
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        ListTile(
                          leading: const Icon(
                            Icons.schedule,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Schedule',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Schedule page
                          },
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        ListTile(
                          leading: const Icon(
                            Icons.settings,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Settings',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigate to Settings page
                          },
                        ),
                        SizedBox(height: screenHeight * 0.13),
                        ListTile(
                          leading: const Icon(
                            Icons.exit_to_app,
                            color: Color(0xFFFAFAFA),
                          ),
                          title: Text(
                            'Logout',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Logout
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
