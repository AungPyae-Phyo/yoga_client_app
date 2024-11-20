// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/cart_manager.dart';
import '../../data/booking_manager.dart';
import '../../data/yoga_class.dart';
import '../booking/booking_screen.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    getAllItemsFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Add to cart'),
        actions: [
          TextButton(
            onPressed: onClearAllClick,
            child: const Text(
              'Clear All',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: courses.isEmpty
          ? const Center(
              child: Text('No items in cart'),
            )
          : ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {
                final data = courses[index];
                return AddToCartItem(
                  data: data,
                  onBook: () => onBook(data),
                  onRemove: () => onRemove(data),
                );
              },
            ),
    );
  }

  void getAllItemsFromCart() {
    setState(() {
      courses = CartManager.getAllCourse();
    });
  }

  void onRemove(Course courseItem) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text.rich(TextSpan(children: [
          const TextSpan(text: 'Are you sure you want to remove '),
          TextSpan(
            text: courseItem.comment,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: ' from your cart?'),
        ])),
        actions: [
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context);
              CartManager.removeCourse(courseItem.id ?? "");
              getAllItemsFromCart();
            },
          ),
        ],
      ),
    );
  }

  void onBook(Course course) async {
    await BookingManager.addBooking(course); // Add to Booking
    await CartManager.removeCourse(course.id ?? ""); // Remove from Cart
    setState(() {
      courses = CartManager.getAllCourse(); // Update cart items
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${course.comment} booked successfully!')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingListScreen(),
      ),
    );
  }

  void onClearAllClick() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
            'Are you sure you want to clear all classes from cart list'),
        actions: [
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context);
              // Adjusted this line for type consistency
              CartManager.deleteAll(
                courses.map((e) => int.tryParse(e.id ?? '') ?? 0).toList(),
              );
              getAllItemsFromCart();
            },
          ),
        ],
      ),
    );
  }
}

class AddToCartItem extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onBook;
  final Course data;

  const AddToCartItem({
    super.key,
    required this.onRemove,
    required this.onBook,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.comment ?? 'No comment',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Date: ${data.date}',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onRemove,
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.red,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: onBook,
                          child: const Text('Book')),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
