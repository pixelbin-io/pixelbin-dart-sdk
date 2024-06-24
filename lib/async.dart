import 'dart:async';

class Semaphore {
  final int _maxConcurrent;
  int _currentCount = 0;
  final _queue = <Completer<void>>[];
  final Function onEachCompleted;

  Semaphore(this._maxConcurrent, {required this.onEachCompleted});

  Future<void> acquire() {
    if (_currentCount < _maxConcurrent) {
      _currentCount++;
      return Future.value();
    } else {
      final completer = Completer<void>();
      _queue.add(completer);
      return completer.future;
    }
  }

  void release() {
    if (_queue.isNotEmpty) {
      final completer = _queue.removeAt(0);
      completer.complete();
    } else {
      _currentCount--;
    }
  }

  Future<T> withPermit<T>(Future<T> Function() action) async {
    await acquire();
    try {
      final stopwatch = Stopwatch()..start();
      final t = await action();
      onEachCompleted(stopwatch.elapsed.inMilliseconds);
      stopwatch.stop();
      return t;
    } finally {
      release();
    }
  }
}
