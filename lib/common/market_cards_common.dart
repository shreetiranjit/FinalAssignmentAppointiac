import 'package:appointiac/data/serviceprovider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget marketCards(
    List<List<ServiceProvider>> serviceProviders,
    List<int> currentCardIndices,
    BuildContext context,
    double screenHeight,
    Function changeCardIndex) {
  return SingleChildScrollView(
    child: Column(
      children: [
        for (int indx = 0; indx < serviceProviders.length; indx++) ...{
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            color: Colors.grey[300],
            child: CarouselSlider.builder(
              itemCount: serviceProviders[indx].length,
              options: CarouselOptions(
                  height: screenHeight * 0.235,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    changeCardIndex(indx, index);
                  }),
              itemBuilder: (context, index, realIdx) {
                return SingleChildScrollView(
                  child: Card(
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(10, (index) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentCardIndices[indx] == index
                                        ? const Color.fromRGBO(
                                            255, 108, 63, 0.9)
                                        : const Color.fromRGBO(0, 0, 0, 0.4)),
                              );
                            }),
                          ),
                        ),
                        Text(
                          ' ${serviceProviders[indx][index].name}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          serviceProviders[indx][index].professions,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${serviceProviders[indx][index].time}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: index <
                                            serviceProviders[indx][index].rating
                                        ? Colors.yellow
                                        : Colors.grey,
                                  )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              serviceProviders[indx][index].price,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Place a Bid'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        },
      ],
    ),
  );
}
