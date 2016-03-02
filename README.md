# G2

## Turni

* Bob
* Jack
* Marco Costa
* Ale
* Andre
* Albe
* Valerio
* Begli

Se convincete altra gente potete sempre aggiungerla in coda

## Struttura del documento

Il file principale (quello da compilare) è `appunti.tex`, che importa:

* `macros.sty` dove vengono definite le macro per formule matematiche
* `lez-YYYY-MM-DD.tex` che contiene la lezione alla data specificata

Ogni file lezione è strutturato principalmente come sequenza di ambienti `teo`, `lemma`, `prop`, `cor`, `defn`, `oss`, `es`, `proof`, dal significato intuitivo. Il comando `\titlet{}` serve per scrivere un titoletto.

### Aggiungere una lezione

Per aggiungere una lezione:

1. creare il file `lez-YYYY-MM-DD.tex` e trascrivere la lezione prendendo a esempio i file precedenti
2. mettere in un commento all'inizio del file il proprio nome
3. mettere eventuali nuove macro in `macros.sty` (**in modo ordinato!**)
4. aggiungere `\includelesson{YYYY}{MM}{DD}` in fondo all'elenco in `appunti.tex`

## Figure in LaTeX

Il modo più semplice per ottenere figure con testo formattato da LaTeX è usare **Inkscape**:

1. Disegnare l'immagine in Inkscape, scrivendo le caselle di testo come se fossero dentro a LaTeX (cioè ricordarsi i **dollari**). Come pagina di lavoro usare un **A4 verticale** così si ha un'idea delle dimensioni.
2. Usare il comando `File->Salva una copia...`, selezionare il formato **PDF** e nella successiva finestra di dialogo selezionare **PDF+LaTeX** e **Usa dimensione oggetto esportato**. Se la vostra figura si chiama `fig.svg` questo genera i file `fig.pdf` e `fig.pdf_tex`.
3. In LaTeX, usare questo codice:

```latex
\begin{figure}
	\centering % per centrare l'immagine
	\input{fig.pdf_tex}
	\caption{didascalia}
\end{figure}
```

Nel commit, mettere **tutti e tre** i file.

## GIT
repo git = una collezione di stati di alcuni file presenti in una cartella, cioè mantiene la storia

### inizilizzare il repo
la prima volta per clonare il repository

`$ git clone [https://github.com/mcosta18/G2.git]`

questo ha creato una cartella G2 che è il repo.

### lavorare sul repo

Prima di iniziare a lavorare si scaricano gli ultimi aggiornamenti con       

`$ git pull`

Quando un set di modifiche è completo si commita, ossia si consolidano le ultime modifiche fatte (viene richiesto un commento, scriverci le modifiche apportate)

`$ git commit -a` 

poi si inviano al repo online con

`$ git pull`     <-- per scaricare eventuali modifiche fatte da altri nel frattempo

`$ git push`



### special section:
per conoscere lo stato del repo

`$ git status`

per dire a git di tracciare le modifiche di un nuovo file:

`$ git add file.ext`

per rimuovere un file

`$ git rm file.ext`

per rinominare un file

`$ git mv file.ext newfile.ext`

per sapere la storia del repo 

`$ git log`


### Makefile:
è mio, lasciatelo pure perdere (AleCandido)
