#import "@preview/unify:0.6.0":num, unit, qty
#import "@preview/cetz:0.4.2"
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/showybox:2.0.4": showybox
#set text(lang: "de", font: "New Computer Modern", 12pt)
#set page(paper: "a4", 
    margin: (top: 3cm, bottom: 2.5cm, left: 2cm, right: 2cm),
    footer-descent: 1cm,
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
#set heading(numbering: "1.1")
#set footnote(numbering: "[1]")
#set list(spacing: 1.5em, indent: 1em, body-indent: 0.5em)
#set enum(spacing: 1.5em, indent: 1em, body-indent: 0.5em) 
#show enum: set par(justify: true)
#show list: set block(above: 1.5em, below: 1.5em); #show list: set par(justify: true)
#show heading: set block(above: 2em, below: 1em)
#show heading.where(level: 3): set heading(numbering: none)
#show figure: set figure(supplement: [Abbildung])
#show figure.where(kind: table): it => {
    it.caption
    it.body
}
#show figure.caption: it => {
    let single_line_width = measure(it).width
    layout(size => {
        if single_line_width > size.width {
            set align(left)
            set par(justify: true)
            it
        } else {
            set align(center)
            set par(justify: true)
            it
        }
    })
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
#align(center)[
    #set text(size: 25pt, weight: "bold")
    Handreichung zur Fertigung #linebreak() des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 1: Benötigtes Material/Werkzeug --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 1: Benötigtes Material/Werkzeug]}
]
Im Folgenden werden die Komponenten für _einen_ Aufbau aufgelistet:
#heading(level: 3, outlined: false)[Elektronische Komponenten:]
#{
    show figure: set block(breakable: true)
    figure(numbering: none,
        grid(
            columns: (1fr, 1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Komponenten/Platine.jpg"), caption: [1 _phyphox_:h-Platine \ *! _siehe Anmerkungen_ !*], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/ESP32.jpg"), caption: [1 NodeMCU ESP32 USB-C #linebreak() ~], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/Steckerleisten.jpg", height: 3cm), caption: [2 MPE Präzisions-Buchsenleisten, 1$times$15, 2,54 mm], numbering: none), 

            figure(image("Abbildungen/Abb_Bau/Komponenten/Poti.jpg", height: 3cm), caption: [1 Alps Drehpotentiometer, Mono, 1 k$Omega$, 6 mm #linebreak() ~], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/BNC-Buchse.jpg", height: 3cm), caption: [1 Amphenol RF-Steckverbinder BNC \ (B6252H5-NPP3G-50)], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/BNC-Adapter.jpg", height: 2.5cm), caption: [1 Adapter BNC > Terminalblock (2 Pin) #linebreak() ~], numbering: none),

            figure(image("Abbildungen/Abb_Bau/Komponenten/Widerstaende.jpg"), caption: [2 Widerstände, 100 $Omega$, 
            \ #linebreak() \ ~], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/LED.jpg", height: 3cm), caption: [LEDs verschiedener Wellenlängen mit _nicht farbigem_ Plastikmantel und _einer_ klar definierten Peak-Wellenlänge], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/Ringkabelschuhe.jpg", height: 1.5cm), caption: [2 Fafeicy M4$times$4,2 mm\ Ringkabelschuhe _pro LED_ \ #linebreak() ~], numbering: none),

            figure(image("Abbildungen/Abb_Bau/Komponenten/Steckbrueckenkabel.jpg"), caption: [2 Steckbrückenkabel, m-m, 40 cm], numbering: none),
            figure(image("Abbildungen/Abb_Bau/Komponenten/USB-C-Kabel_background.png"), caption: [1 Anschlusskabel (USB-C auf USB-C)], numbering: none),
        )
    )
}
#heading(level: 3, outlined: false)[Weitere Komponenten/Materialien:]
#figure(numbering: none,
    grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/Abb_Bau/Komponenten/Schrauben_lang.jpg", height: 3cm), caption: [2 M3$times$20 mm Schrauben\ (Innensechskant)], numbering: none),
        figure(image("Abbildungen/Abb_Bau/Komponenten/Schrauben_kurz.jpg", height: 3cm), caption: [2 M3$times$4 mm Schrauben\ (Innensechskant)], numbering: none),
        figure(image("Abbildungen/Abb_Bau/Komponenten/Muttern.jpg", height: 2cm), caption: [2 M3 Muttern #linebreak() ~], numbering: none),

        figure(image("Abbildungen/Abb_Bau/Komponenten/Einschmelzgewinde.jpg", height: 3cm), caption: [2 ruthex M3$times$5,7 mm \ Gewindeeinsätze], numbering: none),
        figure(image("Abbildungen/Abb_Bau/Komponenten/Filament_weiss.jpg", height: 2cm), caption: [Weißes Filament \ (bevorzugt PETG)], numbering: none),
        figure(image("Abbildungen/Abb_Bau/Komponenten/Filament_schwarz.jpg", height: 2cm), caption: [Schwarzes Filament \ (bevorzugt PETG)], numbering: none)
    )
)

#figure(placement: bottom,
    showybox(
        title: text(size: 14pt)[*Anmerkungen/Empfehlungen*],
        frame: (
            border-color: green.darken(20%),
            title-color: green.darken(20%),
            body-color: white, 
            radius: 5pt,
            thickness: 2pt,
        ),
        [
            - Die Platine muss bei entsprechenden Herstellern wie z.B. Aisler bestellt werden. Hierzu wird die PCB-Datei der Platine benötigt.
            - Die Platine _muss_ eine Dicke von 1,6 mm aufweisen. Die Verwendung von ENIG- statt HASL-Kontakten wird empfohlen.
            - Die LEDs sollten nur von renommierten Händlern wie z.B Mouser bezogen werden. Vor dem Kauf sollte das jeweilige Emissionsspektrum im Datenblatt der LED überprüft werden. Es dürfen keine _Doppelpeaks_, _breite Peaks_ (Halbwertsbreite > 40 nm) oder _mehrere spearate Peaks_ vorkommen. 
        ]
    )
)

#showybox(
    title: text(size: 14pt)[*Notwendiges Werkzeug und Verbrauchsmaterial*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - 1 Lötkolben + Lötzinn
        - 1 Seitenschneider
        - 1 Sechskantinnenschlüssel (2,5 mm, passend für M3-Schrauben)
        - 1 kleiner Schlitzschraubendreher
        - 1 grobe Feile
        - Sekundenkleber
        - Ethanol 
    ]
)
#showybox(
    title: text(size: 14pt)[*Weiteres empfohlenes Werkzeug*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - 1 Löthilfe / Platinenhalter
        - 1 Lötpinzette
        - 1 mechanische Entlötpumpe
        - 1 Silikon-Lötmatte (hitzebeständig)
        - 1 Sechskantinnenschlüssel (2 mm)
    ]
)

#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 2: 3D-Druck --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 2: 3D-Druck]}
]
#showybox(
    frame: (
        border-color: gray.darken(30%),
        body-color: gray.lighten(80%),
        radius: 5pt, 
        thickness: 2pt
    ),
    [
       Aufgrund der Vielzahl an 3D-Druckern und zugehörigen Slicing-Programmen wird im Folgenden davon ausgegangen, dass die Anwendenden mit den Grundlagen des 3D-Drucks und insbesondere mit ihrem eigenen Gerät vertraut sind. 
    ]
)#v(5mm)
Im Folgenden sind die zu druckenden Bauteile für _einen_ Aufbau aufgelistet:
#heading(level: 3, outlined: false)[_phyphox_:h-Box]
#figure(numbering: none,
    grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/Abb_Bau/3D-Druck/h-Unterseite.jpg", height: 4cm), caption: [1 Unterseite], numbering: none),
        figure(image("Abbildungen/Abb_Bau/3D-Druck/h-Oberseite.jpg", height: 4cm), caption: [1 Oberseite], numbering: none),
        figure(image("Abbildungen/Abb_Bau/3D-Druck/h-Skala.jpg", height: 4cm), caption: [1 Skala], numbering: none),
    )
)
#heading(level: 3, outlined: false)[_phyphox_:LED-Box]
#figure(numbering: none,
    grid(
        columns: (40%, 30%, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/Abb_Bau/3D-Druck/LED-Unterseite.jpg", height:3.3cm), caption: [1 Unterseite], numbering: none),
        figure(image("Abbildungen/Abb_Bau/3D-Druck/LED-Oberseite.jpg", height: 3.3cm), caption: [1 Oberseite], numbering: none),
        figure(image("Abbildungen/Abb_Bau/3D-Druck/LED-Reflexionseinlage.jpg", height: 2cm), caption: [1 Reflexionseinlage], numbering: none),
    )
)
#heading(level: 3, outlined: false)[Weiteres]
#figure(numbering: none,
    grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Abbildungen/Abb_Bau/3D-Druck/LED-Einsatz.jpg", height:3.3cm), caption: [Beliebig viele LED-Einsätze], numbering: none),
        figure(image("Abbildungen/Abb_Bau/3D-Druck/Stabilisierungshilfe.jpg", height: 3.3cm), caption: [1 Stabilisierungshilfe "PBK"], numbering: none),
    )
)

