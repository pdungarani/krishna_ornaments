import 'package:flutter/material.dart';
import 'package:krishna_ornaments/app/app.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.height,
      this.backgroundColor,
      this.radius,
      this.style,
      this.side})
      : super(key: key);
  final String? text;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? radius;
  final Function()? onTap;
  final TextStyle? style;
  final BoxBorder? side;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                    color: widget.backgroundColor ?? ColorsValue.lightYellow,
                    borderRadius:
                        widget.radius ?? BorderRadius.circular(Dimens.twelve),
                    border: widget.side),
                child: Center(
                  child: Text(
                    widget.text!,
                    style: widget.style ?? Styles.txtWhite80018,
                  ),
                )),
          ),
        ],
      );
}
