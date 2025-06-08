import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final String prefix = 'RANA-';
  final controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  void scanQR(String code) {
    if (code.startsWith(prefix)) {
      // Handle the scanned QR code
      debugPrint('Scanned QR Code: $code');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Scanned QR Code: $code'),
          duration: const Duration(seconds: 2),
        ),
      );
      // You can navigate to another screen or perform any action here
    } else {
      debugPrint('Invalid QR Code: $code');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Scanner"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ready to scan?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Container(
              clipBehavior: Clip.antiAlias,
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: MobileScanner(
                controller: controller,
                fit: BoxFit.cover,
                onDetect: (capture) {
                  final output = capture.barcodes.map(
                    (value) => value.rawValue,
                  );
                  debugPrint(output.toString());
                  scanQR(output.first ?? '');
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Scan the QR code on your device \n to get started.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Get back'),
            ),
          ],
        ),
      ),
    );
  }
}
