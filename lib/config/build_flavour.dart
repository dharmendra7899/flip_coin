abstract class BuildFlavor {
  BuildFlavor();
}

class Prod extends BuildFlavor {
  static const appTitle = "Flip Coin";
  static const baseUrl = "https://sadhan-api.com/api/v1";
}

class Dev extends BuildFlavor {
  static const appTitle = "Flip Coin Dev";
  static const baseUrl = "https://sadhan-api.com/api/v1";
}

class Test extends BuildFlavor {
  static const appTitle = "Flip Coin Test";
  static const baseUrl = "https://sadhan-api.com/api/v1";
}
