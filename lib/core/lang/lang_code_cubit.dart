import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:equatable/equatable.dart';

part 'lang_code_state.dart';

class LangCodeCubit extends Cubit<LangCodeState> {
  final UserDataRepo _userDataRepo;
  final GARepo _gaRepo;

  LangCodeCubit(this._userDataRepo, this._gaRepo) : super(LangCodeInitial()) {
    getSavedLangCode();
  }

  getSavedLangCode() {
    final currentLangCode = _userDataRepo.getString(DataAccessKeys.langCodeKey);
    emit(LangCodeLoaded(langCode: currentLangCode));
  }

  toggleLangCode() {
    final currentLangCode = _userDataRepo.getString(DataAccessKeys.langCodeKey);
    var value = "en";
    if (currentLangCode != null && currentLangCode == "en") value = "ar";
    _userDataRepo.setString(value, DataAccessKeys.langCodeKey);
    emit(LangCodeLoaded(langCode: value));
    _gaRepo.logToggleLanguage(value, _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
  }
}