#page[
    #set align(horizon)
    #figure(placement: top, numbering: none,
        showybox(
            title: text(size: 14pt)[*Allgemeine Empfehlungen zu Druckparametern*],
            frame: (
                border-color: green.darken(20%),
                title-color: green.darken(20%),
                body-color: white, 
                radius: 5pt,
                thickness: 2pt,
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Material:], [PETG],
                    [Düsendurchmesser], [0,4 mm],
                    [Schichthöhe], [0,2 mm],
                    [Wandlinien:], [2],
                    [Fülldichte:], [15 %],
                    [Füllmuster:], [Gyroid],

                )
            ]
        )
    )
    #figure(numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:h-Box Unter- und Oberseite*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Stützstrukturen:], [$checkmark$], 
                    [Stützstruktur-Typ:], [normal (nicht organisch/Baum)],
                    [Stützstruktur-Stil:], [Gitternetz],
                    [Stützstruktur-(Basis)muster:], [Bienenwabe],
                    [Gravurtiefe (optional):], [0,6 mm],
                    table.hline(),
                )
                #wrap-content(
                    figure(image("Abbildungen/Abb_Bau/3D-Druck/h-Kennung.jpg", height: 4cm), numbering: none), 
                    align: right+top, column-gutter: 1.5em
                )[
                    Bei der Unterseite wird empfohlen, im Slicing-Programm auf der freien Seitenfläche des Bauteils eine Gravur mit der späteren Bluetooth-Kennung zu erstellen. Alternativ kann die Unterseite nach dem Druck mit einem entsprechenden Label gekennzeichnet werden.
                ]
            ]
        )
    )

    #figure(placement: bottom, numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:h-Box Skala*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Stützstrukturen:], [*$times$*],
                    table.hline()
                )
                Falls möglich, bietet sich für dieses Bauteil ein Zweifarbendruck an, in dem die extrudierte Beschriftung in einer anderen Farbe als der Träger gedruckt wird.
            ]
        )
    )
]
#page[
    #set align(horizon)
    #figure(placement: top, numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:LED-Box Unterseite*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Filamentfarbe:], [schwarz],
                    [Stützstrukturen:], [$checkmark$], 
                    [Stützstruktur-Typ:], [normal (nicht organisch/Baum)],
                    [Stützstruktur-Stil:], [nahtlos],
                    [Stützstruktur-(Basis)muster:], [Bienenwabe],
                    table.hline()
                )
                Dieses Bauteil _muss_ mit schwarzem Filament gedruckt werden, um eine hinreichend gute Abdunklung zu gewährleisten!
            ]
        )
    )
    #figure(numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:LED-Box Oberseite*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Filamentfarbe:], [schwarz],
                    [Stützstrukturen:], [$checkmark$], 
                    [Stützstruktur-Typ:], [normal (nicht organisch/Baum)],
                    [Stützstruktur-Stil:], [Gitternetz],
                    [Stützstruktur-(Basis)muster:], [geradlinig/Standard],
                    table.hline()
                )
                Dieses Bauteil _muss_ mit schwarzem Filament gedruckt werden, um eine hinreichend gute Abdunklung zu gewährleisten!\
                Falls möglich, bietet es sich an, die Stützschnittstelle (d.h. die Schicht zwischen Stütze und Bauteil) in PLA zu drucken. So wird eine wesentlich glattere Oberseite des Bauteils erzielt.
            ]
        )
    )
    #figure(placement: bottom, numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:LED-Box Reflexionseinlage*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Filamentfarbe:], [weiß],
                    [Stützstrukturen:], [*$times$*],
                    table.hline()
                )
                Dieses Bauteil _muss_ mit weißem Filament gedruckt werden, um eine hinreichend gute Lichtreflexion zu gewährleisten!
            ]
        )
    )
]
#page[
    #figure(placement: top, numbering: none,
        showybox(
            title: text(size: 14pt)[*_phyphox_**:LED-Einsatz*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },

                    [Filamentfarbe:], [schwarz],
                    [Stützstrukturen:], [*$times$*],
                    [Gravurtiefe (optional):], [0,6 mm],
                    table.hline()
                )
                Dieses Bauteil _muss_ mit schwarzem Filament gedruckt werden, um eine hinreichend gute Abdunklung zu gewährleisten!\
                Es wird empfohlen, im Slicing-Programm auf der Vorderseite des Bauteils eine Gravur mit der Peak-Wellenlänge der später verbauten LED zu erstellen. Alternativ können die LED-Einsätze nach dem Druck mit Labels gekennzeichnet werden.
            ]
        )
    )

    #figure(placement: top, numbering: none,
        showybox(
            title: text(size: 14pt)[*Stabilisierungshilfe "PBK"*],
            frame: (
                border-color: gray.darken(30%),
                title-color: gray.darken(30%),
                body-color: gray.lighten(80%),
                radius: 5pt, 
                thickness: 2pt
            ),
            [
                #show table.cell: it => {
                    let alignment = if it.x == 0 {left} else {right}
                    align(alignment + horizon)[#it]
                }
                #table(
                    columns: (1fr, 1fr),
                    rows: 1cm,
                    stroke: (col, row) => {
                        if row != 0 {(top: 1pt)}
                    },
                    [Stützstrukturen:], [*$times$*],
                    table.hline()
                )
                Es bietet sich an, dieses Bauteil mit buntem Filament zu drucken, um dem Versuchsaufbau einen Hauch Farbe zu verpassen.
            ]
        )
    )
]
#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 3: Nachbearbeitung der 3D-Bauteile --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 3: Nachbearbeitung der 3D-Bauteile]}
    #counter(heading).update(3)
]<s.Nachbearbeitung>
#showybox(
    title: text(size: 14pt)[*Benötigte/Empfohlene Werkzeuge*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - 1 Sechskantinnenschlüssel (2,5 mm)
        - 1 Seitenschneider
        - 1 kleiner Schlitzschraubendreher
        - 1 Lötkolben
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#ff7e22")))
        - 1 Sechskantinnenschlüssel (2 mm)
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigte Materialien*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - 2 ruthex M3$times$5,7 mm Gewindeeinsätze
    ]
)
== Entfernung der Stützstrukturen
#showybox(
    title: text(size: 14pt)[*Allgemeine Empfehlungen*],
    frame: (
        border-color: green.darken(20%),
        title-color: green.darken(20%),
        body-color: white, 
        radius: 5pt,
        thickness: 2pt,
        border-level: 1,
    ), breakable: true, 
    [
        - Strukturen, die sich von der einer Seite zur anderen Seite durchstoßen lassen, sollten mit einem _Sechskantinnenschlüssel_ entfernt werden (siehe @f.Entfernung_through).
        #figure(
            grid(
                columns: (1fr, 1fr),
                gutter: 1.5em, 
                align: bottom,

                figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/h-Unterseite_Entfernung_Pfeil.jpg", height: 7cm), numbering: none),
                figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/h-Oberseite_Entfernung_Pfeil.jpg", height: 7cm), numbering: none),
            ),
            caption: [Entfernung durchstoßbarer Stützstrukturen]
        )<f.Entfernung_through>
        #wrap-content(
            [#figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/Stuetzschicht_Beispiel.jpg", width: 3.3cm), caption: [Einschichtiger\ Stützstruktur-Rest])<f.Entfernung_Rest>], 
            align: right+top, column-gutter: 1.5em
        )[
            - Alle anderen Strukturen können leicht mit einem Seitenschneider entfernt werden. Hierzu wird die Stützstruktur mit dem Seitenschneider gegriffen und abgezupft, _ohne_ in die Struktur zu schneiden.
            - Reste von Stützstrukturen wie in @f.Entfernung_Rest können leicht mit einem kleinen Schlitzschraubendreher entfernt werden.
            - Sämtliche Stützstrukturen müssen sauber und vollständig entfernt werden, damit die Bauteile beim Zusammenbau mit den vorgesehenen Toleranzen ineinander passen.
        ]
    ]
)#v(5mm)
Im Folgenden werden die Stützstrukturen der individuellen Bauteile jeweils #text(fill: rgb("#ff13f0"))[*_pink_*] markiert. Zudem wird ggf. auf Besonderheiten bei der Entfernung der Strukturen eingegangen.
#figure(numbering: none, placement: bottom,
    showybox(
        title: text(size: 14pt)[*_phyphox_**:h-Box Unter- und Oberseite*],
        frame: (
            border-color: gray.darken(30%),
            title-color: gray.darken(30%),
            body-color: gray.lighten(80%),
            radius: 5pt,
            thickness: 2pt
        ),
        [
            #grid(
                columns: (1fr, 1fr),
                gutter: 1.5em,
                align: bottom,

                figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/h-Unterseite_Stuetzstruktur_1_markiert.jpg", height: 5.4cm), numbering: none),
                figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/h-Unterseite_Stuetzstruktur_2_markiert.jpg", height: 5.4cm), numbering: none)
            )
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/h-Oberseite_Stuetzstruktur_markiert.jpg", height: 6.5cm), numbering: none)
        ]
    )
)

