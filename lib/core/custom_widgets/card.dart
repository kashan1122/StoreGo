import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';

class CustomProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const CustomProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 3,
        // shadowColor: Colors.black12,
        // color: AppColors.primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                imageUrl,
                width: double.infinity,
                height: context.hp(25),
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),

              // ⭐ Product Title
              CustomText(
                title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                maxLines: 1,
              ),
              const SizedBox(height: 4),

              // ⭐ Description (short)
              CustomText(
                description,
                fontSize: 13,
                color: Colors.grey[600],
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
