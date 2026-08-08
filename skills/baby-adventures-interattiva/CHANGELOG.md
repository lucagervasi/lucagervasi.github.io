# Changelog — baby-adventures-interattiva

Tutte le modifiche rilevanti a questa skill sono elencate qui.
Il versionamento segue lo stile [SemVer](https://semver.org/lang/it/).

## [0.2.0] — 2026-08-08 17:46 CEST (base rev: 4d4bb27)
### Modificato
- **Rinominata** la skill da `baby-adventures` a `baby-adventures-interattiva`
  (cartella e campo `name` del frontmatter). Il nome `baby-adventures` è ora
  usato dalla skill che prepara il copione completo per il genitore.
- **Trigger separati** per evitare sovrapposizioni con `baby-adventures`:
  "inizia avventura", "avventura interattiva", "giochiamo al drago e castello",
  "giochiamo insieme".
- `board-reference.png` spostata in `skills/` perché condivisa fra le due skill.
- README: nuovo titolo, riferimento incrociato alla skill `baby-adventures` e
  percorsi aggiornati.

*Le regole di gioco e il comportamento della skill non sono cambiati.*

## [0.1.0] — 2026-08-08 17:23 CEST (base rev: 78aa3db)
### Aggiunto
- Prima versione della skill **text-only** `SKILL.md` per Google AI Edge
  Gallery: cantastorie/game master per un'avventura a stickers adatta a bimbi
  di 4 anni sul tabellone *Dragon and Castle*.
- Regole d'oro (italiano semplice, tono dolce, nessun pericolo, un turno alla
  volta), mappa delle **zone a parole**, inventario dei **personaggi** buffi,
  schema fisso di risposta (📖 racconto → 🧩 mossa → ❓ domanda) e finale felice.
- `README.md` con istruzioni di installazione in AI Edge Gallery e guida di
  gioco per l'adulto.
- `board-reference.png`: foto del tabellone di riferimento.
