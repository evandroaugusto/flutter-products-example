import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String label;
  final String value;

  const UserInfo({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(width: 8),
            Text(value)
          ],
        ),
      ),
    );
  }
}
