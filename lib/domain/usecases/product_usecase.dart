import 'package:myapp/domain/repositories/product_repostory.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future call() async {
    return repository.getProducts();
  }
}
