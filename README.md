# G2

## GIT
repo git = una collezione di stati di alcuni file presenti in una cartella, cioè mantiene la storia

### inizilizzare il repo
la prima volta per clonare il repository

$ git clone https://github.com/mcosta18/G2.git

questo ha creato una cartella G2 che è il repo.

### lavorare sul repo

Prima di iniziare a lavorare si scaricano gli ultimi aggiornamenti con       

$ git pull

Quando un set di modifiche è completo si commita, ossia si consolidano le ultime modifiche fatte (viene richiesto un commento, scriverci le modifiche apportate)

$ git commit -a 

poi si inviano al repo online con

$ git pull     <-- per scaricare eventuali modifiche fatte da altri nel frattempo

$ git push



### special section:
per conoscere lo stato del repo

$ git status

per dire a git di tracciare le modifiche di un nuovo file:

$ git add file.ext

per rimuovere un file

$ git rm file.ext

per rinominare un file

$ git mv file.ext newfile.ext

per sapere la storia del repo 

$ git log

