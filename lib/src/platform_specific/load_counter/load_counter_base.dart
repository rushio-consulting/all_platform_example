abstract class LoadCounterBase {
  final String path;

  LoadCounterBase(this.path);

  Future<int> loadCounter();
}
