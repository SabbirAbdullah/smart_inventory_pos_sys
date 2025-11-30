import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

class POSState extends Equatable {
  final List<Product> products;

  const POSState({this.products = const []});

  double get total =>
      products.fold(0, (sum, p) => sum + p.price * p.quantity);

  @override
  List<Object?> get props => [products];
}
