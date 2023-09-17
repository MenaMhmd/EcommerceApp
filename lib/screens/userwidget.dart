import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../const/constant.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: "data:image/jpeg;base64,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",
        boxFit: BoxFit.fill,
      ),
      title: const Text("User name"),
      subtitle: const Text("Email@email.com"),
      trailing: Text(
        "User role",
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}