#showybox(
    title: text(size: 14pt)[*_phyphox_**:LED-Box Unterseite*],
    frame: (
        border-color: gray.darken(30%),
        title-color: gray.darken(30%),
        body-color: gray.lighten(80%),
        radius: 5pt,
        thickness: 2pt
    ), breakable: true,
    [
        + Stützstruktur an den seitlichen Führungsschienen entfernen (beidseitig).
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Stuetzstruktur_1_markiert.jpg", height: 3cm), numbering: none)
        + Stützstruktur unter der Kabeldurchführung entfernen.
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Stuetzstruktur_2_markiert.jpg", height: 3.5cm), numbering: none)
            Anleitung:
            #enum(numbering: "i.",
                [
                    Stützstruktur mit einem Sechskantinnenschlüssel (bevorzugt 2 mm) aus der Position drücken.
                    #figure(numbering: none,
                        grid(
                            columns: (10.5cm, 1fr),
                            column-gutter: 1.5em,
                            align: bottom,

                            figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_1_Pfeil.jpg", height: 4cm), numbering:none),
                            figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_2.jpg", height: 4cm), numbering: none)
                        )
                    )
                ],
                [
                    Stützstruktur mit dem Sechskantinnenschlüssel in die entgegengesetzte Richtung drücken und entfernen.
                    #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_3_Pfeil.jpg", height: 5cm), numbering: none)
                ]
            )
        + Stützstruktur unter der Zugentlastung entfernen.
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Stuetzstruktur_3_markiert.jpg", height: 4cm), numbering: none)
            Anleitung:
            #enum(numbering: "i.",
                [
                    Stützstruktur mit einem Sechskantinnenschlüssel (bevorzugt 2 mm) auf beiden Seiten aus der Position drücken. Hierbei den Sechskantinnenschlüssel _unter_ der Kabeldurchführung durchführen.
                     #figure(numbering: none,
                        grid(
                            columns: (8cm, 1fr),
                            column-gutter: 1.5em,
                            align: bottom,

                            figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_4_Pfeil.jpg", height: 5cm), numbering:none),
                            figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_5.jpg", height: 5cm), numbering: none)
                        )
                    )
                ],
                [
                    Stützstruktur mit einem Seitenschneider entfernen.
                    #figure(numbering: none, image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Unterseite_Entfernung_6_Pfeil.jpg", height: 6.5cm))
                ]
            )
    ]
)

