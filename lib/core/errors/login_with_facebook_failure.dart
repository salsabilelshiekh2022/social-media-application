class LogInWithFacebookFailure implements Exception {
  const LogInWithFacebookFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithFacebookFailure.fromError(String error) {
    switch (error) {
      case 'operation-in-progress':
        return const LogInWithFacebookFailure(
          'Another Facebook login operation is already in progress.',
        );
      case 'cancelled':
        return const LogInWithFacebookFailure(
          'Facebook login was cancelled by the user.',
        );
      case 'failed':
        return const LogInWithFacebookFailure(
          'Facebook login failed. Please try again later.',
        );
      default:
        return const LogInWithFacebookFailure();
    }
  }

  final String message;
}
