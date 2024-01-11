import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:training_task1/models/vegetable.dart';

class VegetableCard extends StatefulWidget {
  const VegetableCard({super.key, required this.vegetable});

  final Vegetable vegetable;

  @override
  State<VegetableCard> createState() => _VegetableCardState();
}

class _VegetableCardState extends State<VegetableCard> {
  var currentImageIndex;

  @override
  void initState() {
    currentImageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: -300,
                  child: SizedBox(
                    width: 400,
                    height: 400,
                    child: CarouselSlider(
                      items: widget.vegetable.images
                          .map(
                            (imgPath) => Image(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 400,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (idx, reason) =>
                            setState(() => currentImageIndex = idx),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -30,
                  child: Row(
                    children:
                        widget.vegetable.images.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Colors.white).withOpacity(
                                currentImageIndex == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 245, 245),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      top: 35, right: 20, left: 20, bottom: 55),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.vegetable.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(widget.vegetable.price.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32)),
                          Text(
                            ' \$/${widget.vegetable.amountType.name}',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 149, 134, 168),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '~ ${widget.vegetable.pieceWeight} gr/piece',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 6, 190, 119),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.vegetable.country,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.vegetable.description,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 149, 134, 168),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 28),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 217, 208, 227)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/icons/heart.png',
                              color: const Color.fromARGB(255, 149, 134, 168),
                              width: 20,
                              height: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 75),
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 11, 206, 131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {},
                            label: const Text('ADD TO CART'),
                            icon: Image.asset(
                              'assets/icons/shopping-cart.png',
                              color: Colors.white,
                              width: 20,
                              height: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Row(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          width: 180,
          child: Image(
            image: AssetImage(widget.vegetable.images[0]),
            height: 125,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.vegetable.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(widget.vegetable.price.toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 22)),
                Text(
                  ' \$/${widget.vegetable.amountType.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 149, 134, 168),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 217, 208, 227)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/icons/heart.png',
                    color: const Color.fromARGB(255, 149, 134, 168),
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 206, 131),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/icons/shopping-cart.png',
                    color: Colors.white,
                    width: 20,
                    height: 20,
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
