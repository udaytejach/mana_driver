import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mana_driver/Vehicles/my_vehicle.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class AddNewVehicle extends StatefulWidget {
  const AddNewVehicle({super.key});

  @override
  State<AddNewVehicle> createState() => _AddNewVehicleState();
}

class _AddNewVehicleState extends State<AddNewVehicle> {
  List<File?> images = List.generate(4, (_) => null);
  File? image;
  void _pickImage(int index) async {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Center(
              child: CustomText(
                text: "Select Image From",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textcolor: KblackColor,
              ),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SimpleDialogOption(
                    onPressed: () async {
                      Navigator.pop(context);
                      final pickedImage = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (pickedImage != null) {
                        setState(() {
                          images[index] = File(pickedImage.path);
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera, size: 18, color: korangeColor),
                        SizedBox(width: 8),
                        CustomText(
                          text: "Camera",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textcolor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () async {
                      Navigator.pop(context);
                      final pickedImage = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedImage != null) {
                        setState(() {
                          images[index] = File(pickedImage.path);
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_library,
                          size: 18,
                          color: korangeColor,
                        ),
                        SizedBox(width: 8),
                        CustomText(
                          text: "Gallery",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textcolor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  Future<File?> pickImage(BuildContext context) async {
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {}

    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: "Add New Vehicle",
                  textcolor: KblackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomText(
              text: 'Add you vehicle',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              textcolor: KblackColor,
            ),
            const SizedBox(height: 5),
            CustomText(
              text:
                  'Save your vehicle and get one step closer to hassle-free rides.',
              fontSize: 12,
              fontWeight: FontWeight.w300,
              textcolor: kgreyColor,
            ),

            const SizedBox(height: 20),
            CustomText(
              text: 'Upload Vehicle Images',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textcolor: KblackColor,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: GestureDetector(
                    onTap: () => _pickImage(index),

                    child: DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(10),
                        dashPattern: [5, 5],
                        color: kgreyColor,
                        strokeWidth: 2,
                        padding: EdgeInsets.all(0),
                      ),
                      child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: KdeviderColor,
                        ),

                        alignment: Alignment.center,
                        child:
                            images[index] == null
                                ? const Icon(Icons.add, color: kgreyColor)
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    images[index]!,
                                    width: 70,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            buildDropdownField("Vehicle Brand", "Select Brand", [
              "Mahindra",
              "Tata",
              "Hyundai",
              "Toyota",
              "Maruti Suzuki",
              "Kia",
            ]),

            buildDropdownField("Vehicle Category", "Select Category", [
              "Heavy Vehicle",
              "Light Vehicle",
              "Medium Vehicle",
            ]),

            buildDropdownField("Vehicle Type", "Select Type", [
              "SUV",
              "Sedan",
              "Hatchback",
              "Truck",
              "Auto",
              "Van",
            ]),
            buildTextField("Vehicle Number", "Enter vehicle number"),

            buildDropdownField("Fuel Type", "Select Fuel Type", [
              "Petrol",
              "Diesel",
              "Electric",
              "CNG",
              "Hybrid",
            ]),

            buildDropdownField("Transmission", "Select Transmission", [
              "Manual",
              "Automatic",
              "Semi-Automatic",
            ]),

            buildDropdownField("AC Available", "Is AC Available?", [
              "Yes",
              "No",
            ]),

            buildDropdownField(
              "Features & Equipment",
              "Select Features & Equipment",
              [
                "All-Wheel Drive",
                "Premium Package",
                "Navigation",
                "Heated Seats",
              ],
            ),

            const SizedBox(height: 10),
            buildTextField(
              "Type Message (Optional)",
              "Enter any message",
              maxLines: 3,
            ),

            const SizedBox(height: 10),
            CustomText(
              text: "Upload RC Documents",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textcolor: KblackColor,
            ),

            const SizedBox(height: 12),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(10),
                dashPattern: [5, 5],
                color: kbordergreyColor,
                strokeWidth: 2,
                padding: EdgeInsets.all(0),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'images/doc_icon.png',
                      width: 46,
                      height: 46,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 8),
                    CustomText(
                      text: "Upload RC Documents",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textcolor: kgreyColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: korangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Myvehicle()),
                    );
                  },
                  child: CustomText(
                    text: "Add Vehicle",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: kwhiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hintText, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        maxLines: maxLines,

        style: TextStyle(
          color: korangeColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: TextStyle(
            color: kseegreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            color: kgreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kbordergreyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kbordergreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kbordergreyColor, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String label, String hint, List<String> items) {
    String? selectedValue;

    return StatefulBuilder(
      builder:
          (context, setState) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DropdownButtonFormField<String>(
              icon: Icon(Icons.keyboard_arrow_down, color: KblackColor),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: kgreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kbordergreyColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kbordergreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kbordergreyColor,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              hint: CustomText(
                text: hint,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textcolor: kseegreyColor,
              ),
              value: selectedValue,
              isExpanded: true,
              onChanged: (value) => setState(() => selectedValue = value),
              items:
                  items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: CustomText(
                        text: item,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textcolor: korangeColor,
                      ),
                    );
                  }).toList(),
            ),
          ),
    );
  }
}