#showybox(
    title: text(size: 14pt)[*_phyphox_**:LED-Box Oberseite*],
    frame: (
        border-color: gray.darken(30%),
        title-color: gray.darken(30%),
        body-color: gray.lighten(80%),
        radius: 5pt,
        thickness: 2pt,
    ),
    [
        + Stützstruktur an den seitlichen Führungsschienen entfernen (beidseitig)
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Oberseite_Stuetzstruktur_1_markiert.jpg", width: 90%), numbering: none)
        + Stützstruktur auf der Oberseite mit einem kleinen Schlitzschraubendreher aufhebeln und entfernen.
            #figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/LED-Oberseite_Stuetzstruktur_2.jpg", width: 90%), numbering: none)
    ]
)
#pagebreak()
== Einschmelzen der Gewindeeinsätze
#wrap-content(
    [#figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/Einschmelzen_1.jpg", height: 7cm), caption: [Aufnahme\ des Gewindeeinsatzes\ mit der Lötspitze.])<f.Einschmelzen_1>#v(1.5cm)], 
    align: right+top, column-gutter: 1.5em
)[
Die Unterseite der _phyphox_:LED-Box muss mit Gewindeeinsätzen bestückt werden. Diese werden mithilfe eines Lötkolbens in die vorgesehenen Vertiefungen eingeschmolzen:
+ Lötkolben auf $250degree"C"$ aufheizen. 
+ Gewindeeinsatz mit der _schmalen Seite nach unten_ auf eine geeignete Unterlage stellen.
+ Gewindeeinsatz mit dem Lötkolben wie in @f.Einschmelzen_1 gezeigt aufnehmen und wie in @f.Einschmelzen_2 vorsichtig _zentriert_ auf der Vertiefung platzieren.
+ Gewindeeinsatz innerhalb von 5 Sekunden in einer gleichmäßigen Bewegung vertikal nach unten in die Vertiefung drücken, bis der Gewindeeinsatz vollständig versenkt ist und die Oberseite plan mit der Vertiefung abschließt (siehe @f.Einschmelzen_3).
+ Für den zweiten Gewindeeinsatz wiederholen.
]
#figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/Einschmelzen_2.jpg", width: 90%), caption: [Platzierung des Gewindeeinsatzes])<f.Einschmelzen_2>
#figure(image("Abbildungen/Abb_Bau/Nachbearbeitung/Einschmelzen_3.jpg", width: 90%), caption: [Unterseite der _phyphox_:LED-Box nach dem Einschmelzen der Gewindeeinsätze.])<f.Einschmelzen_3>

