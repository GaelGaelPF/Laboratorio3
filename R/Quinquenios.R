#' Función para agrupar por grupos Quinquenales
#'
#' @param x Tabla M
#' @return Tabla agrupada por grupos quinquenales
#' @export

Quinquenios <- function(Censo){

  edad    <- vector(mode = "numeric", length = 18)
  hombres <- vector(mode = "numeric", length = 18)
  mujeres <- vector(mode = "numeric", length = 18)
  Tabla5nios <- data.frame(Edad = edad,
                           Hombres = hombres,
                           Mujeres = mujeres)
  for (i in 1:18){
    if (i < 18){

      Tabla5nios$Edad[i] <- paste(5*i - 5, "-", 5*i - 1)
      x <- 5*i - 4
      y <- 5*i
      Tabla5nios$Hombres[i] <- sum(Censo$Hombres[x:y])
      Tabla5nios$Mujeres[i] <- sum(Censo$Mujeres[x:y])

    } else {

      Tabla5nios$Edad[i] <- "85 y +"
      Tabla5nios$Hombres[i] <- sum(Censo$Hombres[86:101])
      Tabla5nios$Mujeres[i] <- sum(Censo$Mujeres[86:101])
    }
  }
}
