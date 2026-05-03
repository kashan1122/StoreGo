import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/core/constants/app_assets_path.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/custom_field.dart';
import 'package:myapp/core/custom_widgets/my_profile_circle_avatar.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/utils/app_dilaogs.dart';

class CheckoutMobile extends StatefulWidget {
  const CheckoutMobile({super.key});

  @override
  State<CheckoutMobile> createState() => _CheckoutMobileState();
}

class _CheckoutMobileState extends State<CheckoutMobile> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  File? pickedImage;
  late List<File>? selectedImage = [];

  void _imageSheetOpen() {
    AppDialogs.customBottomSheet(
        context: context,
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ///Image from Camera of Bottom Sheet
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      cameraPicker();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: AppColors.secondary),
                          child: Image.asset(
                            AppAssets.cameraPicker,
                            scale: 5,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CustomText(
                          AppString.chooseCamera,
                          color: AppColors.text,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Divider(
                    color: const Color(0xff492A8B).withOpacity(0.1),
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  const SizedBox(width: 5),

                  ///Image from gallery of Bottom Sheet
                  InkWell(
                    onTap: () {
                      Navigator.pop;
                      galleryPicker();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: AppColors.secondary),
                          child: Image.asset(
                            AppAssets.galleryPicker,
                            scale: 3,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.only(right: 75),
                          child: const CustomText(
                            AppString.chooseGallery,
                            color: AppColors.text,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ));
  }

  Future galleryPicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future cameraPicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    try {
      if (image == null) return;
      final imageFile = File(image.path);
      print("image: $image");
      // widget.setFile!(imageFile);
      setState(() {
        selectedImage!.add(imageFile);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    //imageOperationsForCamera(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.redAccent,
                      backgroundImage: selectedImage != null && selectedImage!.isNotEmpty
                          ? FileImage(selectedImage![0])
                          : null,
                      child: (selectedImage == null || selectedImage!.isEmpty)
                          ? const Icon(Icons.person, size: 40, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _imageSheetOpen,
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.blue,
                          child:
                              Icon(Icons.edit, size: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Personal Details
              sectionTitle("Personal Details"),

              CustomTextField(
                hint: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              CustomTextField(
                hint: "Password",
                isPassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Minimum 6 characters required";
                  }
                  return null;
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Change Password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Business Address
              sectionTitle("Business Address Details"),
              const CustomTextField(
                  // label: "Pincode",
                  hint: "PinCode"),
              const CustomTextField(
                  // label: "Address",
                  hint: "Address"),
              const CustomTextField(
                  // label: "City",
                  hint: "City"),
              // customField("Pincode", "450116"),
              // customField("Address", "216 St Paul's Rd,"),
              // customField("City", "London"),
              customDropdown("State", "N1 2LL"),
              const CustomTextField(
                  // label: "Country",
                  hint: "Country"),
              // customField("Country", "United Kingdom"),

              const SizedBox(height: 10),

              /// Bank Details
              sectionTitle("Bank Account Details"),
              const CustomTextField(hint: "Bank Account Number"),
              const CustomTextField(hint: "Country"),
              const CustomTextField(hint: "IFSC Code"),
              // customField("Bank Account Number", "204356XXXXXXX"),
              // customField("Account Holder’s Name", "Abhiraj Sisodiya"),
              // customField("IFSC Code", "SBIN00428"),

              const SizedBox(height: 20),

              /// Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validated ✅
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Dropdown Field
  Widget customDropdown(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        items: [value]
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (val) {},
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
