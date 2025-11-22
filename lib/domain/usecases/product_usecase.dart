import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<ProductEntity>> call() => repository.getProducts();
}
