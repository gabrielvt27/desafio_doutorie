abstract class FormStatus {}

class InitialFormStatus extends FormStatus {
  InitialFormStatus();
}

class FormSubmitting extends FormStatus {}

class FormSubmitted extends FormStatus {}

class FormError extends FormStatus {
  final String messageError;

  FormError({
    required this.messageError,
  });
}
