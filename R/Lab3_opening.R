.onAttach <- function(libreria, nombrepaqueteria) {
  ruta <- system.file("extdata", "DGM.txt", package = "Laboratorio3")
  if (nzchar(ruta)) {
    packageStartupMessage(paste(readLines(ruta, warn = FALSE), collapse = "\n"))
  }
  packageStartupMessage("\nLaboratorio3 v0.1.0 alpha build 1")
  packageStartupMessage("Creadores: Dannya Nicole Piedragil Román, Gael Peña Fonseca, Mario Enrique Mejia Ortega")

  musica<- system.file("extdata", "Xmen.wav", package = "Laboratorio3")
  if (nzchar(musica)) {
    try(beepr::beep(musica))
  }
}
