import 'package:flutter/material.dart';
import 'package:grocery1/screens/bottomnavigation.dart';

import 'package:grocery1/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  String dropdownvalue = 'Select Your District';
  String dropdownvalue1 = 'Select Your State';

  var items1 = ['Select Your State', 'Kerala'];

  var items = [
    'Select Your District',
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasargode',
    'Kollam',
    'Kottayam',
    'Kozhikkode',
    'Malappuram',
    'Palakkad',
    'Thiruvananthapuram',
    'Thrissure',
    'Wayanad'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/locations.png",
              height: 300,
              width: 300,
            ),
            const Text(
              "Select Your Location",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Switch on your location to stay tune with what's happening in your area",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text(
                  "State",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    elevation: 0,
                    hint: const Text("Select Your State"),
                    isExpanded: true,
                    value: dropdownvalue1,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items1.map((String items1) {
                      return DropdownMenuItem(
                          value: items1, child: Text(items1));
                    }).toList(),
                    onChanged: (String? newValue) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('dropdownvalue1', newValue!);
                      setState(() {
                        dropdownvalue1 = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      "District",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    elevation: 0,
                    hint: const Text("Select District"),
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('dropdownvalue', newValue!);
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.teal,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const bottomnavigation(),
                        ),
                      );
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
