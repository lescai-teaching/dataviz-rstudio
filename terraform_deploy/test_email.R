
ip_address = "123.345.567.87"
name = "Pippo Pippone"

test_email = compose_email(
  header = md(
    c(
      "# Insegnamento di Bioinformatica",
      "## Biologia Sperimentale e Applicata"
    )
  ),
  body = md(
            c(
              paste0("Gentile ", name),
              "",
              "Per svolgere l'esercitazione dell'esame puoi connetterti al seguente indirizzo IP:",
              "",
              paste0("virtual machine ip = ", ip_address),
              "",
              "",
              "Questo significa che per usare il container VScode, devi connetterti alla URL:",
              "",
              paste0(ip_address,":8443"),
              "",
              "non sarà necessaria alcuna password.",
              "",
              "",
              "Per usare invece il container RStudio, dovrai usare la URL:",
              "",
              paste0(ip_address,":8787"),
              "",
              "Anche in questo caso senza password.",
              "",
              "",
              "",
              "Per collegarti alla virtual machine puoi usare sia UNIPV-WIFI che eduroam.",
              "",
              "**Questo indirizzo è valido esclusivamente oggi e per il tempo assegnato alla parte scritta dell'esame**"
            )
    ),
  footer = md(
    "Questa mail è inviata per conto del Corso di Laurea Magistrale in Biologia Sperimentale e Applicata"
  )
)
