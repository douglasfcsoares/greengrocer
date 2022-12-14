import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //VARIÁVEL QUE RECEBE O TAMANHO DA TELA DO DISPOSITIVO.
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sizeScreen.height,
          width: sizeScreen.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //#################### NOME DO APP

                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'grocer',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          )
                        ],
                      ),
                    ),

                    //#################### CATEGORIAS ANIMADAS

                    SizedBox(
                      height: 50,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //#################### FORMULÁRIO LOGIN

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //#################### EMAIL

                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    //#################### SENHA

                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),

                    //#################### BOTÃO ENTRAR

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (c) {
                                  return const BaseScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                    ),

                    //#################### BOTÃO ESQUECEU A SENHA

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a Senha?',
                          style: TextStyle(
                              color: CustomColors.customContrastColor),
                        ),
                      ),
                    ),

                    //#################### DIVISOR

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //#################### BOTÃO CRIAR CONTA

                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            )),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return SignUpScreen();
                            }),
                          );
                        },
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
