enum ApiState { initial, loading, success, error }

class Resources<E> {
  E? data;
  String? massageError;
  bool isLoading = false;
  late ApiState apiState;

  Resources({required this.apiState, this.data, this.massageError});

  Resources.loading() {
    apiState = ApiState.loading;
    isLoading = true;
  }
  Resources.success(this.data) {
    apiState = ApiState.success;
   }
  Resources.error(String massageError) {
    apiState = ApiState.error;
  }
  Resources.initial() {
    apiState = ApiState.initial;
   }
}