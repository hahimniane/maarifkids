import 'package:flutter/material.dart';

import 'contants.dart';

class CustomIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData iconData;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: Card(
              elevation: 4,
              color: Color(0xffFDF5E7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: adminAppColor,
                    size: 80,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      label,
                      style: TextStyle(
                          fontSize: 25,
                          color: adminAppColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
