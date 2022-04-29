// ignore: must_be_immutable
import 'package:devbook/src/utils/image_constant.dart';
import 'package:devbook/src/utils/math_utils.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: getSize(
          117.00,
        ),
        width: getSize(
          117.00,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              21.00,
            ),
          ),
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getHorizontalSize(
                21.00,
              ),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  ImageConstant.imgRectangle7,
                  height: getSize(
                    117.00,
                  ),
                  width: getSize(
                    117.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
