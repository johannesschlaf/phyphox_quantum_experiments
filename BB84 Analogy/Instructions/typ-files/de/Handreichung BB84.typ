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
#set enum(spacing: 1.5em, indent: 1em, body-indent: 0.5em); #show enum: set par(justify: true)
#show list: set block(above: 1.5em, below: 1.5em); #show list: set par(justify: true)
#show heading: set block(above: 2em, below: 1em)
#show heading.where(level: 3): set heading(numbering: none)
#show figure: set figure(supplement: [Abbildung])
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

#align(center)[
    #set text(size: 25pt, weight: "bold")
    Das BB84-Protokoll \
    #set text(size: 20pt, weight: "bold")
    -- Handreichung zum Analogieexperiment --
]

= Hintergrund und Theorie
Das BB84-Protokoll ist ein Verfahren aus der Quantenkryptographie. Es stellt eine Möglichkeit dar, digitale Schlüssel durch die Nutzung von Quanteneffekten zu generieren und zugleich abhörsicher auszutauschen. Es wurde 1984 von Charles H. Bennet und Gilles Brassard
== Motivation
Viele gängige Verschlüsselungsalgorithmen können durch hinreichend leistungsfähige Quantencomputer essentiell schneller als durch klassische Computer geknackt werden. Ein Beispiel hierfür ist das Verfahren RSA, dessen Sicherheit auf der Unlösbarkeit einer Primfaktorzerlegung hinreichend großer Zahlen (Primfaktoren mit über 100 Stellen) in angemessener Zeit basiert (aktuell werden mindestens mehrere Wochen benötigt). Der für hinreichend große und fehlerarme Quantencomputer konzipierte und bereits 1994 veröffentlichte sogenannte _Shor-Algorithmus_ könnte eine solche Primfaktorzerlegung in angemessener Zeit schaffen (vermutlich wenige Sekunden).
Aus diesem Grund ist es sinnvoll, sich mit quantekryptographischen Verfahren auseinanderzusetzen, bei denen die Sicherheit aus der Ausnutzung bestimmter Quanteneffekte stammt, welche nicht durch eine größere Rechenleistung und/oder Quantencomputing ausgehebelt werden können.

== Konzept der Nachrichtenübertragung
Um Nachrichten sicher zu übertragen, wird ein Schlüssel benötigt. Jede Nachricht und jeder Schlüssel besteht in der Nachrichtenübertragung aus Nullen und Einsen. Die Verschlüsselung kann nach den folgenden Regeln erfolgen: #v(0.5em)
#grid(
    columns: (1fr, auto, 1fr), rows: auto, gutter: 1em,
    align: center,
    $0+0=1$, $0+1=1+0=1$, $1+1=0$
)

