Cenario cenario; 
CarroV carrinho; 
ArrayList<Carro> carros = new ArrayList<Carro>();
//int timer;
PFont fonte; 
float posx, posy; 
int life = 2;
int fase, pontos;
int current;
int timer;
void setup() {
  fonte = createFont("pixel.TTF", 28);
  textFont(fonte);

  size(615, 600);
  fase = -1; // A FASE -1 É PRA SER O MENU, A FASE 0 É PRA SER ENQUANTO ESTÁ JOGANDO


timer = millis()/1000; 
  current = 0;

  cenario = new Cenario();
  carrinho = new CarroV(loadImage("c1.png"), 300, 500 ); //CARRO DO JOGADOR

  posy = -50;  
  posx = random(100, 350); //de 100 a 350 pq esses são os valores do tamanho da pista
  for (int i=0; i<6; i++) {
    carros.add(new CarroA(loadImage("c2.png"), posx, posy));
    posx = random(100, 350);  
    posy = -100 ;
  }

  posy = -50; 
  posx = random(100, 350); 
  for (int i=0; i<6; i++) { 
    carros.add(new CarroAz(loadImage("c3.png"), posx, posy));
    posx = random(100, 350); 
    posy = -100;
  }
}

void draw() {

  cenario.cena(); // adicionando os elementos do cenário 
  cenario.pista();

  for (int i = carros.size() - 1; i >= 0; i--) {
    Carro car = carros.get(i);   
    car.desenhar();   
    car.acelerar();
  }

  carrinho.desenhar();

  for (int i = carros.size() - 1; i >= 0; i--) {
    Carro c = carros.get(i);
    if (c.colidiu(carrinho.x, carrinho.y)) {
      carros.remove(i);
      life--;
      if (life == 0) { // SE AS VIDAS ACABAREM MUDAR PARA FASE 1 (game over)
        fase = 1;
      }
    }
   if (c.y > carrinho.x) { // TESTE *** TESTE ***
    pontos += 100;  
   }
  }

  if (fase == 1) { // A FASE 1 REPRESENTA A TELA DE GAME OVER
    background(0);
    text("GAME OVER", 95, height/2);
    text("CLIQUE EM ALGUM CANTO K", 40, 400);
  }
  
  if (fase == -1) {
    background(234);
  }

  textSize(20);
  fill(255);
  text("Road", 490, 100);
  text("Fighter", 455, 150);

 
  if (fase == 0) {
    current = millis() - timer; } 
  text("Tempo:", 480, 300);
  text(current, 500, 350);

  text("Pontos:", 480, 200);
  text(pontos, 480, 250);

  text("Vidas:", 480, 450); 
  text(life, 500, 500);

} //FIM DO DRAW


void mousePressed() { // TELA DE GAME OVER, SE CLICAR RECOMEÇA O JOGO
  if ( fase == 1 ) {
    fase = 0; 
    life = 2;
    current = 0;
    timer = millis();
  }
  if ( fase == -1 ) {
    fase = 0;
    current = 0;
    timer = millis();
  }
} 


void keyPressed() {
  if (keyCode == 37) {
    carrinho.mover(carrinho.getX() - 10);
  } else if (keyCode == 39) {
    carrinho.mover(carrinho.getX() + 10);
  } //keyCode 32
}