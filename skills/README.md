# Skills per Google AI Edge Gallery

Skill **text-only** ([formato ufficiale](https://github.com/google-ai-edge/gallery/tree/main/skills))
per giocare con il tabellone di stickers *Dragon and Castle* insieme a un bimbo
di 4 anni. Due modi diversi di usare lo stesso tabellone:

| Skill | Chi racconta | Come funziona | Comando |
|---|---|---|---|
| [`baby-adventures`](baby-adventures/) | **il genitore** | ti prepara il **copione completo** (5 scene: cosa dire + quale sticker muovere), lo leggi e poi racconti tu | `prepara un'avventura` |
| [`baby-adventures-interattiva`](baby-adventures-interattiva/) | **il modello** | conduce il gioco **dal vivo**, una scena alla volta, e aspetta la risposta del bimbo | `inizia avventura` |

`board-reference.png` è la foto del tabellone, condivisa dalle due skill (serve
solo a te, non va copiata sul telefono).

## Caricare le skill nell'app

In AI Edge Gallery non esiste un indice da cui caricare più skill insieme:
**una cartella = una skill**, quindi si aggiungono una alla volta.

Nell'app: entra nel caso d'uso *Agent Skills*, tocca il chip **"Skills"**, poi
**(+) → Load skill from URL** e incolla l'URL della **cartella** della skill
(senza `/SKILL.md`):

```
https://lucagervasi.github.io/skills/baby-adventures
https://lucagervasi.github.io/skills/baby-adventures-interattiva
```

In alternativa funzionano anche gli URL raw di GitHub:

```
https://raw.githubusercontent.com/lucagervasi/lucagervasi.github.io/master/skills/baby-adventures
https://raw.githubusercontent.com/lucagervasi/lucagervasi.github.io/master/skills/baby-adventures-interattiva
```

> Per verificare un URL, apri `<url>/SKILL.md` nel browser: se vedi il testo
> grezzo del file, l'URL è valido.

Il file `.nojekyll` nella root del repo serve proprio a questo: senza, GitHub
Pages passa i `.md` attraverso Jekyll e i `SKILL.md` (che hanno il frontmatter
YAML) verrebbero convertiti in HTML, restituendo 404 sull'URL `.md`.

