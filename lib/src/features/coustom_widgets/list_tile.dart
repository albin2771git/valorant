import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CommonListTile extends StatelessWidget {
  final String name;
  final VoidCallback callback;

  const CommonListTile({
    super.key,
    required this.name,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
