// By Fillipe Welausen - 04/03/2020 - CircuitoMaker.com
// Modificado para mostrar movimentação dos eixos no Monitor Serial

#include "Joystick.h"

Joystick_ Joystick(
  JOYSTICK_DEFAULT_REPORT_ID,
  JOYSTICK_TYPE_GAMEPAD,

  8, 2,                  // Button Count, Hat Switch Count
  true, true, true,       // X, Y e Z
  true, true, false,      // Rx, Ry e sem Rz
  false, false,           // Sem rudder ou throttle
  false, false, false     // Sem accelerator, brake ou steering
);

int botoes1Pins[] = {0, 1, 2, 3};         // A, B, X, Y
int ledsPins[] = {A0, A1, A2, A3};        // LEDs dos botões A, B, X, Y
int botoes2Pins[] = {4, 5, 6, 7};         // L, R, START, SELECT
int direcionalPins[] = {2, 3, 5, 4};  // DIREITA, ESQUERDA, BAIXO, CIMA


// Guarda os valores anteriores dos eixos
// para mostrar mensagem somente quando houver mudança
int ultimo_X = 0;
int ultimo_Y = 0;


void setup() {

  // Inicia comunicação com o Monitor Serial
  Serial.begin(9600);

  Serial.println("Joystick iniciado!");
  Serial.println("Monitorando eixos X e Y...");
  Serial.println();

  for (int x = 0; x <= 3; x++) {

    pinMode(botoes1Pins[x], INPUT_PULLUP);
    pinMode(botoes2Pins[x], INPUT_PULLUP);
    pinMode(ledsPins[x], OUTPUT);
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

    if (digitalRead(botoes1Pins[x]) == LOW) {

      Joystick.setButton(x, 1);

      // Desliga LED correspondente ao botão pressionado
      digitalWrite(ledsPins[x], LOW);

    }
    else {

      Joystick.setButton(x, 0);

      // Liga LED correspondente ao botão solto
      digitalWrite(ledsPins[x], HIGH);

    }


    if (digitalRead(botoes2Pins[x]) == LOW) {

      Joystick.setButton(x + 4, 1);

    }
    else {

      Joystick.setButton(x + 4, 0);

    }

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
