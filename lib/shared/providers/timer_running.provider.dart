import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerRunningState {
  final bool isRunning;
  final bool breakRecord;
  const TimerRunningState({this.isRunning = false, this.breakRecord = false});

  TimerRunningState copyWith({bool? isRunning, bool? breakRecord}) {
    return TimerRunningState(
      isRunning: isRunning ?? this.isRunning,
      breakRecord: breakRecord ?? this.breakRecord,
    );
  }
}

class TimerRunningNotifier extends Notifier<TimerRunningState> {
  @override
  TimerRunningState build() => const TimerRunningState();

  void toggle() => state = state.copyWith(isRunning: !state.isRunning);
  void setRunning(bool value) => state = state.copyWith(isRunning: value);
  void setBreakRecord(bool value) => state = state.copyWith(breakRecord: value);
}

final timerRunningProvider =
    NotifierProvider<TimerRunningNotifier, TimerRunningState>(
      () => TimerRunningNotifier(),
    );
