import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pos/pos_bloc.dart';
import '../bloc/pos/pos_state.dart';
import '../widgets/product_card.dart';
import '../widgets/total_summary_card.dart';

class ScannedProductsView extends StatelessWidget {
  const ScannedProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scanned Products")),
      body: BlocBuilder<POSBloc, POSState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  },
                ),
              ),
              TotalSummaryCard(total: state.total),
            ],
          );
        },
      ),
    );
  }
}
