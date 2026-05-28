#import "@preview/unify:0.6.0":num, unit, qty
#set text(lang: "de", font: "New Computer Modern", 12pt)
#set page(paper: "a4", 
    margin: (top: 3cm, bottom: 3cm, left: 2cm, right: 2cm),
    footer-descent: 1.5cm,
    header: align(right)[#image("Grafiken/phyphox_bright_r.pdf", width: 5cm)],
    footer: context{
        let page_num = counter(page).display("1/1", both: true)
        let license_text = [
            This document is licensed under CC BY 4.0. #link("https://creativecommons.org/licenses/by/4.0/"). Author: Johannes Schlaf
        ]
        grid(
            columns: (1fr, auto, 1fr), rows: auto, gutter: 1em,
            [],
            align(center)[
                #page_num \
                #set text(size: 5pt)
                #license_text
            ],
            align(bottom + right)[
                #image("Grafiken/CC_by.png", width: 2cm)
            ]
        )
    })
#set par(leading: 0.8em, justify: true)
// #set heading(numbering: "1.1")
#set list(spacing: 1.5em, indent: 1em, body-indent: 0.5em)
#set enum(spacing: 1.5em, indent: 1em, body-indent: 0.5em); #show enum: set par(justify: true)
#show list: set block(above: 1.5em, below: 1.5em); #show list: set par(justify: true)
#show heading: set block(above: 2em, below: 1em)
#show figure: set figure(supplement: none)
#show figure.where(kind: table): it => {
    it.caption
    it.body
}
#show ref: it => {
    if it.supplement == [page] {
        let loc = query(it.target).first().location()
        link(it.target)[#loc.page()]
    } else {
        it
    }
}
//______________________________________________________________________
#let studis = false
#align(center)[
    #set text(size: 25pt, weight: "bold")
    Das Planck'sche Wirkungsquantum
]

