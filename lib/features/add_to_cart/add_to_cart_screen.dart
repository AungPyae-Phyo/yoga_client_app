// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_client_app/config/constants/colors.dart';

import '../../data/cart_manager.dart';
import '../../data/booking_manager.dart';
import '../../data/yoga_class.dart';
import '../../utils/email_validation_utils.dart';
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
    final email = await showEmailConfirmationDialog(context);
    if (email == null || email.isEmpty) {
      return; // User canceled the dialog
    }

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    // Proceed with booking
    await BookingManager.addBooking(course); // Add to Booking
    await CartManager.removeCourse(course.id ?? ""); // Remove from Cart
    setState(() {
      courses = CartManager.getAllCourse(); // Update cart items
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${course.comment} booking successfully!')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingListScreen(),
      ),
    );
  }

  Future<String?> showEmailConfirmationDialog(BuildContext context) {
    final emailController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Email'),
        content: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            hintText: 'Enter your email',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog without returning a value
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, emailController.text); // Return the email
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void onClearAllClick() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Clear All Items'),
        content: const Text(
            'Are you sure you want to remove all classes from the cart? This action cannot be undone.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Yes'),
            onPressed: () async {
              Navigator.pop(context);

              // Clear all items from the cart
              await CartManager.deleteAll(
                courses.map((e) => int.tryParse(e.id ?? '') ?? 0).toList(),
              );

              setState(() {
                courses = CartManager.getAllCourse(); // Fetch updated data
              });

              // Show confirmation message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('All items removed from the cart.')),
              );
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
                      child: FilledButton(
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: onBook,
                          child: const Text('Book')),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onRemove,
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: ColorConst.darkAccent,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
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