#figure(
    grid(
        columns: (1fr, 1fr), gutter: 1em, align: bottom,
        figure(
            cetz.canvas(length: 1cm, {
                import cetz.draw: *
                line((x:-2, y:0), (x:2, y:0), stroke: 1.5pt, name: "h", mark: (start: ">", end: ">", fill: black))
                line((x:0, y:-2), (x:0, y:2), stroke: 1.5pt, name: "v", mark: (start: ">", end: ">", fill: black))
                content("h.100%", [$h$], anchor: "west", padding: 0.1)
                content("v.100%", [$v$], anchor: "south", padding: 0.1)
            }), caption: [$h$/$v$-Messbasis #v(1em)], numbering: none
        ),
        figure(
            cetz.canvas(length: 1cm, {
                import cetz.draw: *
                line((x:-1.7, y:1.7), (x:1.7, y:-1.7), stroke: 1.5pt, name: "-", mark: (start: ">", end: ">", fill: black))
                line((x:-1.7, y:-1.7), (x:1.7, y:1.7), stroke: 1.5pt, name: "+", mark: (start: ">", end: ">", fill: black))
                content("-.0%", [$-$], anchor: "south", padding: 0.1)
                content("+.100%", [$+$], anchor: "south", padding: 0.1)
            }), caption: [$+$/$-$ -Messbasis #v(1em)], numbering: none
        )
    ), caption: [Vier Polarisationszustände, aufgeteilt auf zwei Messbasen. #v(1em)]
) <Messbasen>
Dies könnte folgendermaßen aussehen: #v(0.5em)
#grid(
    columns: (30%, 1fr), rows: 5mm, gutter: 1em,
    align: (right, center),
    [Nachricht:], [1~ 1~ 0~ 0~ 0~ 1~ 1~ 1~ 0],
    [Schlüssel:], [0~ 1~ 1~ 0~ 1~ 0~ 0~ 0~ 1],
    [Verschlüsselte Nachricht:], [1~ 0~ 1~ 0~ 1~ 1~ 1~ 1~ 1]
)\
Da sowohl $0+0=0$ als auch $1+1=0$ gilt, kann der Schlüssel auch wieder zum Entschlüsseln verwendet werden: #v(0.5em)
#grid(
    columns: (30%, 1fr), rows: 5mm, gutter: 1em,
    align: (right, center),
    [Verschlüsselte Nachricht:], [1~ 0~ 1~ 0~ 1~ 1~ 1~ 1~ 1],
    [Schlüssel:], [0~ 1~ 1~ 0~ 1~ 0~ 0~ 0~ 1],
    [Nachricht:], [1~ 1~ 0~ 0~ 0~ 1~ 1~ 1~ 0]
)\
Da Schlüssel in der Regel mindestens genauso lang wie die Nachricht sind (und sich somit der Schlüssel nicht innerhalb der Nachricht wiederholt), ist es nicht möglich, die verschlüsselte Nachricht zu entschlüsseln, ohne den Schlüssel zu kennen. Um eine sichere Übertragung zu gewährleisten, muss also "nur" der Schlüssel abhörsicher ausgetauscht werden. Hierzu kann das BB84-Protokoll genutzt werden.

== Physikalische Grundlagen des BB84-Protokolls
Beim BB84-Protokoll werden Einzelphotonen von einer Senderin (meist _Alice_ genannt) zu einem Empfänger (meist _Bob_ genannt) geschickt. Wichtig für die Funktion des Protokolls sind die folgenden *Eigenschaften von Einzelphotonen*:
- Ein Einzelphoton kann nicht kopiert werden\
 $=>$ Man kann den Polarisationszustand eines Einzelphotons nur einmal messen.
- Ein Einzelphoton lässt sich nicht aufteilen.
Letztere Eigenschaft sorgt dafür, dass der Polarisationszustand nur dann scharf gemessen werden kann, wenn das Photon nur einen von zwei bekannten, zueinander rechtwinklige Zuständen annehmen kann. #v(1em)

_Beispiel_: Wenn ich weiß, dass ein Photon entweder in $h$- oder in $v$-Richtung polarisiert ist (siehe @Messbasen), kann ich einen Polarisator z.B. in $v$-Richtung ausrichten. Ein $v$-polarisiertes Photon kommt dann mit 100 % Wahrscheinlichkeit durch, ein $h$-polarisiertes Photon nie. Somit habe ich den Zustand scharf gemessen. Fällt nun jedoch ein weder $h$- noch $v$-polarisiertes Photon auf den Polarisator, kann es sich nicht in $v$-Komponente und $h$-Komponente aufteilen und kommt somit mit einer vom Winkel zur $v$-Richtung abhängigen Wahrscheinlichkeit durch. Da ich die Wahrscheinlichkeit aber nicht kenne, kann ich keine Aussage über den Polarisationszustand treffen (außer "_nicht_ $h$",falls das Photon durchkommt, und "_nicht_ $v$", falls es nicht durchkommt). #v(1em)

