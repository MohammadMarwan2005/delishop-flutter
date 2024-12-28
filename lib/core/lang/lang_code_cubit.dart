import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:equatable/equatable.dart';

part 'lang_code_state.dart';

class LangCodeCubit extends Cubit<LangCodeState> {
  final UserDataRepo userDataRepo;

  LangCodeCubit(this.userDataRepo) : super(LangCodeInitial()) {
    getSavedLangCode();
  }

  getSavedLangCode() {
    final currentLangCode = userDataRepo.getString(DataAccessKeys.langCodeKey);
    print("currentLangCode: $currentLangCode");
    emit(LangCodeLoaded(langCode: currentLangCode));
  }

  toggleLangCode() {
    final currentLangCode = userDataRepo.getString(DataAccessKeys.langCodeKey);
    var value = "en";
    if (currentLangCode != null && currentLangCode == "en") value = "ar";
    userDataRepo.setString(value, DataAccessKeys.langCodeKey);
    emit(LangCodeLoaded(langCode: value));
  }
}
