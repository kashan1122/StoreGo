// import 'package:flutter/material.dart';
//
// class CustomField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final bool isPassword;
//
//   const CustomField({
//     super.key,
//     required this.label,
//     required this.hint,
//     this.isPassword = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: TextField(
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: hint,
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 12,
//             vertical: 14,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    // required this.label,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          // labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}