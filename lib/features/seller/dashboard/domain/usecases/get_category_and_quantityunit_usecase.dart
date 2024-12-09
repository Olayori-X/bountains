import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_category_and_quantityunit_repository.dart';
import 'package:fpdart/fpdart.dart';

class CategoryAndQuantityUnitUseCase
    implements
        UseCase<CategoryAndQuantityUnitResponse,
            CategoryAndQuantityUnitUseCaseParams> {
  final CategoryAndQuantityUnitRepository repository;

  const CategoryAndQuantityUnitUseCase({
    required this.repository,
  });

  @override
  Future<Either<CategoryAndQuantityUnitResponse, BountainsError>> call(
      CategoryAndQuantityUnitUseCaseParams params) async {
    return await repository.getCategoryAndQuantityUnit(
        CategoryAndQuantityUnitParams.fromJson(params.toJson()));
  }
}

class CategoryAndQuantityUnitUseCaseParams {
  final String userid;

  const CategoryAndQuantityUnitUseCaseParams({
    required this.userid,
  });

  Map<String, String> toJson() {
    return {
      "userid": userid,
    };
  }
}
