# Baby Adventures — Guida per il genitore ("Drago e Castello")

Skill **text-only** per l'app **Google AI Edge Gallery** (modelli Gemma
on-device, funziona anche offline).

Questa skill **non gioca con il bambino**: aiuta **te genitore** a raccontare
la storia. Le chiedi un'avventura e lei ti prepara il **copione completo** —
trama, cosa dire scena per scena e **quali stickers spostare** sul tabellone di
carta *Dragon and Castle*. Poi tu racconti a parole tue e muovi i personaggi.

![Il tabellone Dragon and Castle](../board-reference.png)

> Esiste anche la versione **[`baby-adventures-interattiva`](../baby-adventures-interattiva/)**,
> in cui è il modello a condurre il gioco dal vivo, una scena alla volta,
> aspettando ogni volta la risposta del bimbo.

## Cosa serve
* Il tabellone/sticker book **Dragon and Castle** (foto qui sopra).
* L'app **Google AI Edge Gallery** installata sul telefono, con un modello
  Gemma scaricato (consigliato un modello della famiglia Gemma recente).

## Come installare la skill in AI Edge Gallery
1. Copia sul telefono la cartella `baby-adventures` (basta il file `SKILL.md`).
2. In **AI Edge Gallery** apri la sezione **Skills** e importa/aggiungi la
   skill dalla cartella (oppure incolla il contenuto di `SKILL.md` come
   **System Prompt** in **AI Chat** dalla pagina di configurazione).
3. La skill si attiva da sola quando scrivi il comando di avvio (vedi sotto),
   perché l'app la sceglie in base a **nome + descrizione**.

> Nota: se la tua versione dell'app non ha ancora la sezione *Skills*, usa il
> testo di `SKILL.md` come **System Prompt** in *AI Chat*. Funziona uguale.

## Come si usa
1. Apri **AI Chat** e scrivi: **`prepara un'avventura`**
   (vanno bene anche *"prepara una storia"*, *"storia drago e castello"* o
   *"aiutami a raccontare una storia"*).
2. Se non hai dato dettagli, ti fa **una sola domanda** (nome del bimbo e
   personaggio preferito). Puoi anche dirglielo subito, es.
   *"prepara un'avventura per Anna, le piace il drago"*.
3. Ricevi **tutto il copione in una volta**:
   * 🎬 titolo, personaggi e durata,
   * 🧩 la **preparazione** (dove mettere gli stickers all'inizio),
   * **5 scene**, ognuna con: quale sticker muovere, cosa raccontare, e un modo
     per coinvolgere il bimbo,
   * 🎉 il finale felice e 💡 qualche consiglio pratico.
4. **Leggi il copione prima**, poi metti via il telefono e racconta. Gli
   stickers li spostate insieme al bimbo.

Puoi sempre chiedere: *"più corta"*, *"più lunga"*, *"un'altra storia"*,
*"cambia personaggio"* oppure *"solo la prossima scena"*.

## Com'è pensata
* **Il narratore sei tu.** Le frasi suggerite sono spunti da dire a parole
  tue, non un testo da leggere parola per parola.
* **Tutto gentile, niente paura:** draghi, streghe e vampiri sono buffi;
  nessun pericolo vero, nessuno perde, finisce sempre bene.
* **5 scene, una mossa per scena:** ritmo giusto per l'attenzione di un bimbo
  di 4 anni (~10 minuti).
* Il modello **non vede** il tabellone: conosce i personaggi e le **zone a
  parole** (Castello Buio a sinistra, Prato Verde a destra, Sentiero, Cielo,
  Bordo del Bosco), così le indicazioni sono sempre ritrovabili a colpo d'occhio.

## Personalizzare
* **Lingua:** la skill è in **italiano** (istruzioni e copione). Per l'inglese
  o una versione bilingue, tradurre `SKILL.md`.
* **Altri tabelloni:** questa guida è per *Dragon and Castle*. Gli altri
  tabelloni della confezione (Magic Quest, Princess, Enchanted Park) possono
  diventare nuove skill con i loro personaggi e zone.

Il formato della skill segue la specifica ufficiale di Google AI Edge Gallery:
<https://github.com/google-ai-edge/gallery/tree/main/skills>
