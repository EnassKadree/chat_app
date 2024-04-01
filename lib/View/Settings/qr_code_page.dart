import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget 
{
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('QR Code'),),
      body: Center
      (
        child: 
          Center
          (
            child: Card
            (
              child: Padding
              (
                padding: const EdgeInsets.all(20),
                child: Card
                (
                  color: Colors.white,
                  child: QrImageView
                  (
                    version: 3,
                    data: '@enass_ka',
                    size: 200,
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}