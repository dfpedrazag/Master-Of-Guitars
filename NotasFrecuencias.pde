public class NotasFrecuencias {

        float[] frecuencias = {(float)0.0,(float)0.0,(float)0.0,(float)73.41,(float)77.78, (float)82.40, (float)87.30, (float)92.49, (float)97.99, (float)103.82, (float)110, (float)116.54, (float)123.47, 
                        (float)130.81, (float)138.59, (float)146.83,(float)155.56, (float)164.81, (float)174.61, (float)184.99, (float)195.99, (float)207.65, (float)220,
                        (float)233.08, (float)246.94, (float)261.62, (float)277.18, (float)293.66, (float)311.12, (float)329.62, (float)349.22, (float)369.99, (float)391.99,
                        (float)415.30, (float)440, (float)466.16, (float)493.88, (float)523.25, (float)554.36, (float)587.32,(float) 622.25,(float)659,25,(float)698.45,(float)739.98,(float)783,99};

        String[] notas = {"TRS0","TRS","TRS1","XX","RE#2", "MI2", "FA2", "FA#2", "SOL2", "SOL#2", "LA2", "LA#2", "SI2", "DO3", "DO#3" ,"RE3",
                        "RE#3", "MI3", "FA3", "FA#3", "SOL3", "SOL#3", "LA3", "LA#3", "SI3", "DO4", "DO#4" ,"RE4",
                        "RE#4", "MI4", "FA4", "FA#4", "SOL4", "SOL#4", "LA4", "LA#4", "SI4", "DO5", "DO#5" ,"RE5","RE#5","MI5","FA5","FA#5","XX"};
        public String a;

        public void imprimirNotas(){
                for(int i=0;i<frecuencias.length;i++){
                        System.out.println("Nota:   " + notas[i] + "   Frecuencia:   " + frecuencias[i]);
                }
        }
        
        public float getIdeal(String cuerda){
                float resultado=0;
                if(cuerda=="PRIMERA")
                        resultado=frecuencias[29];
                if(cuerda=="SEGUNDA")
                        resultado=frecuencias[24];
                if(cuerda=="TERCERA")
                        resultado=frecuencias[20];
                if(cuerda=="CUARTA")
                        resultado=frecuencias[15];
                if(cuerda=="QUINTA")
                        resultado=frecuencias[10];
                if(cuerda=="SEXTA")
                        resultado=frecuencias[5];
                
                return resultado;
                                        
        }
        
        
        public float getPorcentaje(float ideal, float freq){
                
                                
                return (ideal/freq)*100;
                
        }

        public int getfrecuenciaMuestreo(String nota){
                int i= getIndiceNota(nota);
                if(i==0){
                        System.out.println("La nota no existe");
                }
                else{
                        if(i<13){
                                return 32768;
                        }
                        if(i>12 && i<25){
                                return 16384;
                        }
                        if(i>24){
                                return 8192;
                        }
                }
                
                System.out.println("Hay un error en el metodo getFrecuenciaMuestreo");
                return 0;

        }

        public int getIndiceNota(String nota){
                int indice = 0;
                for(int i=1;i<frecuencias.length-1;i++){
                        if(notas[i].equals(nota)){
                                indice = i;
                                return indice;
                        }
                }
                System.out.println("La nota no existe");
                return indice;

        }
        
        public int obtenerPosicion(float ideal, float ancho){
            int resultado=(int)Math.floor((ideal*1.5)/ancho)+1;
            //System.out.println("ideal: "+ideal);
            //System.out.println("ancho: "+ancho);
           // System.out.println("resultado: "+resultado);
            return resultado;
            
        }
        

        public float[] intervaloAceptacion(String nota){
                int i= getIndiceNota(nota);
                float[] intervalo = {(float)0, (float)0};


                intervalo[0] = ((frecuencias[i]-frecuencias[i-1])/2) +  frecuencias[i-1];
                intervalo[1] = ((frecuencias[i+1]-frecuencias[i])/2) +  frecuencias[i];
                
                return intervalo;
        }
        
        public float getFrecuencia(String nota){
                int i = getIndiceNota(nota);
                return frecuencias[i];
        }
        
        
        
        
        public int getFrecuenciaMuestreoCuerda(String cuerda){
                if(cuerda.equals("PRIMERA")||cuerda.equals("SEGUNDA")||cuerda.equals("TERCERA")){
                        return 16384;                   
                }
                
                if(cuerda.equals("CUARTA")||cuerda.equals("QUINTA")||cuerda.equals("SEXTA")){
                        return 32768;                   
                }
   
                
                System.out.println("La cuerda no existe");
                return 2;
                
                

                
        }
        
        //Si la frecuencia es mayor a la ideal, se devuelve un numero positivo
        //Si la frecuencia es menor a la ideal, se devuelve un numero negativo
        
        public float getFrecuenciaDiferencia(String cuerda,float frecuencia){
                //
                if(cuerda.equals("PRIMERA")){
                        return frecuencia - frecuencias[26];    
                        
                }
                
                if(cuerda.equals("SEGUNDA")){                   
                        return frecuencia - frecuencias[21];            
                        
                }
                
                if(cuerda.equals("TERCERA")){
                        return frecuencia - frecuencias[17];            
                        
                }
                
                if(cuerda.equals("CUARTA")){
                        return frecuencia - frecuencias[12];
                        
                        
                }
                
                if(cuerda.equals("QUINTA")){
                        return frecuencia - frecuencias[7];
                        
                        
                }
                
                if(cuerda.equals("SEXTA")){
                        return frecuencia - frecuencias[2];
                        
                }       
                 System.out.println("La cuerda no existe");
                return 10000;
        }
        
        public int getPosicionAnalisis(String cuerda){
            if(cuerda.equals("SEXTA")||cuerda.equals("QUINTA")){
                return 112;
            }
            else{
                return 126;
            }
            
        }
        
        
        
        




}

