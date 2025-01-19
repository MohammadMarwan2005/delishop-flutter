import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/notifications_repo.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
      : super(const NotificationsState(UIState(isLoading: true))) {
    fetchUnreadCount();
  }

  Future<void> fetchUnreadCount() async {
    emit(state.copyWith(unreadNotificationsCount: const UIState(isLoading: true)));
    final response = await _notificationsRepo.getUnreadNotificationsCount();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            unreadNotificationsCount: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            unreadNotificationsCount: UIState(error: domainErrorModel)));
      },
    );
  }
}
