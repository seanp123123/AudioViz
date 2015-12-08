class Grade extends Selector
{
  AudioPlayer audio;
  
  Grade()
  {
    super();
    audio = minim.loadFile("Grade-001-Loom-Grade.mp3",512);
  }
  void playSong()
  {
    audio.rewind();
    audio.play();
    String s = "you are listening to 'Betalibrae' by Umfang";
  }
  
    AudioPlayer getSong()
  {
     return audio; 
  }
}
