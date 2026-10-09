#' Función que calcula el INU
#'
#' @param Censo_Quinq Tabla Quinquenal
#' @return Tabla con elementos para el calculo del INU así como el INU
#' @export

INU <- function(Censo_Quinq){
  Edad <- vector(mode = "numeric", length = 18)
  IM   <- vector(mode = "numeric", length = 18)
  IIM  <- vector(mode = "numeric", length = 18)
  CEH  <- vector(mode = "numeric", length = 18)
  DEH  <- vector(mode = "numeric", length = 18)
  CEM  <- vector(mode = "numeric", length = 18)
  DEM  <- vector(mode = "numeric", length = 18)

  Tabla_para_INU <- data.frame(Edad = Edad,
                           IM = IM,
                           IIM = IIM,
                           CEH = CEH,
                           DEH = DEH,
                           CEM = CEM,
                           DEM = DEM
                                     )
  for(i in 1:18){
    Edad[i] <- Censo_Quinq$Edad[i]
    Tabla_para_INU$IM[i] <- (Censo_Quinq$Hombres[i]/Censo_Quinq$Mujeres[i])*100

    if(i>1 && i<18){
      x <- i
      y <- i-1
      Z <- i+1

      Tabla_para_INU$IIM[i] <- abs(Tabla_para_INU$IM[X]-Tabla_para_INU$IM[y])
      Tabla_para_INU$CEH[i] <- (2*Censo_Quinq$Hombres[X]/(Censo_Quinq$Hombres[y]+Censo_Quinq$Hombres[y]))*100
      Tabla_para_INU$DEH[i] <- abs(Tabla_para_INU$CEH[X]-100)
      Tabla_para_INU$CEM[i] <- (2*Censo_Quinq$Mujeres[X]/(Censo_Quinq$Mujeres[y]+Censo_Quinq$Mujeres[y]))*100
      Tabla_para_INU$DEM[i] <- abs(Tabla_para_INU$CEM[X]-100)
    }
  }
  return(Tabla_para_INU)
}
