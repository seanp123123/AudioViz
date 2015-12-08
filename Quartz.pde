class Quartz extends Selector
{
  AudioPlayer audio;
  
  Quartz()
  {
    super();
    audio = minim.loadFile("3645572_Quartz_Original_Mix.mp3",512);
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
