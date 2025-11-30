import 'package:flutter_bloc/flutter_bloc.dart';
import 'pos_event.dart';
import 'pos_state.dart';
import '../../models/product_model.dart';

class POSBloc extends Bloc<POSEvent, POSState> {
  POSBloc() : super(const POSState()) {
    on<AddProduct>((event, emit) {
      final updated = List<Product>.from(state.products);
      int index = updated.indexWhere((p) => p.id == event.product.id);
      if (index >= 0) {
        updated[index] = updated[index].copyWith(
            quantity: updated[index].quantity + 1);
      } else {
        updated.add(event.product);
      }
      emit(POSState(products: updated));
    });

    on<IncrementQuantity>((event, emit) {
      final updated = state.products.map((p) {
        if (p.id == event.productId) return p.copyWith(quantity: p.quantity + 1);
        return p;
      }).toList();
      emit(POSState(products: updated));
    });

    on<DecrementQuantity>((event, emit) {
      final updated = state.products.map((p) {
        if (p.id == event.productId && p.quantity > 1) {
          return p.copyWith(quantity: p.quantity - 1);
        }
        return p;
      }).toList();
      emit(POSState(products: updated));
    });

    on<DeleteProduct>((event, emit) {
      final updated =
      state.products.where((p) => p.id != event.productId).toList();
      emit(POSState(products: updated));
    });
  }
}

