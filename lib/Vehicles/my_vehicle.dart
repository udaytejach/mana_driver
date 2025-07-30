import 'package:flutter/material.dart';
import 'package:mana_driver/Vehicles/add_new_vehicle.dart';
import 'package:mana_driver/Vehicles/vehicle_details.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class Myvehicle extends StatefulWidget {
  const Myvehicle({super.key});

  @override
  State<Myvehicle> createState() => _MyvehicleState();
}

class _MyvehicleState extends State<Myvehicle> {
  List<CarModel> carList = [
    CarModel(
      imagePath: 'images/swift.png',
      name: 'Maruti Swift Dzire VXI',
      kmsDriven: '76,225 km',
      transmission: 'Manual',
      fuelType: 'Petrol',
      price: '₹7,957',
    ),
    CarModel(
      imagePath: 'images/mahindra.png',
      name: 'Mahindra MARAZZO M2 7STR',
      kmsDriven: '45,120 km',
      transmission: 'Automatic',
      fuelType: 'Diesel',
      price: '₹9,995',
    ),
    CarModel(
      imagePath: 'images/tata.png',
      name: 'Tata Nexon XZ+',
      kmsDriven: '60,000 km',
      transmission: 'Manual',
      fuelType: 'Petrol',
      price: '₹9,100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    "images/chevronLeft.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Center(
                child: CustomText(
                  text: "My Vehicles",
                  textcolor: KblackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomText(
              text: 'Recent Added Cars',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              textcolor: KblackColor,
            ),
            const SizedBox(height: 5),
            CustomText(
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              fontSize: 12,
              fontWeight: FontWeight.w300,
              textcolor: kgreyColor,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  final car = carList[index];
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: KdeviderColor, width: 1.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade100,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    car.imagePath,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: car.name,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textcolor: KblackColor,
                                    ),
                                    const SizedBox(height: 5),
                                    Wrap(
                                      spacing: 6,
                                      children: [
                                        _infoChip(car.kmsDriven),
                                        _infoChip(car.transmission),
                                        _infoChip(car.fuelType),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: car.price,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: korangeColor,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' /per ride',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // const Icon(Icons.arrow_forward_ios, size: 18),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      if (index == carList.length - 1)
                        const SizedBox(height: 100),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 220,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: korangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewVehicle()),
            );
          },
          child: CustomText(
            text: "Add New Vehicle",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textcolor: kwhiteColor,
          ),
        ),
      ),
    );
  }

  Widget _infoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: KdeviderColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomText(
        text: text,
        fontSize: 10,
        fontWeight: FontWeight.w300,
        textcolor: KblackColor,
      ),
    );
  }
}

class CarModel {
  final String imagePath;
  final String name;
  final String kmsDriven;
  final String transmission;
  final String fuelType;
  final String price;

  CarModel({
    required this.imagePath,
    required this.name,
    required this.kmsDriven,
    required this.transmission,
    required this.fuelType,
    required this.price,
  });
}
