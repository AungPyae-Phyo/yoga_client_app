import 'package:flutter/material.dart';
import '../../config/constants/colors.dart';
import '../../config/features/add_to_cart/add_to_cart_screen.dart';
import '../../config/features/booking/booking_screen.dart';
import '../../config/features/home/presentation/screens/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      const HomeScreen(),
      const BookingScreen(),
      const AddToCartScreen(),
    ];
    void onTap(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTap,
        selectedIconTheme:
            const IconThemeData(color: ColorConst.lightAccent, size: 32.0),
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Booking List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