#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 4: Löten der Platine --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 4: Löten der Platine]}
    #counter(heading).update(4)
]<s.Loeten>
#v(-1.1em)
#showybox(
    title: text(size: 14pt)[*Benötigte/Empfohlene Werkzeuge*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        #columns(2, gutter: 1.5em)[
            - 1 Lötkolben
            - 1 grobe Feile
            #colbreak()
            - 1 Seitenschneider
        ]
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#ff7e22")))
        #columns(2, gutter: 1.5em)[
            - 1 Löthilfe / Platinenhalter
            - 1 Lötpinzette
            #colbreak()
            - 1 mechanische Entlötpumpe
            - 1 Silikon-Lötmatte (hizebeständig)
        ]
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigtes Verbrauchsmaterial*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        #columns(2, gutter: 1.5em)[
            - Lötzinn
            #colbreak()
            - Ethanol
        ]
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigte Materialien*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        #columns(2, gutter: 1.5em)[
            - 1 _phyphox_:h-Platine 
            - 2 MPE Präzisions-Buchsenleisten,\
             1$times$15, 2,54 mm
            - 1 Amphenol RF-Steckverbinder BNC \
             (B6252H5-NPP3G-50)
            #colbreak()
            - 2 Widerstände (100 $Omega$)
            - 1 Alps Drehpotentiometer, Mono, \ 
             1 k$Omega$, 6 mm
            - 1 NodeMCU ESP32 USB-C #linebreak() ~
        ]
    ]
)
#showybox(
    title: text(size: 14pt)[*Allgemeine Hinweise zum Löten*],
    frame: (
        border-color: green.darken(20%),
        title-color: green.darken(20%),
        body-color: white, 
        radius: 5pt,
        thickness: 2pt,
    ),
    [
        - Lötkolben stets am Kunststoffgriff anfassen und _niemals_ am Metall. Die Metalloberflächen werden mehrere hundert Grad heiß!
        - Es ist für einen guten Abzug des Lötrauchs zu sorgen.
        - Die ideale Löttemperatur von bleifreiem Lötzinn liegt bei etwa $350degree"C"$.
        - Lötvorgang:
            + Kontaktstelle für etwa 2 Sekunden mit der Lötspitze erhitzen.
            + Lötzinn an die Kontaktstelle hinzufügen.
            + Lötzinn auf die Kontaktstelle fließen lassen.
            + Lötspitze von Kontaktstelle entfernen.
    ]
)
#pagebreak()
+ Bruchstellen der Platine mit einer groben Feile abfeilen (siehe @f.Feile).
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Loeten/Platine_Nasen_markiert.png", height: 4.5cm), numbering: none, caption: [vorher (markiert) #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Platine_Nasen_abgeschmirgelt.jpg", height: 4.5cm), numbering: none, caption: [nachher #v(1em)]),
        ), caption: [Bruchstellen der Platine #v(1em)]
    )<f.Feile>
+ Die Widerstände an den Steckplätzen `R1` und `R2` auf der beschrifteten Seite der Platine einfädeln und auf der unbeschrifteten Seite verlöten (siehe @f.Widerstaende). Hierbei ist ein _Platinenhalten_ hilfreich. Anschließend die über die Lötstellen herausragenden Drahtenden mit einem Seitenschneider abknipsen.
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Loeten/Widerstaende_1.jpg", height: 5cm), numbering: none, caption: [Einfädeln (Oberseite) #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Widerstaende_2.jpg", height: 5cm), numbering: none, caption: [Einfädeln (Unterseite) #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Widerstaende_3.jpg", height: 5.2cm), numbering: none, caption: [Verlötete Kontakte (Unterseite) #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Loetstelle.jpg", height: 5.2cm), numbering: none, caption: [Verlöteter Kontakt (Close-up) #v(1em)]),
        ), caption: [Verlöten der Widerstände. #v(1em)]
    )<f.Widerstaende>
+ Die Buchsenleisten auf die unbeschriftete Seite der Platine stecken. Anschließend die Platine mit den Buchsenleisten nach unten auf eine geeignete Unterlage stellen und die in @f.Steckerleisten markierten Kontakte verlöten.
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Loeten/Steckerleiste_unten.jpg", height: 7cm), numbering: none, caption: [Platzieren der Buchsenleisten #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Steckerleiste_oben_markiert.png", height: 7cm), numbering: none, caption: [Zu verlötende Kontakte #v(1em)]),
        ), caption: [Verlöten der Buchsenleisten: Alle (mit pink und schwarz) markierten Kontakte _müssen_ verlötet werden. Alle anderen Kontakte _können_ gelötet werden. Die pink markierten Kontakte bilden ein symmetrisches Muster.#v(1em)]
    )<f.Steckerleisten>
+ Das Potentiometer am Steckplatz `RV1` und den BNC-Steckverbinder am Steckplatz `J1` auf die beschriftete Seite der Platine stecken. Beide Bauteile müssen _unmittelbar auf der Platine_ sitzen (siehe @f.Poti_BNC). Hierzu ist ggf. ein erhöhter Kraftaufwand notwendig. Keine Sorge: Die Platine bricht nicht. \
 Anschließend die Kontakte beider Bauteile auf der unbeschrifteten Seite der Platine verlöten. Hierbei ist ein _Platinenhalter_ hilfreich. 
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em, 
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Loeten/Poti+BNC_oben.jpg", height: 4.5cm), numbering: none, caption: [Positionierung der Bauteile. #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/Poti+BNC_unten.jpg", height: 4.5cm), numbering: none, caption: [Verlötete Kontakte. #v(1em)]),
        ), caption: [Verlöten von Potentiometer und BNC-Steckverbinder. Es müssen nur die kleinen Kontakte verlötet werden.#v(1em)]
    )<f.Poti_BNC>