= Material
#figure(
    grid(
        columns: (1fr, 40%, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/h-Box.png", width: 90%), caption: [_phyphox_:h-Box (Spannungssteuerung)]),
        figure(image("Abbildungen/Abdunklungsbox.png", width: 100%), caption: [Abdunklungsbox #linebreak() ~]),
        figure(image("Abbildungen/Hocker_frei.png", width: 70%), caption: [Stabilisierungshilfe #linebreak() ~])
    )
)
#figure(
    grid(
        columns: (1fr, 30%, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/LED-Einsatz_frei.png", width: 90%), caption: [Verschiedene LED-Einsätze unterschiedlicher Wellenlängen]),
        figure(image("Abbildungen/Anschlusskabel_frei.png", width: 100%), caption: [Anschlusskabel \ #linebreak() ~]),
        figure(image("Abbildungen/Smartphone_frei.png", width: 90%), caption: [Smartphone (Messung der Lichtintensität) #linebreak() ~])
    )
)
#pagebreak()

= Aufbau/Vorbereitung
+ Baut den Versuchsaufbau gemäß der untenstehenden Abbildung auf.
+ Ladet euch das zugehörige _phyphox_-Experimenten-Bundle herunter:
    - Die _phyphox_:h-Box muss an das Smartphone (oder eine andere Spannungsquelle) angeschlossen sein.
    - Öffnet die App _phyphox_.
    - Klickt auf das Plus-Symbol.
    - Wählt "Neues Experiment für Bluetooth-Gerät" aus.
    - Wählt eure _phyphox_:h-Box aus der Liste aus (Nummerierung an der Seite).
    - Wartet, bis der Download beendet ist.
    - Speichert das gewünschte Experiment (oder beide) in der Sammlung ab.


#figure(image("Abbildungen/Aufbau.png"), caption: [Fertiger Aufbau], placement: bottom)
#pagebreak()

= Durchführung mit der Smartphone-Kamera
- Falls sich das passende _phyphox_-Experiment sich nicht automatisch öffnet oder während der Versuchsdurchführung neu geöffnet werden muss:
    + Wählt das _phyphox_-Experiment *Planck'sches Wirkungsquantum* (Kamera im Icon) unter der Rubrik _Quantenphysik_ aus.
    + Wählt aus der erscheinenden Liste der Bluetooth-Geräte eure _phyphox_:h-Box aus (Nummerierung an der Seite der Box). $=>$ Nun verbindet sich die Box mit der App und sendet den Wert der angelegten Spannung.
- Bestimmt die Schwellenspannungen mehrerer LEDs (13 Schritte):
    + Setzt einen LED-Einsatz in die Abdunklungsbox ein.
    + Stellt den Spannungsregler auf der _phyphox_:h-Box auf das Maximum.
    + Platziert euer Smartphone so auf der Abdunklungsbox, dass sich die Kamera über dem weißen Reflexionsmaterial befindet. Nutzt ggf. die Stabilisierungshilfe.
    + Regelt die Spannung so weit herab, dass der Auswahlbereich der Kamera _gerade so nirgendwo überbelichtet wird_ (d.h. der Auswahlbereich darf _keine rot markierten Stellen_ enthalten.)
        - Der Auswahlbereich ist das etwas hellere Rechteck innerhalb der Kameravorschau.
        - Außerhalb des Auswahlbereichs darf eine Überbelichtung vorkommen.
        - Der Auswahlbereich kann verschoben werden. Tippt hierfür auf die Kameravorschau.
    + Wechselt auf den Reiter "Bestimmen der Schwellenspannung".
    + Startet die Messung (Play-Button oben rechts).
    + Nehmt durch _langsames_ Verringern der Spannung eine LED-Kennlinie auf.
    + Pausiert die Messung.
    + Platziert die grüne Ausgleichsgerade in der Kennlinie _durch Anpassung der minimalen und maximalen berücksichtigten Intensität_. Die Ausgleichsgerade soll durch den näherungsweise linearen Bereich der Kennlinie verlaufen. Ein etwaiger Sättigungsverlauf sollte daher _nicht_ berücksichtigt werden.
    + Notiert euch die vom Experiment berechnete Schwellenspannung $U_sans("Schwelle")$ in der Tabelle auf Seite #ref(<tabelle>, supplement: [page]). Notiert euch auch die zugehörige Unsicherheit.
    + Gebt die Wellenlänge der LED im Experiment ein und speichert das Wertepaar _Wellenlänge_Schwellenspannung_ im Experiment ab. Das Wertepaar ist nun im Reiter "h-Bestimmung" verfügbar.
    + Verwendet während der Durchführung _nicht_ den Button mit dem Mülltonnensymbol. Dieser löscht _alle_ Daten.\
     Löscht nun die Messkurve mit dem extra hierfür vorgesehenen Button.
    + Wiederholt den Messprozess mit der nächsten LED.
#pagebreak()

= Durchführung ohne die Smartphone-Kamera
- Falls sich das passende _phyphox_-Experiment sich nicht automatisch öffnet oder während der Versuchsdurchführung neu geöffnet werden muss:
    + Wählt das _phyphox_-Experiment *Planck'sches WQ* (keine Kamera im Icon) unter der Rubrik _Quantenphysik_ aus.
    + Wählt aus der erscheinenden Liste der Bluetooth-Geräte eure _phyphox_:h-Box aus (Nummerierung an der Seite der Box). $=>$ Nun verbindet sich die Box mit der App und sendet den Wert der angelegten Spannung.
- Bestimmt die Schwellenspannungen mehrerer LEDs (11 Schritte):
    + Stellt den Spannungsregler auf der _phyphox:h-Box_ auf das Minimum.
    + Setzt einen LED-Einsatz in die Abdunklungsbox ein.
    + Wechselt auf den Reiter "Bestimmen der Schwellenspannung".
    + Startet die Messung (Play-Button oben rechts).
    + Nehmt durch Variation der Spannung eine LED-Kennlinie auf.
    + Pausiert die Messung.
    + Platziert die grüne Ausgleichsgerade in der Kennlinie _durch Anpassung der minimalen und maximalen berücksichtigten Stromstärke_. Die Ausgleichsgerade soll durch den näherungsweise linearen Bereich der Kennlinie verlaufen. Ein etwaiger Sättigungsverlauf sollte daher _nicht_ berücksichtigt werden.
    + Notiert euch die vom Experiment berechnete Schwellenspannung $U_sans("Schwelle")$ in der Tabelle auf Seite #ref(<tabelle>, supplement: [page]). Notiert euch auch die zugehörige Unsicherheit.
    + Gebt die Wellenlänge der LED im Experiment ein und speichert das Wertepaar _Wellenlänge_Schwellenspannung_ im Experiment ab. Das Wertepaar ist nun im Reiter "h-Bestimmung" verfügbar.
    + Verwendet während der Durchführung _nicht_ den Button mit dem Mülltonnensymbol. Dieser löscht _alle_ Daten.\
     Löscht nun die Messkurve mit dem extra hierfür vorgesehenen Button.
    + Wiederholt den Messprozess mit der nächsten LED.
#pagebreak()


= Auswertung
#if not studis [
    + Berechnet aus den Schwellenspannungen die entsprechenden Photonenenergien\
    _Erinnerung_: $e = 1,602 dot 10^(-19) "C"$
    + Tragt die erhaltenen Frequenz-Energie-Wertepaare in das Diagramm auf Seite #ref(<diagramm>, supplement: [page]) ein.
    + Zeichnet eine Ausgleichsgerade in das Diagramm ein und bestimmt deren Steigung.
    + #underline[_Falls Unsicherheiten thematisiert wurden_]:\
        - Zeichnet jeweils die Gerade minimaler und maximaler Steigung (im Rahmen der Unsicherheiten) in das Diagramm ein.
        - Berechnet die Unsicherheit auf den Messwert für das Planck'sche Wirkungsquantum.
    + Vergleicht den erhaltenen Wert für das Planck'sche Wirkungsquantum mit dem in der App angezeigten Wert und diskutiert mögliche Abweichungen.
] else [
    + Berechnet aus den in die Tabelle auf Seite #ref(<tabelle>, supplement: [page]) eingetragenen Wellenlängen die entsprechenden Lichtfrequenzen mit zugehöriger Unsicherheit. Die Unsicherheit wird mithilfe der Gauss'schen Fehlerabschätzung bestimmt.
    + Berechnet aus den Schwellenspannungen die entsprechenden Photonenenergien mit zugehöriger Unsicherheit.
    + Tragt die Wertepaare mit Python oder Excel auf (inklusive Fehlerbalken) und erstellt eine Ausgleichsgerade.
    + Legt die Geraden minimaler bzw. maximaler Steigung durch die Unsicherheitsbereiche. 
    + Berechnet aus den Steigungen der drei eingezeichneten Geraden einen Wert für das Planck'sche Wirkungsquantum inklusive Unsicherheit.
    + Führt einen Vergleich des erhaltenen Wertes mit dem Literaturwert durch.
]
#pagebreak()

#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            let alignment = if it.y == 0 {left} else {right}
            if it.x in (2,3) and it.y != 0 [
                #if not studis {align(alignment + horizon)[#it]} else []
            ] else {align(alignment + horizon)[#it]}
        }
        rotate(-90deg, reflow: true)[
            #figure(
                caption: [Tabelle 1: Messdaten der Schwellenspannung in Abhängigkeit der Wellenlänge.],
                table(
                    columns: (auto, auto, auto, auto, 1fr, 1fr, 1fr, 1fr),
                    rows: 1cm,
                    fill: (col, row) => if col in (0,1,4,5) {
                        if calc.odd(row+1) {
                            gray.lighten(70%)
                        } else {gray.lighten(80%)}
                    }
                    else if col in (2,3,6,7) {
                        if calc.odd(row+1) {
                            gray.lighten(90%)
                        }
                    },
                    [*$lambda "[nm]"$*], [*$u_lambda "[nm]"$*], [*$f "["10^14 "Hz]"$*], [*$u_f "["10^14 "Hz]"$*], [*$U_sans("Schwelle") "[V]"$*], [*$u_U "[V]"$*], [*$E_sans("Photon") "[J]"$*], [*$u_E "[J]"$*],

                     [405], [7], [7,40], [0,13], [], [], [], [],
                     [463], [8], [6,48], [0,12], [], [], [], [],
                     [469], [10], [6,39], [0,14], [], [], [], [],
                     [504], [18], [5,95], [0,22], [], [], [], [],
                     [575], [8], [5,21], [0,08], [], [], [], [],
                     [586], [8], [5,12], [0,07], [], [], [], [],
                     [591], [7], [5,07], [0,07], [], [], [], [],
                     [595], [8], [5,03], [0,07], [], [], [], [],
                     [630], [5], [4,76], [0,04], [], [], [], [],
                     [631], [8], [4,75], [0,07], [], [], [], [],
                     [655], [9], [4,58], [0,07], [], [], [], []
                )
            ) <tabelle>
        ]
    }
]

#if not studis [
    #page[
        #set align(center + horizon)
        #rotate(-90deg, reflow: true)[
            #layout(size => {
                figure(
                    pad(x: -0.5cm, y: -3cm, image("Abbildungen/Auswertungsdiagramm.pdf", width: 100%))
                )
            })
        ]<diagramm>
    ]
    #page[
        #set align(center + horizon)
        #rotate(-90deg, reflow: true)[
            #layout(size => {
                figure(
                    pad(x: -0.5cm, y: -3cm, image("Abbildungen/Auswertungsdiagramm.pdf", width: 100%))
                )
            })
        ]
    ]
]
