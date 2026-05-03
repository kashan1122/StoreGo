// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:myapp/core/constants/app_colors.dart';
//
//
// class CreateProfileCircleAvatar extends StatefulWidget {
//   final bool isUpdate;
//   final String? imageUrl;
//   final Function(File?)? setFile;
//   final File? pickedImage;
//   final Color color;
//   final Color? profileImageBgColor;
//   final String text;
//   final String cameraPlaceholderIcon;
//
//   const CreateProfileCircleAvatar({
//     Key? key,
//     required this.imageUrl,
//     this.setFile,
//     this.pickedImage,
//     this.color = AppColors.secondary,
//     required this.profileImageBgColor,
//     this.isUpdate = false,
//     required this.text,
//     required this.cameraPlaceholderIcon,
//   }) : super(key: key);
//
//   @override
//   State<CreateProfileCircleAvatar> createState() =>
//       _CreateProfileCircleAvatarState();
// }
//
// class _CreateProfileCircleAvatarState extends State<CreateProfileCircleAvatar> {
//   ImageProvider<Object> decideImage() {
//     if (widget.pickedImage != null) {
//       return FileImage(
//         widget.pickedImage!,
//       );
//     }
//     if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
//       return NetworkImage(NetworkStrings.IMAGE_BASE_URL + widget.imageUrl!);
//     }
//     return AssetImage(
//       widget.cameraPlaceholderIcon,
//     );
//   }
//
//   // Widget decideProfileImage() {
//   //   if (widget.pickedImage != null) {
//   //     return Image.file(
//   //       widget.pickedImage!,
//   //       fit: BoxFit.cover,
//   //     );
//   //   }
//   //   if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
//   //     return CustomFancyShimmerImage(
//   //       imageUrl: AppUtils.appendNetworkUrl(widget.imageUrl!),
//   //       fit: BoxFit.cover,
//   //     );
//   //   }
//   //   return Image.asset(
//   //     widget.cameraPlaceholderIcon,
//   //     fit: BoxFit.contain,
//   //   );
//   // }
//
//   Future galleryPicker() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     imageOperationsForGallery(image);
//   }
//
//   Future imageOperationsForGallery(image) async {
//     try {
//       if (image == null) return;
//       final imageTemp = File(image.path);
//       print("image: $image");
//
//       if (image != null) {
//         print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//         print(image.path);
//         print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//         final croppedImage =
//         await cropImage(image: image.path, context: context);
//         if (croppedImage != null) {
//           widget.setFile!(croppedImage);
//         }
//       }
//     } catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
//
//   Future cameraPicker() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     try {
//       if (image == null) return;
//       final imageFile = File(image.path);
//       print("image: $image");
//       widget.setFile!(imageFile);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//     //imageOperationsForCamera(image);
//   }
//
//   // Future imageOperationsForCamera(image) async {
//   //   try {
//   //     if (image == null) return;
//   //     final imageTemp = File(image.path);
//   //     print("image: $image");
//   //     widget.setFile()
//   //     // setState(() {
//   //     //   images = imageTemp;
//   //     //   AppConstant.dummyImage = images!;
//   //     //   print("imageTemp: $image");
//   //     // });
//   //   } on PlatformException catch (e) {
//   //     print('Failed to pick image: $e');
//   //   }
//   // }
//   Future<File?> cropImage(
//       {final image, Function(File)? setFile, BuildContext? context}) async {
//     try {
//       CroppedFile? croppedFile = await ImageCropper()
//           .cropImage(sourcePath: image, aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ], uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: "Profile Image",
//           toolbarColor: AppColors.primaryColor,
//           toolbarWidgetColor: AppColors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//         ),
//         IOSUiSettings(
//           minimumAspectRatio: 1.0,
//         ),
//       ]);
//       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//       print(croppedFile);
//       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//       print(croppedFile!.path);
//       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//       File _image = File(croppedFile.path);
//       print(_image);
//       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//       return _image;
//       // print(_image);
//       // setFile!(_image);
//       // print(setFile);
//       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   void _imageSheetOpen() {
//     AppDialogs.customBottomSheet(
//         context: context,
//         child: Wrap(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Center(
//                     child: Image.asset(
//                       AppAssets.rectangleIcon,
//                       scale: 4,
//                     ),
//                   ),
//                   10.verticalSpace,
//
//                   ///Image from Camera of Bottom Sheet
//                   InkWell(
//                     onTap: () {
//                       AppNavigator.popCurrentScreen();
//                       cameraPicker();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50.0),
//                               color: AppColors.avatarBgColor),
//                           child: Image.asset(
//                             AppAssets.cameraPicker,
//                             scale: 5,
//                           ),
//                         ),
//                         10.horizontalSpace,
//                         CustomTextWidget(
//                           text: AppStrings.chooseCamera,
//                           textColor: AppColors.black,
//                           fontSize: 14,
//                         ),
//                       ],
//                     ),
//                   ),
//                   5.verticalSpace,
//                   Divider(
//                     color: const Color(0xff492A8B).withOpacity(0.1),
//                     thickness: 1,
//                     indent: 5,
//                     endIndent: 5,
//                   ),
//                   5.verticalSpace,
//
//                   ///Image from gallery of Bottom Sheet
//                   InkWell(
//                     onTap: () {
//                       AppNavigator.popCurrentScreen();
//                       galleryPicker();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50.0),
//                               color: AppColors.avatarBgColor),
//                           child: Image.asset(
//                             AppAssets.galleryPicker,
//                             scale: 3,
//                           ),
//                         ),
//                         10.horizontalSpace,
//                         Container(
//                           padding: const EdgeInsets.only(right: 75),
//                           child: CustomTextWidget(
//                             text: AppStrings.chooseGallery,
//                             textColor: AppColors.black,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   5.verticalSpace,
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {
//             _imageSheetOpen();
//           },
//           child: Container(
//             alignment: Alignment.center,
//             height: 0.32.sw,
//             width: 0.32.sw,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: widget.color,
//                 width: 5,
//               ),
//               color: widget.profileImageBgColor ?? AppColors.white,
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 fit: widget.imageUrl != null && widget.imageUrl!.isNotEmpty ||
//                     widget.pickedImage != null
//                     ? BoxFit.cover
//                     : null,
//                 scale: 4,
//                 image: decideImage(),
//               ),
//             ),
//           ),
//         ),
//         //  SizedBox(height: 0.1.sh,),
//         //   Text(
//         //     widget.pickedImage == null &&
//         //             (widget.imageUrl == null || widget.imageUrl!.isEmpty)
//         //         ? AppStrings.uploadYourImage
//         //         : AppStrings.changeYourImage,
//         //     textColor: widget.color,
//         //   ),
//       ],
//     );
//   }
// }
//
// class CircularClipper extends CustomClipper<Rect> {
//   final double radius;
//
//   CircularClipper(this.radius);
//
//   @override
//   Rect getClip(Size size) {
//     // This method defines the clipping shape based on the given radius.
//     return Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2), radius: radius);
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     // This method decides whether to recreate the clip when the radius changes.
//     return true;
//   }
// }
