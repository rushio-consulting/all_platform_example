abstract class RcCrossPreferencesBase {
  Future<void> setInt(String key, int value);

  int getInt(String key, {int defaultValue});
}
