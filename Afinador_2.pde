
//package Imagenes;
//import Imagenes.*;
import ddf.minim.AudioInput;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;


  

  public NotasFrecuencias notasFrecuencias = new NotasFrecuencias();
  Minim minim; 
  //AudioPlayer player; 
  AudioInput player;
  FFT fftLin;
  int cont=0;
  String cuerda = "QUINTA";
  int tiempoCancion;
  float diferencia;
  int posicionAnalisis;
  PImage img;
  int largo=600;
    int ancho=800;


  FloatList freqs = new FloatList();

  public void setup(){
    
    //int titleBarHt = getBounds().y;
    //size(ancho, largo-titleBarHt);
    
    size(ancho,largo, P2D);
    img = loadImage("velocimetro.png");
    minim = new Minim(this);
    //player=minim.getLineIn(Minim.MONO, 32768, 44100);
    
    
    
    int frecuenciaMuestreo = notasFrecuencias.getFrecuenciaMuestreoCuerda(cuerda);
                posicionAnalisis = notasFrecuencias.getPosicionAnalisis(cuerda);
    player=minim.getLineIn(Minim.MONO, frecuenciaMuestreo, 44100);
  
    
  }

  public void draw(){
    
    
    textSize(30);
    text("   ",50,50);
    
    background (255);
    image(img,0,0,ancho,largo);
   
    
    
    
    int tiempo =120;
    float[]intervalo;
    //if( cont < tiempo ){
      //println(in.sampleRate());
      //background(40);
      //stroke(255);
      //println("Tam Buffer   "+player.mix.size());
      fftLin = new FFT(player.mix.size(), 44100 );
      fftLin.forward(player.mix);
      float a[] = fftLin.getSpectrumReal();
      float max= a[0];
      int posicionMax = 0;

      for(int i = 0; i <posicionAnalisis; i++){
        if(a[i]>max){
          max = a[i];
          posicionMax = i;  
        }

      }
      //println(posicionMax);
      float freq = fftLin.getBandWidth() * posicionMax;

      //println("Frecuencia:"+ freq);

      //println("Ancho de Banda : "+ fftLin.getBandWidth());

      /*
      for (int i = 0; i < fftLin.specSize(); i++){
        // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        line(i, height, i, height - fftLin.getBand(i) * 4);
      }
      //freqs.append(posicionMax*fftLin.getBandWidth());
      */
                        
                        print(freq);
                        
                        
      float diferencia = notasFrecuencias.getFrecuenciaDiferencia(cuerda, freq);
      
      int aceptacion[]={0,0};
                        if (cuerda=="TERCERA"){
                            aceptacion[0]=103;
                            aceptacion[1]=97;
                        }
                        else{
                            aceptacion[0]=101;
                            aceptacion[1]=99;
                        }
                            
                            
      //ellipse(200,200,300,300);
      float porcentaje=notasFrecuencias.getPorcentaje(notasFrecuencias.getIdeal(cuerda), freq);
      
      textSize(20);
      text("ACTUAL: "+freq, ancho/3,largo/2+30);
                        
                        textSize(20);
      text("IDEAL: "+notasFrecuencias.getIdeal(cuerda), ancho/3,largo/2+80);
      
      textSize(30);
      text("   ",50,50);
      
      
      if(porcentaje>100 && porcentaje <aceptacion[0]){
        line(ancho/2-ancho/12,largo/8,ancho/2,largo/2);                                
                                fill(0,0,0);
        
        //rect(20,20,60,60);
        //line(60,20,50,100);
      }
      
                        else if(porcentaje>aceptacion[1] && porcentaje <100){
                          line(ancho/2+ancho/12,largo/8,ancho/2,largo/2);
                                fill(0,0,0);
        //fill(0,255,0);
                        }
                         else if(porcentaje>90 && porcentaje <aceptacion[1]){
                          line((ancho*5/7),largo/5,ancho/2,largo/2);                                
                                fill(0,0,0);
        //fill(0,255,255);
                        }
                        else if(porcentaje>aceptacion[0] && porcentaje <110){
                                line(ancho*2/7,largo/5,ancho/2,largo/2);
                                fill(0,0,0);
                          
                          //fill(255,0,0);
                        }
                        else if(porcentaje>110 && porcentaje <120){
                          line(ancho/6,largo/4,ancho/2,largo/2);
                                fill(0,0,0);
        //fill(0,0,255);
                        }                       
                        else if(porcentaje>80 && porcentaje <90){
                            line(ancho*5/6,largo/4,ancho/2,largo/2);                                
                                fill(0,0,0);
        //fill(255,0,255);
                        }
                        else if(porcentaje >120){
                            line(ancho/7,largo/2-largo/9,ancho/2,largo/2);
                                
                                fill(0,0,0);                                
                                //fill(255,255,0);
  }
                        else if(porcentaje <80){
                             line(ancho*6/7,largo/2-largo/9,ancho/2,largo/2);                                                        
                            fill(0,0,0);
  }
                            
        
                  
      textSize(30);
      text("   ",50,50);
        
        
      //line(200,50,200,350);
      //line(200,50,200,200);
      //println("Diferenccia: "+ diferencia);
      println("Porcentaje: "+ porcentaje+"%");
      //System.out.println(diferencia);
        
    }
  /*
  else{
      try {
        //println(freqs);
        Thread.sleep(5000);
      } catch(InterruptedException ex) {
        Thread.currentThread().interrupt();
      }
    }

    cont++;
    println("contadora: "+cont);
    if (cont == tiempo){
      FloatList freqi = new FloatList();
      IntList veces = new IntList();
      int aparece = 0;
      for(int i=0; i<freqs.size();i++){
        //println(freqs.get(i) +" - "+ i);
        for(int k=0; k<freqi.size();k++){
          if((float)freqs.get(i) == (float)freqi.get(k)){
            aparece++;
            //println(aparece);
            veces.set(k, (((Integer)veces.get(k))+1));
            break;
          }
        }
        if(aparece == 0){
          freqi.append(freqs.get(i));
          veces.append(1);
        }
        aparece = 0;
      }
      println(freqs);
      println("Fre i: "+freqi);
      println("veces i: "+veces);
      
      float diferencia = notasFrecuencias.getFrecuenciaDiferencia(cuerda, freqi.get(veces.maxIndex()));
      
      System.out.println(diferencia);
      
      */

    //}
  //}




