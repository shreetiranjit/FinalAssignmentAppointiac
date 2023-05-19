import 'package:appointiac/data/serviceprovider.dart';
import 'package:appointiac/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget marketCards(
    List<List<ServiceProvider>> serviceProviders,
    List<int> currentCardIndices,
    BuildContext context,
    double screenHeight,
    Function changeCardIndex) {
  var gap = SizedBox(height: screenHeight * 0.008);
  return SingleChildScrollView(
    child: Column(
      children: [
        for (int indx = 0; indx < serviceProviders.length; indx++) ...{
          Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            color: const Color.fromARGB(255, 247, 217, 174),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(serviceProviders[indx].length, (index) {
                        return Container(
                          width: 12.0,
                          height: 4.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            color: currentCardIndices[indx] == index
                                ? const Color.fromRGBO(255, 108, 63, 0.9)
                                : const Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }),
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: serviceProviders[indx].length,
                    options: CarouselOptions(
                        height: screenHeight * 0.25,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          changeCardIndex(indx, index);
                        }),
                    itemBuilder: (context, index, realIdx) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          Text(
                            serviceProviders[indx][index].name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            serviceProviders[indx][index].professions,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          gap,
                          Text(
                            '${serviceProviders[indx][index].time}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          gap,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: index <
                                              serviceProviders[indx][index]
                                                  .rating
                                          ? const Color.fromRGBO(
                                              255, 108, 63, 0.9)
                                          : Colors.grey,
                                    )),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                serviceProviders[indx][index].price,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Place a Bid',
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        },
      ],
    ),
  );
}