Das obige Beispiel gilt für alle zueinander rechtwinkligen Zustandspaare. Ein solches Zustandspaar nennt man daher auch _Messbasis_. Beim BB84-Protokoll werden zwei um $45degree$ zueinander verdrehte Messbasen verwendet (siehe @Messbasen).

== Ablauf des BB84-Protokolls
+ Alice schickt eine Zufallsfolge von Polarisationszuständen an Bob.
+ Bob weiß, dass jedes Einzelphoton entweder in der $h$/$v$-Messbasis oder der $+$/$-$ -Messbasis präpariert wurde. Daher misst er jedes Einzelphoton zufällig entweder in der $h$/$v$-Basis oder der $+$/$-$ -Basis:
    - Angenommen, Alice schickt ein $h$-polarisiertes Photon.
    - Misst Bob das Photon in der $h$/$v$-Basis, wird er auch eine $h$-Polarisation messen.
    - Misst Bob das Photon in der $+$/$-$ -Basis, kann er nur eine $+$- oder eine $-$ -Polarisation messen. Da die Messbasen $h$/$v$ und $+$/$-$ um $45degree$ zueinander verdreht sind, misst Bob mit einer Wahrscheinlichkeit von 50 % eine $+$-Polarisation und mit er einer Wahrscheinlichkeit von ebenfalls 50 % eine $-$ -Polarisation.
+ Alice und Bob vergleichen für jedes gesendete Photon das gewählte Basissystem. Bei den Einzelphotonen, bei denen die Basissysteme übereinstimmen, muss Bob den von Alice gesendeten Polarisationszustand gemessen haben. Nur die Zustände dieser Photonen werden für die Schlüsselerstellung berücksichtigt.
+ Der Schlüssel wird folgendermaßen erstellt:
    - $h$-Polarisation oder $-$ -Polarisation: 0
    - $v$-Polarisation oder $+$-Polarisation: 1
+ Alice vergleicht die ersten paar Stellen des von ihr erstellten Schlüssels mit den ersten paar Stellen des von Bob erstellten Schlüssels (in der Realität etwa 1000 Stellen), um sicherzugehen, dass die Übertragung funktioniert hat.

#figure(
    image("Abbildungen/BB84_komplett.pdf", width: 100%), caption: [Beispiel zum BB84-Protokoll. #v(1em)], placement: top
) <BB84>

Ein Beispiel findet sich in @BB84.

== Weitergehende Erklärungen
+ Der Vergleich der Messbasen kann über einen nicht abhörsicheren Kanal erfolgen. Die einzige Information, die darüber vermittelt wird, ist, bei welchen Messungen Bob die passende Messbasis gewählt hat. Die gemessenen Zustände selbst und somit auch den Schlüssel kennen weiterhin nur Alice und Bob.
+ Soll die Schlüsselübertragung abgehört werden, muss sich die abhörende Person (in der Regel als _Eve_ bezeichnet, vom englischen _eavesdropping_) zwischen Alice und Bob schalten, da Einzelphotonen nicht kopiert werden können. Damit Bob nichts davon merkt, muss Eve die gemessenen Polarisationszustände weiter an Bob schicken. Da Eve mit einer Wahrscheinlichkeit von 50 % die "falsche" Messbasis wählt, kommt es bei der Übertragung der Zustände von Alice zu Bob zu Fehlern. Diese werden ersichtlich, wenn Alice und Bob die ersten paar Stellen der von ihnen generierten Schlüssel untereinander vergleichen. So fällt der Abhörvorgang auf.
#pagebreak()

#let fig_stack = [
    #stack(dir: ttb, spacing: 1em)[
        #show figure: set align(right)
        #figure(image("Abbildungen/QR_QC_Bundle.png", width: 3cm), numbering: none)
        #show figure: set align(center)
        #figure(
            image("Abbildungen/Screenshot_Alice.jpg", width: 5cm),
            caption: [Screenshot #linebreak() aus _phyphox_. #v(1em)]
        ) <Alice>
    ] 
]

