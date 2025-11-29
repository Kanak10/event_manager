import 'package:event_manager/theams/app_colors.dart';
import 'package:flutter/material.dart';

class EMElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final BorderSide? borderSide;
  final OutlinedBorder shape;
  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool extraWidth;
  final bool isSaving;
  final double minWidth;
  final double loaderPadding;
  final double minHeight;

  const EMElevatedButton({super.key, 
    required this.child,
    required this.onPressed,
    this.isSaving = false,
    this.borderSide,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.color = primaryColor,
    this.disabledColor = unselectedColor,
    this.padding = const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
    this.margin = const EdgeInsets.all(0.0),
    this.extraWidth = false,
    this.minWidth = 88,
    this.loaderPadding = 0,
    this.minHeight = 36,
  });

  @override
  Widget build(BuildContext context) {
    SizedBox progressBar = SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        backgroundColor: appbarTextColor,
        strokeWidth: 2,
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );

    return Padding(
      padding: margin,
      child: ElevatedButton(
        onPressed: isSaving ? () {} : this.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled))
                return disabledColor;
              return this.color;
            },
          ),
          padding: WidgetStateProperty.all(this.padding),
          shape: WidgetStateProperty.all(this.shape),
          side: WidgetStateProperty.all(this.borderSide),
          minimumSize: WidgetStateProperty.all(
              Size(this.extraWidth ? 130 : minWidth, minHeight)),
        ),
        child: isSaving
            ? Padding(
            padding: EdgeInsets.all(loaderPadding), child: progressBar)
            : this.child,
      ),
    );
  }
}