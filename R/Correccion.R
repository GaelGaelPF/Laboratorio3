#' Funcion tabla corregida
#' @param TablaQ Tabla Quinquenal
#' @return Tablacorregida
#' @export
Correccion<-function(TablaQ){

  HombresC<-vector(mode="numeric",length=18)
  MujeresC<-vector(mode="numeric",length=18)
  TablaC<-data.frame(TablaQ,HombresC,MujeresC)

  for(i in 1:18){
    if(i>2&i<17){
      TablaC$HombresC[i]<-round(((-TablaC$Hombres[i+2])+(4*TablaC$Hombres[i+1])+(10*TablaC$Hombres[i])+(4*TablaC$Hombres[i-1])+(-TablaC$Hombres[i-2]))/16,digits=0)
      TablaC$MujeresC[i]<-round(((-TablaC$Mujeres[i+2])+(4*TablaC$Mujeres[i+1])+(10*TablaC$Mujeres[i])+(4*TablaC$Mujeres[i-1])+(-TablaC$Mujeres[i-2]))/16,digits=0)
    }else{TablaC$HombresC[i]<-TablaC$Hombres[i]
    TablaC$MujeresC[i]<-TablaC$Mujeres[i]}
  }

  Edad<-TablaC$Edad
  Hombres<-TablaC$HombresC
  Mujeres<-TablaC$MujeresC
  EstadoC<-data.frame(Edad,Hombres,Mujeres)

  return(EstadoC)

}