+ Die Kontakte des NodeMCU-Boards so in die Buchsenleisten stecken, dass der USB-C-Anschluss an der markierten Stelle `U1` unter dem Potentiometer sitzt (siehe @f.ESP32). Die Kontakte des Boards müssen _vollständig_ in den Buchsenleisten stecken. Hierzu ist ggf. ein erhöhter Kraftaufwand notwendig. Keine Sorge: Weder das NodeMCU-Board noch die Buchsenleisten können hierbei beschädigt werden. Es ist lediglich darauf zu achten, dass auf den USB-C-Anschluss _kein_ Druck ausgeübt wird. 
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Loeten/ESP_1.jpg", height: 4.5cm), numbering: none, caption: [Positionierung des Boards. #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Loeten/ESP_2.jpg", height: 4.5cm), numbering: none, caption: [Eingebautes Board. #v(1em)]),
        ), caption: [Einbau des NodeMCU ESP32.#v(1em)]
    )<f.ESP32>

#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 5: Programmieren des Mikrocontrollers --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 5: Programmieren des Mikrocontrollers]}
    #counter(heading).update(5)
]
== Download und Einrichtung der Arduino IDE
+ Aktuelle Version der Arduino IDE von #underline[#link("https://www.arduino.cc/en/software/")] herunterladen und installieren.
+ Arduino IDE starten.
+ Den _Boards Manager_ (siehe @f.Arduino_IDE_Basic) öffnen.
    #figure(image("Abbildungen/Abb_Bau/Programmierung/Arduino_IDE_Basic_markiert.png", width: 99%), caption: [Arduino IDE.])<f.Arduino_IDE_Basic>
+ Das Paket `esp32` von Espressif Systems suchen und die aktuelle Version installieren (siehe @f.Espressif_ESP32).
    #figure(image("Abbildungen/Abb_Bau/Programmierung/Espressif_ESP32_markiert.png", width: 99%), caption: [Auswahl des Pakets `esp32` von _Espressif Systems_ im Boards Manager.])<f.Espressif_ESP32>
+ Den _Library Manager_ (siehe @f.Arduino_IDE_Basic) öffnen.
+ Die Bibliothek `phyphox BLE` von _RWTH Aachen University_ suchen und die aktuelle Version installieren (siehe @f.phyphoxBLE)
    #figure(image("Abbildungen/Abb_Bau/Programmierung/phyphoxBLE_markiert.png", width: 99%), caption: [Auswahl der Bibliothek `phyphox BLE` von _RWTH Aachen University_ im Boards Manager.])<f.phyphoxBLE>
+ In der Menüleiste über `Tools` $arrow$ `Board` $arrow$ `esp32` $arrow$ `ESP32 Dev Module` das _ESP32 Dev Module_ als zu verwendendes Board auswählen.

== Programmieren des Mikrocontrollers
+ Die Datei #underline[#link("https://github.com/johannesschlaf/phyphox_quantum_experiments/blob/a987e1018dd262686ead70c90e65543a1ad45132/Measuring%20Planck's%20Constant/Programming/PHOV4.1.ino")[PHOV4.1.ino]] in der Arduino IDE öffnen.
+ Das NodeMCU-Board an den Computer anschließen.
+ In der Menüleiste über `Tools` $arrow$ `Port` den Port auswählen, an dem das Board angeschlossen ist.
+ Im Code die gewünschte SSID des Mikrocontrollers eingeben (siehe @f.Kennung). Diese sollte die Kennung auf der Unterseite der _phyphox_:h-Box enthalten. \
 _Wichtig_: Die SSID _muss_ mit `phyphox:h` anfangen, da der Mikrocontroller sonst nicht in den zugehörigen phyphox-Experimenten erkannt wird!
    #figure(image("Abbildungen/Abb_Bau/Programmierung/Kennung_markiert.png", width: 99%), caption: [Änderung der SSID (Bluetooth-Kennung) des Mikrocontrollers])<f.Kennung>
+ Auf den Upload-Button klicken (siehe @f.Kennung). Nun wird der Code kompiliert und als ausführbare Datei auf den Mikrocontroller übertragen. Die Übertragung ist abgeschlossen, wenn in der Kommandozeile `Hard resetting via RTS pin...` ausgegeben wird (siehe @f.Reset).
    #figure(image("Abbildungen/Abb_Bau/Programmierung/Pin_reset_markiert.png", width: 99%), caption: [Ausgabe nach erfolgreicher Programmierung des Mikrocontrollers.])<f.Reset>

#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 6: Zusammenbau der Boxen--
    #{show heading: none; heading(level: 1, numbering: none)[Teil 6: Zusammenbau der Boxen]}
    #counter(heading).update(6)
]
#showybox(
    title: text(size: 14pt)[*Benötigte Werkzeuge*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        #grid(columns: (1fr, 1fr), gutter: 1.5em, align: bottom,
            [- 1 Sechskantinnenschlüssel (2,5 mm)], [- 1 kleiner Schlitzschraubendreher]
        )
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigtes Verbrauchsmaterial*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - Sekundenkleber
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigte Materialien*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [   
        - Vollständig nachbearbeitete 3D-Druck-Bauteile (siehe #underline[#link(<s.Nachbearbeitung>)[Teil 3]] der Anleitung)
            #grid(columns: (1fr, 8cm), gutter: 1.5em, align: bottom,
                [- 1 _phyphox_:h-Box Unterseite], [- 1 _phyphox_:LED-Box Unterseite],
                [- 1 _phyphox_:h-Box Oberseite], [- 1 _phyphox_:LED-Box Oberseite]
            )#v(1em)
        - Weitere 3D-Druck-Bauteile
            #grid(columns: (1fr, 8cm), gutter: 1.5em, align: bottom,
                [- 1 _phyphox_:h-Box Skala], [- 1 _phyphox_:LED-Box Reflexionseinlage]
            )#v(1em)
        - 1 vollständig bestückte Platine (siehe #underline[#link(<s.Loeten>)[Teil 4]] der Anleitung) #v(1em)
        - Weiteres
            #grid(columns: (1fr, 8cm), gutter: 1.5em, align: bottom,
                [- 2 M3$times$20 mm Schrauben \ (Innensechskant)], [- 2 M3$times$4 mm Schrauben \ (Innensechskant)],
                [- 2 M3 Muttern], [- 2 Steckbrückenkabel],
                grid.cell(colspan: 2)[- 1 Adapter BNC > Terminalblock (2 Pin)]
            )
    ]
)
#pagebreak()
== _phyphox_:h-Box
+ Vom auf der Platine verlöteten BNC-Steckverbinder den zugehörigen Ring und Mutter abdrehen und beiseite legen (falls noch nicht geschehen). Anschließend die Platine in die Oberseite der _phyphox_:h-Box einbauen. Hierbei muss der USB-C-Anschluss in die hierfür vorgesehene Durchführung gesteckt werden (siehe @f.h-Box12).
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_1.jpg", height: 4.5cm), numbering: none, caption: [von der Seite #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_2.jpg", height: 4.5cm), numbering: none, caption: [USB-C-Anschluss #v(1em)]),
        ), caption: [Einbau der Platine in die Oberseite der _phyphox_:h-Box. #v(1em)]
    )<f.h-Box12>