#wrap-content(fig_stack, align: right+top, column-gutter: 1.5em)[
    = Das Experiment
    == Übersicht und Vorbereitung
    Da Einzelphotonenquellen teuer und aufwänding zu justieren sind, wird in _phyphox_ ein Analogieversuch durchgeführt. Hierbei werden gesendete Einzelphotonen durch farbige Patches auf dem Smartphone-Bildschirm simuliert (siehe @Alice). Jedem Polarisationszustand ist genau eine Farbe zugewiesen. Um den Zustand zu messen, kann man mit der Kamera eines zweiten Geräts die Farbe des Patches und somit den gesendeten Polarisationszustand einlesen. Diese wird anschließend intern "gemessen"#footnote[Sowohl zur Generierung als auch zur Messung der Zustände werden aus dem Rauschen des Beschleunigungssensors erzeugte Zufallszahlen verwendet. Diese werden von Pseudozufallszahlen überlagert, um die Funktion des Experiments auch auf Geräten mit defektem Beschleunigungssensor zu ermöglichen.] #v(1em)

    Es existieren insgesamt sieben _phyphox_-Experimente zum BB84-Protokoll. Hiervon sind drei für die Einstiegsversuche gedacht und vier für die Versuche für Fortgeschrittene. Die Experimente lassen sich als Bundle über den QR-Code oben rechts in der _phyphox_-App laden. Hierzu in _phyphox_ auf das Plus-Symbol klicken und "Neues Experiment von einem QR-Code" auswählen. #v(1em)

    Für jeden der Versuche gibt es eine Tabelle auf dem Auswertungsbogen
]

== Einstiegsversuche
Diese Versuche sollten unbedingt vor den Versuchen für Fortgeschrittene durchgeführt werden. Die zugehörigen _phyphox_Experimente_ sind:
- Alice: Schickt Polarisationszustände (als farbige Patches)
- Bob: "Misst" Polarisationszustände, indem er Alices farbige Patches mit der Kamera ausliest.
- Eve: Fängt Polarisationszustände von Alice ab und schickt die gemessenen Zustände weiter an Bob.

=== Versuch 1: Schlüsselerzeugung
Hierfür werden zwei Personen und zwei Smartphones benötigt. Eine Person bedient das Alice-Experiment, die andere Person bedient das Bob-Experiment.\
Lasst Alice und Bob mithilfe des BB84-Protokolls einen Schlüssel erstellen. _Nutzt hierfür die Tabelle auf dem Auswertungsbogen!_

#showybox(
    title: [*Das BB84-Protokoll*],
    frame: (
        border-color: green.darken(50%),
        title-color: green.darken(50%),
        body-color: white, 
        radius: 2pt,
        thickness: 2pt,
    ),
    [
        #set text(size: 0.9em)
        #enum(
            [Alice generiert einen zufälligen Polarisationszustand.],
            [Bob misst den Polarisationszustand mit einer zufälligen Messbasis.],
            [Alice und Bob notieren sich die jeweils gewählte Basis und erzeugten bzw. gemessenen Polarisationszustand.],
            [Alice und Bob notieren sich das zur Polarisationsrichtung zugeordnete Bit: $0$ für $h$ oder $-$, $1$ für $v$ oder $=$.]
        )
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: green.darken(50%)))
        #enum(start: 5,
            [Alice und Bob wiederholen die Schritte 1-4 mehrmals.],
            [Alice und Bob vergleichen für jede Messung die Messbasen.],
            [Stimmen die Messbasen überein, wird das zugehörige Bit für den Schlüssel ver-wendet (ansonsten nicht).]
        )
    ]
) #v(1em)

