import 'package:flutter/material.dart';
import 'package:grocery1/screens/detail_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  String dist1 = '';
  String State = "";

  Future getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dist1 = prefs.getString('dropdownvalue').toString();
    });
  }

  Future getString1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      State = prefs.getString('dropdownvalue1').toString();
    });
  }

  List<Productcard> productData = [
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 1,
        price: 25),
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 2,
        price: 25),
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 3,
        price: 25),
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 4,
        price: 25),
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 5,
        price: 25),
    const Productcard(
        image: "assets/images/banana.png",
        title: "Organic Bananas",
        quantity: '1Kg, priceg',
        id: 6,
        price: 25),
  ];
  @override
  void initState() {
    getString();
    getString1();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo4.png",
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 25,
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    State.isEmpty ? const Text("") : Text(State),
                    const Text(","),
                    dist1.isEmpty ? const Text("") : Text(dist1),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      hintText: "Search Items",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 116,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                      ),
                      borderRadius: BorderRadius.circular(13),
                      image: const DecorationImage(
                          image: ExactAssetImage(
                            "assets/images/123.png",
                          ),
                          fit: BoxFit.cover),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF9DE3E4),
                          Colors.white,
                        ],
                      )),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 11,
                        left: 60,
                        child: Text(
                          "Fresh Vegetables",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 60,
                        child: Text(
                          "Fresh Vegetables",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 180,
                        child: Text(
                          "Get Up To 40% OFF",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 467,
                  width: 1000,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: productData.length,
                    itemBuilder: (context, index) => Productcard(
                      product: productData[index],
                      onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailpage(
                                    product: productData[index],
                                  ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Productcard extends StatelessWidget {
  const Productcard({
    Key? key,
    this.image = "",
    this.title = "",
    this.quantity = "",
    this.id,
    this.price,
    this.product,
    this.onpressed,
  }) : super(key: key);
  final String image, title, quantity;
  final int? id, price;
  final Productcard? product;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: 120,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 5,
            ),
            Image.asset(product!.image),
            Text(
              product!.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              product!.quantity,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${product!.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    color: Colors.teal,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 40,
                    )),
              ],
            )
          ]),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
      ),
    );
  }
}
