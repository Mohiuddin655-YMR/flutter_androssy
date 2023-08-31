enum AuthScreenType {
  signIn("sign_in", "Sign in"),
  signUp("sign_up", "Sign up");

  final String name;
  final String title;

  const AuthScreenType(this.name, this.title);
}