=== Versuch 2: Abhören
In diesem Versuch sollt ihr untersuchen, was passiert, wenn eine dritte Person versucht, die Schlüsselübertragung abzuhören. Hierzu ist das Experiment _Eve_ gedacht. Eve schaltet sich zwischen Alice und Bob. Sie fängt Einzelphotonen von Alice ab und misst die Polarisationszustände. Die gemessenen Zustände schickt sie weiter an Bob.
#[
    #set enum(numbering: "a)")
    + Führt das BB84-Protokoll wie bisher aus, wobei sich Eve zwischen Alice und Bob schaltet. _Nutzt hierfür die Tabelle auf dem Auswertungsbogen!_\
     Da Alice und Bob nichts von Eve wissen, vergleichen sie bei der Schlüsselerstellung auch weiterhin ihre Messbasen miteinander.
    + Vergleicht den von Alice erstellten Schlüssel mit dem von Bob erstellten Schlüssel.
        - Was fällt auf?
        - Wie lässt sich eure Beobachtung erklären?
]
#pagebreak()

== Versuche für Fortgeschrittene
In diesen Versuchen werden insgesamt vier _phyphox_-Experimente verwendet:
- V-Alice
- V-Bob
- V-Eve
- Eve, u there? #v(1em)

V-Alice unterscheidet sich von Alice dahingehend, dass die gesendeten Polarisationszustänge nicht mehr direkt einsehbar sind. Dies wird durch zwei Maßnahmen erreicht:
+ Die generierten Zustände (max. 20) werden in einem separaten Reiter gespeichert, sodass sie zu einem späteren Zeitpunkt in eine Tabelle übertragen werden können.
+ Die Farben sind nun nicht mehr eindeutig einem Polarisationszustand zugeordnet. Stattdessen wird das Farbsignal über Pseudozufallszahlen verschlüsselt. #v(1em)

V-Bob unterscheidet sich von Bob dahingehend, dass er das Farbsignal wieder entschlüsseln kann. V-Eve und Eve unterscheiden sich in allen Aspekten, die V-Alice und V-Bob betreffen. #v(1em)

#showybox(
    title: text(size: 20pt)[*Wichtig!*],
    frame: (
        border-color: green.darken(50%),
        title-color: green.darken(50%),
        body-color: white, 
        radius: 2pt,
        thickness: 2pt,
    ),
    [
        #list(
            [Damit die Entschlüsselung des Farbsignals funktioniert, müssen die Zustandszähler der miteinander kommunizierenden Experimente synchron laufen!\
            Das bedeutet, dass die Zustandszähler immer _nach_ Bobs Messung den gleichen Wert anzeigen.],
            [Der Kanal Alice-Bob verwendet eine andere Codierung als der Kanal Eve-Bob. Im Bob-Experiment muss daher zu allererst ausgewählt werden, _wessen_ Signal empfangen wird!],
        )
    ]
) #v(1em)

Das Ziel der Nicht-Einsehbarkeit der gesendeten Zustände ist eine Annäherung der Analogie an die Realität. Alice und Bob können dort während der Photonenübertragung schließlich nicht prüfen, ob die Schlüsselübertragung wie vorgesehen funktioniert hat.
#pagebreak()

=== Versuch 3: Verdeckte Schlüsselerzeugung
Dieser Versuch entspricht Versuch 1.

=== Versuch 4: Verdecktes Abhören
Dieser Versuch entspricht Versuch 2.

=== Versuch 5: Eve, u there?
Dieser Versuch wird wie Versuch 3 durchgeführt, mit folgender Änderung:\
Statt "V-Alice" komt das Experiment "Eve, u there?" zum Einsatz. Es funktioniert genauso wie "V-Alice" (d.h. Bob stellt den Kanal Alice-Bob ein), allerdings kann über einen separaten Reiter Eve zugeschaltet werden, die dann intern den generierten Zustand misst und diesen als Farbsignal ausgibt.\
Für Bob ist nicht ersichtlich, ob er das Farbsignal von Alice oder von Eve bekommt. Das Ziel des Versuchs ist es, dass Bob erkennt, ob die Schlüsselübertragung abgehört wurde oder nicht.