+ Oberseite mit Platine in schräg von oben in die Unterseite einsetzen, sodass sowohl die Führungsschienen der Oberseite als auch der BNC-Steckverbinder in die dafür vorgesehenen Aussparungen geführt werden (siehe @f.h-Box345#text[a]). Anschließend die Oberseite horizontal positionieren und in Pfeilrichtung (siehe @f.h-Box345#text[b-c]) schieben, sodass die Box geschlossen wird.
    #figure(
        grid(
            columns: (1fr, 1.5fr, 1.5fr),
            gutter: 1em,
            align: bottom,
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_3.jpg", height: 3.8cm), numbering: none, caption: [a) Initiales Platzieren der Oberseite #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_4_markiert.jpg", height: 3.8cm), numbering: none, caption: [b) Schieberichtung \ ~ #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_5.jpg", height: 3.8cm), numbering: none, caption: [c) geschlossene Box \ ~ #v(1em)]),
        ), caption: [Zusammenführen von Ober- und Unterseite der _phyphox_:h-Box. #v(1em)]
    )<f.h-Box345>
+ Ring und Mutter des BNC-Steckverbinders von außen auf den BNC-Steckverbinder schrauben (siehe @f.h-Box678#text[a]). Anschließend die M3 Muttern in die Unterseite der Box einsetzen (siehe @f.h-Box678#text[b]), die M3$times$20 mm Schrauben in die Oberseite einsetzen (siehe @f.h-Box678#text[c]) und die Oberseite mit der Unterseite verschrauben .
    #figure(
        grid(
            columns: (1fr, 1fr, 1fr),
            gutter: 1em,
            align: bottom,
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_6.jpg", height: 3.8cm), numbering: none, caption: [a) Fixierte BNC-Buchse #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_7.jpg", height: 3.8cm), numbering: none, caption: [b) Einsatz der Muttern #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_8.jpg", height: 3.8cm), numbering: none, caption: [c) Einsatz der Schrauben  #v(1em)]),
        ), caption: [Verschließen der _phyphox_:h-Box. #v(1em)]
    )<f.h-Box678>
+ Die _phyphox_:h-Box Skala mit Sekundenkleber wie in @f.h-Box9 gezeigt auf der _phyphox_:h-Box befestigen.
#figure(
    image("Abbildungen/Abb_Bau/Zusammenbau/h-Box_9.jpg", height: 4.5cm),
    caption: [_phyphox_:h-Box mit Skala.]
)<f.h-Box9>
#pagebreak()

== _phyphox_:LED-Box
+ Steckbrückenkabel wie in @f.LED-Box1-8#text[a] gezeigt in der Unterseite der _phyphox_:LED-Box platzieren. Hierbei die Zuordnung von Kabelfarbe und Polung merken.
+ Die Enden beider Steckbrückenkabel jeweils links vom angrenzenden Einschmelzgewinde platzieren (siehe @f.LED-Box1-8#text[b]).
+ Das am Pluspol anliegende Kabel wie in @f.LED-Box1-8#text[c] gezeigt durch die Zugentlastung führen.
+ Das am Minuspol anliegende Kabel ebenfalls um die Zugentlastung führen (siehe @f.LED-Box1-8#text[d]).
+ Die beiden Steckbrückenkabel wie in @f.LED-Box1-8#text[e-h] gezeigt mit den M3$times$4 mm Schrauben fixieren.
#figure(placement: bottom,
    grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 1em,
        align: bottom,
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_1_markiert.jpg", height: 8.5cm), numbering: none, caption: [a) #v(1em)]),
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_2.jpg", height: 8.5cm), numbering: none, caption: [b) #v(1em)]),
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_3.jpg", height: 8.5cm), numbering: none, caption: [c) #v(1em)]),
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_4.jpg", height: 8.5cm), numbering: none, caption: [d) #v(1em)]),
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_5.jpg", height: 8.5cm), numbering: none, caption: [e) #v(1em)]),
        figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_6.jpg", height: 8.5cm), numbering: none, caption: [f) #v(1em)]),
        grid.cell(colspan: 4)[
            #figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_7.jpg", height: 4cm), numbering: none, caption: [g) #v(1em)])
        ],
        grid.cell(colspan: 2)[
            #figure(image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_8.jpg", height: 4cm), numbering: none, caption: [h) #v(1em)])
        ]
    ), caption: [Platzierung und Fixierung der Steckbrückenkabel in der Abdunklungsbox.]
)<f.LED-Box1-8>
#enum(start: 6,
    [Die _phyphox_:LED Reflexionseinlage wie in @f.LED-Box9 mit Sekundenkleber einkleben.],
    [Die Oberseite wie in @f.LED-Box10 versetzt auf die Unterseite setzen. Anschließend die Box zuschieben.],
    [Die Steckbrückenkabel ihrer Polung entsprechend mit dem Schlitzschraubendreher an den BNC-Adapter anschließen (siehe @f.LED-Box12).]
)
#figure(placement: bottom,
    image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_9.jpg", width: 70%),
    caption: [Platzierung der Reflexionseinlage in der _phyphox_:LED-Box. #v(1em)]
)<f.LED-Box9>
#figure(placement: bottom,
    image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_10.jpg", width: 70%),
    caption: [Versetzte Platzierung der Oberseite auf der Unterseite der _phyphox_:LED-Box.#v(1em)]
)<f.LED-Box10>
#figure(placement: bottom,
    image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_11.jpg", width: 70%),
    caption: [Geschlossene _phyphox_:LED-Box.#v(1em)]
)<f.LED-Box11>
#figure(placement: bottom,
    image("Abbildungen/Abb_Bau/Zusammenbau/LED-Box_12.jpg", width: 70%),
    caption: [Anschluss der Steckbrückenkabel an den BNC-Adapter.]
)<f.LED-Box12>

