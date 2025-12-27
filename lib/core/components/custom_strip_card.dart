import 'package:flutter/material.dart';

class CustomStripCard extends StatelessWidget {
  final Color leadingColor;
  final Widget child;

  const CustomStripCard({
    super.key,
    required this.leadingColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: const Color(0xFF18181C),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 10,
                color: leadingColor,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}