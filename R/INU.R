#' Función que calcula el INU
#'
#' @param Censo_Quinq Tabla Quinquenal
#' @return Tabla con elementos para el calculo del INU así como el INU
#' @export

Tab_INU <- function(Censo_Quinq){
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
    Tabla_para_INU$Edad[i] <- Censo_Quinq$Edad[i]
    Tabla_para_INU$IM[i] <- (Censo_Quinq$Hombres[i]/Censo_Quinq$Mujeres[i])*100

    if(i>1 && i<18){
      x <- i
      y <- i-1
      z <- i+1

      Tabla_para_INU$IIM[i] <- abs(Tabla_para_INU$IM[x]-Tabla_para_INU$IM[y])
      Tabla_para_INU$CEH[i] <- (2*Censo_Quinq$Hombres[x]/(Censo_Quinq$Hombres[y]+Censo_Quinq$Hombres[z]))*100
      Tabla_para_INU$DEH[i] <- abs(Tabla_para_INU$CEH[x]-100)
      Tabla_para_INU$CEM[i] <- (2*Censo_Quinq$Mujeres[x]/(Censo_Quinq$Mujeres[y]+Censo_Quinq$Mujeres[z]))*100
      Tabla_para_INU$DEM[i] <- abs(Tabla_para_INU$CEM[x]-100)
    }
  }
  return(Tabla_para_INU)
}
#' Función que calcula el INU y devuelve su categoria
#'
#' @param TablaINU Tabla Quinquenal
#' @return INU con su clasificación
#' @export
INU_f <- function(TablaINU){
    a <- 2
    b <- 17
    x1 <- 3*(sum(TablaINU$IIM[a:b]/16))
    x2 <- (sum(TablaINU$DEH[a:b]/16))
    x3 <- (sum(TablaINU$DEM[a:b]/16))
    INU  <- x1 + x2 +x3



    if(INU < 20){
      clas <- as.character("Información de calidad satisfactoria")
    }else if (INU < 40){
      clas <- as.character("Información de calidad intermedia")
    }else clas <- as.character("Información de calidad deficiente")

    return(paste(INU," :por lo tanto tenemos", clas))
}