#pagebreak(to: "odd")

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Fertigung des _phyphox_:h-Aufbaus\
    #set text(size: 20pt, weight: "bold")
    -- Teil 7: Löten der LED-Einsätze --
    #{show heading: none; heading(level: 1, numbering: none)[Teil 7: Löten der LED-Einsätze]}
    #counter(heading).update(7)
]
#showybox(
    title: text(size: 14pt)[*Benötigte/Empfohlene Werkzeuge*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - 1 Lötkolben
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#ff7e22")))
        - 1 Lötpinzette

    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigtes Verbrauchsmaterial*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [
        - Lötzinn
    ]
)
#showybox(
    title: text(size: 14pt)[*Benötigte Materialien*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("#ff7e22"),
        body-color: white,
        radius: 5pt, 
        thickness: 2pt
    ),
    [   
        - Beliebige Anzahl von 3D-gedruckten LED-Einsätzen (siehe #underline[#link(<s.Nachbearbeitung>)[Teil 3]])
        - 2 Ringkabelschuhe pro LED-Einsatz
    ]
)
#figure(placement: bottom,
    showybox(
        title: text(size: 14pt)[*Anmerkungen zu den LED-Einsätzen*],
        frame: (
            border-color: green.darken(20%),
            title-color: green.darken(20%),
            body-color: white, 
            radius: 5pt,
            thickness: 2pt,
        ),
        [
            - Bei den LED-Einsätzen handelt es sich _nicht_ um Verschleißteile. Es bietet sich dennoch an, mehrere LED-Einsätze mit der gleichen LED zu fertigen, um für mögliche Defekte bei den verbauten LEDs vorzusorgen.
            - Beim Einsatz in die Abdunklungsbox werden die Ringkabelschuhe leicht nach innen gebogen. Dies ist so vorgesehen, um einen sicheren Kontakt zu gewährleisten. Daher sollten die Ringkabelschuhe regelmäßig wieder gerade gebogen werden (spätestens, wenn der Einsatz nicht mehr zuverlässig kontaktiert.)
        ]
    )
)
#pagebreak()
+ LED im LED-Einsatz gemäß @f.LED-Einsatz12 platzieren. Hierbei ist auf die richtige Polung zu achten. Diese ist auf der Unterseite des LED-Einsatzes eingraviert.\
 Für die LED gilt: Langes Beinchen = Plus, kurzes Beinchen = Minus 
    #figure(
        grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/LED-Einsatz/LED-Einsatz_1_markiert.jpg", height: 4cm), numbering: none, caption: [Für die LED vorgesehene Durchführungen.#v(1em)]),
            figure(image("Abbildungen/Abb_Bau/LED-Einsatz/LED-Einsatz_2.jpg", height: 4cm), numbering: none, caption: [Polung/Positionierung der LED.#v(1em)])
        ), caption: [Platzierung der LED im LED-Einsatz. #v(1em)]
    )<f.LED-Einsatz12>
+ Ringkabelschuhe gemäß @f.LED-Einsatz34 im LED-Einsatz platzieren. Die Ringkabelschuhe müssen hierbei so tief wie möglich in den vorgesehenen Vertiefungen sitzen.
    #figure(
        grid(
            columns: (1.5fr, 1fr),
            gutter: 1em,
            align: bottom,

            figure(image("Abbildungen/Abb_Bau/LED-Einsatz/LED-Einsatz_3.jpg", height: 2.1cm), numbering: none, caption: [Blick von der Seite #v(1em)]),
            figure(image("Abbildungen/Abb_Bau/LED-Einsatz/LED-Einsatz_4.jpg", height: 3.4cm), numbering: none, caption: [Blick von unten #v(1em)])
        ), caption: [Platzierung der Ringkabelschuhe im LED-Einsatz. #v(1em)]
    )<f.LED-Einsatz34>
#wrap-content(
        [#figure(
            image("Abbildungen/Abb_Bau/LED-Einsatz/LED-Einsatz_5.jpg", height: 5.5cm), 
            caption: [Verlötete LED.]
        )<f.LED-Einsatz5>], 
        align: right+top, column-gutter: 1.5em
)[
    #set enum(start: 3)
    + Die Beinchen der LED um die Enden der Ringkabelschuhe biegen. Hierbei kann eine Lötpinzette hilfreich sein. Anschließend jedes Beinchen wie in @f.LED-Einsatz5 gezeigt am jeweiligen Ringkabelschuh verlöten. Die Ringkabelschuhe sollten hierbei leicht an dem LED-Einsatz anschmelzen.
]
