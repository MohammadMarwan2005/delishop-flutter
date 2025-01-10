import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/model/location/location.dart';
import '../theme/delishop_colors.dart';

class LocationLabel extends StatelessWidget {
  final Location? location;

  const LocationLabel({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUrl(
          location?.url ?? "",
              () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to open this link!")),
            );
          },
        );
      },
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Color(0xFF4169E1)),
          const SizedBox(width: 8),
          Text(
            location?.name ?? "Deleted Location".tr(context),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF4169E1), // Link-like blue color
              // decoration: TextDecoration.underline, // Underline to mimic a hyperlink
            ),
          ),
        ],
      ),
    );

  }
}

Future<void> openUrl(String url, Function() onFailure) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    onFailure();
  }
}
