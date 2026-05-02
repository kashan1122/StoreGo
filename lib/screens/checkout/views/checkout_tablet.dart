import 'package:flutter/material.dart';

class CheckoutTablet extends StatefulWidget {
  const CheckoutTablet({super.key});

  @override
  State<CheckoutTablet> createState() => _CheckoutTabletState();
}

class _CheckoutTabletState extends State<CheckoutTablet> {

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.edit, size: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Personal Details
            sectionTitle("Personal Details"),
            customField("Email Address", "aashifa@gmail.com"),
            customField("Password", "************", isPassword: true),

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
            customField("Pincode", "450116"),
            customField("Address", "216 St Paul's Rd,"),
            customField("City", "London"),
            customDropdown("State", "N1 2LL"),
            customField("Country", "United Kingdom"),

            const SizedBox(height: 10),

            /// Bank Details
            sectionTitle("Bank Account Details"),
            //
            customField("Bank Account Number", "204356XXXXXXX"),
            customField("Account Holder’s Name", "Abhiraj Sisodiya"),
            customField("IFSC Code", "SBIN00428"),
            // const CustomField(label: "Bank Account Number", hint: "204356XXXXXXX"),
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
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ],
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

  /// Text Field
  Widget customField(String label, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
