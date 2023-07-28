import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 4,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}
//
// import 'package:flutter/material.dart';
//
// class CustomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final List<CustomNavigationItem> items;
//   final ValueChanged<int> onTap;
//
//   const CustomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.items,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       items: items.map((item) {
//         return BottomNavigationBarItem(
//           icon: Icon(item.icon),
//           label: item.label,
//         );
//       }).toList(),
//     );
//   }
// }
//
// class CustomNavigationItem {
//   final IconData icon;
//   final String label;
//
//   const CustomNavigationItem({
//     required this.icon,
//     required this.label,
//   });
// }
