import ddf.minim.*;

Minim minim;
AudioPlayer coinSound;
AudioPlayer doorSound;
AudioPlayer  antiCoinSound;
AudioPlayer acidSound;
AudioPlayer winSound;

void loadSounds() {
  minim = new Minim(this);
  coinSound = minim.loadFile("Coin.wav");
  doorSound = minim.loadFile("Hit_Hurt.wav");
  antiCoinSound = minim.loadFile("antiCoin.wav");
  acidSound = minim.loadFile("acid.wav");
  winSound = minim.loadFile("Gold.wav");
}
