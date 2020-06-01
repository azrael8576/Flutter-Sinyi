//TODO: Multi-Consumer Class
///Consumer<LoginPageBloc>(
//                    tag: 'LoginPageBloc',
//                    builder: (BuildContext context, LoginPageBloc bloc) {
//                      return Consumer<TokenBloc>(
//                        builder: (BuildContext context, TokenBloc tokenBloc) {
//                          return TextFieldWidget(
//                            hintText: 'Email',
//                            obscureText: false,
//                            prefixIconData: Icons.mail_outline,
//                            suffixIconData: bloc.isValid ? Icons.check : null,
//                            onChange: (value) {
//                              bloc.isValidEmail(value);
//                              tokenBloc.userId = value;
//                            },
//                          );
//                        },
//                      );
//                    },
//                  ),
// TO
///MultiConsumer(List Blocs)