import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../bloc/pos/pos_bloc.dart';
import '../bloc/pos/pos_event.dart';
import '../repositories/product_repository.dart';
import '../widgets/scanned_products_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = ProductRepository();
    final posBloc = context.read<POSBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("POS Terminal Demo")),
      body: MobileScanner(
        onDetect: (capture) {
          final barcode = capture.barcodes.first;
          final code = barcode.rawValue;
          if (code != null) {
            final product = repository.getProductByCode(code);
            posBloc.add(AddProduct(product));
            showScannedProductsBottomSheet(context);
          }
        },
      ),
    );
  }
}
