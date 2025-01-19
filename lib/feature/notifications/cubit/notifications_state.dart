part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final UIState<int> unreadNotificationsCount;

  const NotificationsState(this.unreadNotificationsCount);

  @override
  List<Object?> get props => [unreadNotificationsCount];

  NotificationsState copyWith({final UIState<int>? unreadNotificationsCount}) {
    return NotificationsState(
        unreadNotificationsCount ?? this.unreadNotificationsCount);
  }
}
