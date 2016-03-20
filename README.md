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

Se convincete altra gente potete sempre aggiungerla in coda.

## Checklist

Visti i pocci che vengono pushati, ho scritto delle checklist da applicare per controllare le trascrizioni e per caricare le modifiche.

### Checklist prima del push

* *Regola d'oro*: il codice LaTeX compila senza errori.
* Non ci sono merge incompleti.

### Checklist controllo lezione

Questo è un elenco di critiche/correzioni emerse nella lettura delle lezioni e del loro codice. È bene controllare la propria lezione usando questa checklist.

Per chi ha voglia, consiglio di dare una letta veloce ma completa ai capitoli 2--4 del [wikibook su LaTeX](https://en.wikibooks.org/wiki/LaTeX).

* Usare notazioni consistenti.
* Fare un uso equilibrato di formule e testo.
* Usare le macro in `macros.sty`.
* Mettere i punti alla fine delle frasi.
* Controllare le parole in italiano.
* Usare paragrafi (doppio a capo) anziché `\\`.
* Usare `\dots`, `\ldots`, `\cdots` anziché `...` o `···`.
* Usare `\caption` nell'ambiente `figure`.
* Usare `\setminus` per la differenza insiemistica.
* Usare `\[...\]` o l'ambiente `equation*` anziché `\\$...$`.
* Dopo il "per ogni" usare i due punti se opportuno, es.: "∀x:P(x)" e non "∀x,P(x)".
* Gli intervalli scritti con i puntini devono usare in modo uniforme le virgole, es.: "a,...,z" e non "a,... z".
* Per le funzioni standard, usare `\operatorname` o `\DeclareMathOperator` anziché scriverle come se fossero variabili in fila.
* Usare `\text{testo}` per inserire del testo negli ambienti matematici.

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

1. Disegnare l'immagine in Inkscape (oppure in un altro programma e poi esportarla in SVG), scrivendo le caselle di testo come se fossero dentro a LaTeX (cioè ricordarsi i **dollari**). Come pagina di lavoro usare un **A4 verticale** così si ha un'idea delle dimensioni.
2. Usare il comando `File->Salva una copia...`, selezionare il formato **PDF** e nella successiva finestra di dialogo selezionare **PDF+LaTeX** e **Usa&nbsp;dimensione&nbsp;oggetto&nbsp;esportato**. Se la vostra figura si chiama `fig.svg` questo genera i file `fig.pdf` e `fig.pdf_tex`.
3. In LaTeX, usare questo codice:

```latex
\begin{figure}
	\centering % per centrare l'immagine
	\input{fig.pdf_tex}
	\caption{didascalia}
\end{figure}
```

Nel commit, mettere **tutti e tre** i file.

Un modo leggermente più laborioso, sempre da Inkscape, è usare l'estensione **[svg2tikz](https://github.com/kjellmf/svg2tikz)**:

1. Installare l'estensione come descritto nelle [istruzioni](https://github.com/kjellmf/svg2tikz/blob/master/docs/install.rst).
2. Disegnare come sopra.
3. Usare il comando `Estensioni->Esporta->Export to TikZ path...`, le opzioni che vi consiglio sono **Tikzpicture**, **Raw&nbsp;TeX** e **Export&nbsp;to&nbsp;clipboard**. Incollare il testo in un file `fig.tikz`, e importarlo nel documento come sopra:

```latex
\input{fig.tikz}
```

Le figure possono anche essere disegnate direttamente in LaTeX usando **tikz**. Per certi tipi di disegni, è anche più comodo dei programmi a interfaccia grafica, a parità di qualità del risultato. Una guida rapida ai comandi di base si trova sul solito [wikibook](https://en.wikibooks.org/wiki/LaTeX/PGF/TikZ); la documentazione ufficiale del pacchetto è buona e completa ma se vi trovate a doverla leggere, forse facevate prima a usare un programma a interfaccia grafica.

### `figure` VS non-`figure`

Il primo uso dell'ambiente `figure` può essere traumatico perché non posiziona la figura dove la definiamo. In effetti in un libro stampato le figure non sono ficcate in mezzo al testo ma magari di lato, quello che è importante è che testo e figura siano nella stessa coppia di facciate. Per questo è anche importante **usare la caption**.

È futile discutere con il LaTeX per fargli mettere la figura dove volete, perché `figure` non è fatto per questo. Piuttosto usate qualcosa del genere (che comunque sconsiglio):

```latex
\begin{center}
  \input{fig.pdf_tex}
\end{center}
```

## Git

Git è un *version control system*, cioè man mano che lavori su dei file lui salva delle istantanee. È utile per poter tornare indietro in caso di pocci e per lavorare in modo condiviso sui file: le uniche modifiche che si possono condividere sono quelle già catturate in un'istantanea.

Fare un *commit* significa fare una di queste istantanee. Si suppone che gli utenti facciano il commit solo quando lo stato delle loro modifiche è 'consistente' (es. il codice LaTeX compila senza errori).

L'insieme delle istantanee è la *repository*. Per lavorare in condivisione, la 'versione ufficiale' della repository viene tenuta su un server (in questo caso GitHub). Ogni utente copia (*clona*) tutta la repository sul suo computer per poterci lavorare.

### Usare git

Il ciclo tipico di utilizzo è:

1. Aggiornare la repository locale (*pullare*).
2. Modificare i file.
3. Fare il commit.
4. Pullare, per gestire eventuali conflitti (se qualcun altro ha modificato gli stessi file).
5. Eventualmente fare un commit dopo la risoluzione dei conflitti (**importante**).
6. Aggiornare la repository remota (*pushare*).

Per eseguire questi passaggi, si può usare un programma a interfaccia grafica (**consigliato**) oppure direttamente `git` da terminale.

I programmi GUI che consiglio (li ho provati sul Mac, ci sono anche per Windows):

* [GitHub desktop](https://desktop.github.com) il programma ufficiale di GitHub. Molto semplice da usare.
* [SourceTree](https://www.sourcetreeapp.com) comunque semplice da usare ma con più funzionalità. Anche lui supporta direttamente gli account GitHub.

Altri programmi (anche per Linux) si trovano [sul sito di git](https://git-scm.com/download/gui/linux).

Elenchiamo ora gli specifici comandi di `git`. Dovrebbe essere facile trovare i comandi corrispondenti nei programmi a interfaccia grafica.

#### Creare la copia locale

Per iniziare a lavorare sulla repository bisogna clonarla. Spostarsi nella cartella dove si vuole tenere la repository ed eseguire il comando:

`git clone https://github.com/mcosta18/G2.git`

Questo crea una cartella `G2` nella cartella corrente. Prima di eseguire gli altri comandi, **spostarsi nella cartella `G2`**.

#### Pullare e pushare

Per aggiornare la copia **locale**:

`git pull`

Per aggiornare la copia **remota** da quella locale:

`git push`

#### Commit

Per fare un commit, il comando è

`git commit`

Tuttavia c'è qualche dettaglio in più da sapere. Se abbiamo creato nuovi file, git non ne tiene traccia se non glielo diciamo esplicitamente con il comando:

`git add file.estensione`

Ovviamente c'è anche il comando per rimuovere file:

`git rm file.estensione`

Se volete cambiare nome a un file, anziché [rimuoverlo, rinominarlo, riaggiungerlo] si può usare:

`git mv file.estensione nuovonome.estensione`

Prima di fare il commit, per sapere quali file sono stati modificati rispetto al commit precedente e se ci sono file aggiunti o rimossi, usare:

`git status`

Per vedere gli ultimi commit:

`git log`

##### Messaggio di commit

`git` vi imporrà di scrivere un messaggio di commit. Il messaggio di commit tipico ha questa struttura:

* Una riga corta (≲ 50 caratteri) che riassume le modifiche.
* Eventualmente tutti i commenti che vi passano per la testa (*dopo* la riga corta).

Quando usate semplicemente `git commit` di solito venite infognati in un editor da terminale. In pratica la cosa più comoda da fare è:

`git commit -a -F -`

Dove `-a` aggiunge in automatico i nuovi file e `-F -` vi fa digitare il messaggio di commit direttamente come da riga di comando (non potete cancellare dopo essere andati a capo, e per terminare il messaggio dovete usare `Ctrl+D`).

Per sapere quali file vanno aggiunti da `-a` e quali non interessano, `git` legge il file `.gitignore`. Dopo averci dato un occhiata, è abbastanza intuitivo come usarlo.

## Makefile:

È mio, lasciatelo pure perdere (AleCandido)
