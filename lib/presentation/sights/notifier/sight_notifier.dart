import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/model/sight.dart';
import 'package:sights_app/domain/usecase/get_all_sights_use_case.dart';
import 'package:sights_app/presentation/sights/notifier/state/sight_list_state.dart';

class SightNotifier extends Notifier<SightListState> {
  late final GetAllSightsUseCase _getAllSightsUseCase;

  @override
  SightListState build() {
    _getAllSightsUseCase = ref.read(getAllSightsUseCaseProvider);
    getAllSights();
    return LoadingState();
  }

  void getAllSights() async {
    state = LoadingState();

    final result = await _getAllSightsUseCase();

    switch (result) {
      case Ok<List<Sight>>():
        state = result.value.isEmpty ? EmptyState() : SuccessState(result.value);
      case Error():
        state = ErrorState(result.error.toString());
    }
  }
}