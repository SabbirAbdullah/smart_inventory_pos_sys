import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

abstract class POSEvent extends Equatable {
  const POSEvent();
  @override
  List<Object?> get props => [];
}

class AddProduct extends POSEvent {
  final Product product;
  const AddProduct(this.product);
  @override
  List<Object?> get props => [product];
}

class IncrementQuantity extends POSEvent {
  final String productId;
  const IncrementQuantity(this.productId);
  @override
  List<Object?> get props => [productId];
}

class DecrementQuantity extends POSEvent {
  final String productId;
  const DecrementQuantity(this.productId);
  @override
  List<Object?> get props => [productId];
}

class DeleteProduct extends POSEvent {
  final String productId;
  const DeleteProduct(this.productId);
  @override
  List<Object?> get props => [productId];
}
