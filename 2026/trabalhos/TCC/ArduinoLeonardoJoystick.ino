// By Fillipe Welausen - 04/03/2020 - CircuitoMaker.com
// Modificado para mostrar eixos e botões pressionados no Monitor Serial

#include "Joystick.h"

Joystick_ Joystick(
  JOYSTICK_DEFAULT_REPORT_ID,
  JOYSTICK_TYPE_GAMEPAD,

  4, 2,                  // 4 botões: A, B, X, Y; 2 hat switches
  true, true, true,       // X, Y e Z
  true, true, false,      // Rx, Ry e sem Rz
  false, false,           // Sem rudder ou throttle
  false, false, false     // Sem accelerator, brake ou steering
);

// Botões de fliperama: COM -> GND, NO -> pino abaixo, NC sem conexão.
// INPUT_PULLUP: solto = HIGH; pressionado (NO ligado ao COM) = LOW.
// Índices HID 0, 1, 2, 3 representam A, B, X, Y neste projeto.

// O jogo/emulador pode exigir configurar esse mapeamento.
const int botoesPins[] = {6, 7, 8, 9};  // A, B, X, Y
const char nomesBotoes[] = {'A', 'B', 'X', 'Y'};
bool botoesAnteriores[] = {false, false, false, false};
int direcionalPins[] = {2, 3, 5, 4};  // DIREITA, ESQUERDA, BAIXO, CIMA


// Guarda os valores anteriores dos eixos
// para mostrar mensagem somente quando houver mudança
int ultimo_X = 0;
int ultimo_Y = 0;


void setup() {

  // Inicia comunicação com o Monitor Serial
  Serial.begin(9600);

  Serial.println("Joystick iniciado!");
  Serial.println("Monitorando eixos X e Y e botoes A, B, X, Y...");
  Serial.println();

  for (int x = 0; x <= 3; x++) {

    pinMode(botoesPins[x], INPUT_PULLUP);
    pinMode(direcionalPins[x], INPUT_PULLUP);

  }

  Joystick.begin(false);

  Joystick.setXAxisRange(-127, 127);
  Joystick.setYAxisRange(-127, 127);

} // fim do setup



void loop() {

  // --------------------------
  // BOTÕES
  // --------------------------

  for (int x = 0; x <= 3; x++) {

    bool pressionado = digitalRead(botoesPins[x]) == LOW;
    Joystick.setButton(x, pressionado);

    // Mostra somente ao apertar, sem repetir enquanto estiver segurado.
    if (pressionado && !botoesAnteriores[x]) {
      Serial.print("Botao ");
      Serial.print(nomesBotoes[x]);
      Serial.println(" pressionado!");
    }

    botoesAnteriores[x] = pressionado;

  }



  // --------------------------
  // EIXOS DO DIRECIONAL
  // --------------------------

  int Value_X1 = 0;
  int Value_Y1 = 0;


  // DIREITA
  if (digitalRead(direcionalPins[0]) == LOW) {

    Value_X1 = 127;

  }


  // ESQUERDA
  if (digitalRead(direcionalPins[1]) == LOW) {

    Value_X1 = -127;

  }


  // BAIXO
  if (digitalRead(direcionalPins[2]) == LOW) {

    Value_Y1 = 127;

  }


  // CIMA
  if (digitalRead(direcionalPins[3]) == LOW) {

    Value_Y1 = -127;

  }



  // --------------------------
  // MOSTRA ALTERAÇÕES NO SERIAL
  // --------------------------

  if (Value_X1 != ultimo_X || Value_Y1 != ultimo_Y) {

    Serial.print("Eixo X: ");
    Serial.print(Value_X1);

    Serial.print(" | Eixo Y: ");
    Serial.println(Value_Y1);


    // Mostra também a direção
    Serial.print("Direcao: ");

    if (Value_X1 == 127) {
      Serial.print("DIREITA ");
    }

    if (Value_X1 == -127) {
      Serial.print("ESQUERDA ");
    }

    if (Value_Y1 == 127) {
      Serial.print("BAIXO ");
    }

    if (Value_Y1 == -127) {
      Serial.print("CIMA ");
    }

    if (Value_X1 == 0 && Value_Y1 == 0) {
      Serial.print("CENTRO");
    }

    Serial.println();
    Serial.println("--------------------");


    // Salva os valores atuais
    ultimo_X = Value_X1;
    ultimo_Y = Value_Y1;

  }



  // --------------------------
  // ENVIA OS EIXOS PARA O PC
  // --------------------------

  Joystick.setXAxis(Value_X1);
  Joystick.setYAxis(Value_Y1);


  // Atualiza todos os valores do joystick
  Joystick.sendState();

  delay(10);

} // fim do loop
