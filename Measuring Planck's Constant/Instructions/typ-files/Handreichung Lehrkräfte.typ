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
    Das Planck'sche Wirkungsquantum\
    #set text(size: 20pt, weight: "bold")
    -- Handreichung für Lehrkräfte --
]
= Motivation und Ziel
Mit diesem Versuch kann die Energiequantelung elektromagnetischer Strahlung thematisiert werden, deren Entdeckung eine Reihe schnell aufeinander folgender Forschungsarbeiten und quantenmechanischer Modelle einläutete, durch die zahlreiche vorher unverstandene Phänomene wie z.B. Emissions- und Absorptionsspektren erklärt werden konnten (die Einführung des Planck'schen Wirkungsquantums als freier Parameter in einer Herleitung zum Spektrum der Schwarzkörperstrahlung im Jahre 1900 durch Max Planck wird daher in der Regel als die Geburtsstunde der Quantenphysik bezeichnet, auch wenn dessen Deutung als Energiequantelung elektromagnetischer Strahlung erst 1905 durch Albert Einstein erfolgte). Dies erfolgt durch die Bestimmung des Wirkungsquantums aus der Schwellenspannung verschiedener LEDs.

= Physikalische Grundlagen
== Licht
=== Licht als elektromagnetische Welle
Unter einer Welle versteht man im Allgemeinen eine sich im Raum ausbreitende zeitliche Änderung eines Zustandes, wobei keine Materie sondern Energie transportiert wird. Der Zustand eines elektromagnetischen Feldes wird durch die elektrische Feldstärke $arrow(E)$ und die magnetische Induktion $arrow(B)$ beschrieben. Bei einer elektromagnetischen Welle sind $arrow(E)$ und $arrow(B)$ senkrecht zueinander ausgerichtet. Die Ausbreitung der Welle erfolgt in einer Richtung, die wiederum senkrecht auf der durch $arrow(E)$ und $arrow(B)$ gebildeten Ebene steht. $arrow(E)$ und $arrow(B)$ ändern sich hierbei periodisch (siehe @f.EM-Welle).\
Die Strecke, in der $arrow(E)$ und $arrow(B)$ eine Periode durchlaufen, wird als Wellenlänge $lambda$ bezeichnet. Sie hängt mit der Periodendauer $T$ und der Schwingungsfrequenz $f$ wie folgt zusammen:
$
  f = 1/T = c/lambda
$
Hierbei entspricht $c$ der Lichtgeschwindigkeit im Vakuum ($c approx$ 2,988 $"m"/"s"$).\
Die wahrgenommene Farbe von Licht hängt von dessen Wellenlänge ab (siehe @f.Wellenlaenge)

#figure(placement: top,
    image("Abbildungen/EM-Welle.pdf", width: 50%),
    caption: [Licht als elektromagnetische Welle. Die Wellenlänge $lambda$ entspricht dem Abstand zweier Punkte maximaler elektrischer Feldstärke. Bildquelle: Wikimedia Commons. By: And1mu. #v(1em)]
)<f.EM-Welle>

#figure(placement: bottom,
    image("Abbildungen/Wellenlaenge.png", width: 100%),
    caption: [Farbspektrumg des sichtbaren Lichts in Abhängigkeit der Wellenlänge. Bildquelle: Schmidt, P. & Windhausen, S. (2024). _Lohmeyer Praktische Bauphysik_, S. 806. Springer Vieweg. ]
)<f.Wellenlaenge>

=== Licht als Teilchen
Lichtenergie ist _gequantelt_, d.h. sie liegt nur als Vielfaches kleinstmöglicher Energieeinheiten, sogenannter _Photonen_ vor. Die Energie $E_(#text(font: "Calibri")[Ph])$ eines Photons ist von der Frequenz $f$ abhängig. Es gilt:
$
  E_(#text(font: "Calibri")[Ph]) = h dot f
$
Die Proportionalitätskonstante $h$ wird als das _Planck'sche Wirkungsquantum_ bezeichnet. Sie ist eine fundamentale Naturkonstante.\

Die Aufteilung der Lichtenergie in Photonen entspricht der Vorstellung kleinster Lichtteilchen. Sie widerspricht dem Bild von Licht als kontinuierliche elektromagnetische Welle. Je nach Experiment verhält sich Licht wie eine Ansammlung von Lichtteilchen, wie eine elektromagnetische Welle oder wie beides gleichzeitig. Diesen Sachverhalt bezeichnet man als _Welle-Teilchen-Dualismus_.

== Dioden
Dioden sind elektronische Bauteile, welche nur in eine Richtung stromdurchlässig sind. Werden sie falsch herum angeschlossen (Sperrrichtung), sperren sie daher den Stromkreis und können, wenn die Spannung hoch genug ist, Schaden nehmen. Werden sie in Durchlassrichtung angeschlossen, muss eine gewisse Spannung, die sogenannte _Schwellenspannung_, erreicht werden, damit ein Strom fließen kann. Bei herkömmlichen Dioden liegt diese Spannung typischerweise bei etwa 0,7 $"V"$. Ein typische Strom-Spannungs-Kennlinie ist in @f.Kennlinie_reduziert zu finden.\
Die Schwellenspannung kann näherungsweise bestimmt werden, indem eine Tangente an die Kennlinie angelegt wird. Die Schwellenspannung entspricht näherungsweise der Nullstelle der Tangente.\

Bei sogenannten LEDs (Light Emitting Diodes) wird ein Teil der elektrischen Energie in Photonen umgesetzt. Die für das Leuchten der LED mindestens notwendige Schwellenspannung $U_(#text(font: "Calibri")[Schwelle])$ entspricht hierbei der Photonenenergie. Es gilt:
$
  E_(#text(font: "Calibri")[Ph]) = e dot U_(#text(font: "Calibri")[Schwelle])
$
Hierbei entspricht $e$ der Elektronenladung ($e approx$ 1,602 $dot 10^(-19) "C"$).

#figure(placement: bottom,
    image("Abbildungen/LED-Kennlinie_reduziert.pdf"),
    caption: [Typische Strom-Spannungs-Kennlinie einer Diode mit vorgeschaltetem Widerstand.]
)<f.Kennlinie_reduziert>

#pagebreak()
= Versuchsaufbau und Durchführung
Die Datenaufnahme erfolgt in diesem Versuch mit der an der RWTH Aachen entwickelten Smartphone-App _phyphox_. Diese greift auf die internen Sensoren des Smartphones zu und kann so Messgrößen wie z.B. die momentane Beschleunigung auslesen. Zudem können über Bluetooth externe Sensoren eingebunden werden. Die Auswahl, was gemessen werden soll, erfolgt über in _phyphox_ auswählbare Experimente. Neue Experimente können über Bluetooth von einem anzusteuernden Gerät oder über einen QR-Code hinzugefügt werden.\

Um die Schwellenspannung einer LED zu bestimmen, wird eine Kennlinie wie in @f.Kennlinie_reduziert benötigt. Der durch die LED fließende Strom ist näherungsweise proportional zu der Leuchtdichte der LED, weswegen anstelle des Stroms auch die Beleuchtungsstärke in einer Abdunklungsbox gemessen werden kann. Mit dem für dieses Experiment vorgesehenen DIY-Aufbau ist sowohl die Strommessung als auch die Messung der Beleuchtungsstärke über die Smartphone-Kamera möglich.\

Weitere Informationen zu Aufbau, Durchführung und Auswertung finden Sie in der Versuchsanleitung.

= Hintergrundwissen
- Eine Diode besteht (vereinfacht) aus einem n-dotierten (freie Elektronen im Kristallgitter) und einem p-dotierten (Elektronenmangen / freie Löcher) Halbleiter, die miteinander verbunden werden. Um die Kontaktstelle (den sogenannten pn-Übergang) bildet sich durch die Diffusion von Elektronen (Konzentrationsausgleich) von n zu p eine Ladungszone ohne freie Ladungsträger aus, die sogenannte Sperrschicht. Wird eine Diode mit dem Pluspol an n und dem Minuspol an p beschaltet, fließen Elektronen aus n zum Pluspol und aus dem Minuspol zu p, was die Ladungszone und somit die Sperrschicht vergrößert. In dieser Richtung kommt es nur zu einem minimalen Stromfluss im Bereich einiger Mikorampere (sogenannter Sperrstrom). Wird die LED anders herum geschaltet, verkleinert sich die Sperrschicht, bis sie ab einer bestimmten Spannung (Schwellen- oder Schleusenspannung, etwas 0,7 $"V"$ für eine gewöhnliche Diode, zwischen 1,6 $"V"$ und 3,3 $"V"$ für LEDs mit sichtbarem Emissionsspektrum) verschwindet und ein Strom fließen kann. Die Photonenerzeugung erfolgt bei der Rekombination der Elektronen (n) mit den Löchern (p), welche sich auf unterschiedlichen Energieniveaus befinden.
#pagebreak()
- Der vereinfachten Erklärung oben entspricht die Kennlinie in @f.Kennlinie_Naeherung. Tatsächlich folgt auch eine ideale Diode der folgenden Kennlinie (siehe auch @f.Kennlinie_komplett):
$
  I=I_(#text(font: "Calibri")[Sperr]) dot exp((e dot U)/(n dot k dot T)-1)
$
Hierbei ist $n$ der sogenannte Idealitätsfaktor oder Emissionskoeffizient. Für LEDs liegt er üblicherweise bei $n=$ 1,4.

#figure(placement: top,
    image("Abbildungen/LED-Kennlinie_Naeherung.pdf", width: 80%),
    caption: [Vereinfachte Kennlinie einer LED. Es fließt erst ab dem Überschreiten der Schwellenspannung ein Strom, der linear zur Spannung verläuft.#v(1em)]
)<f.Kennlinie_Naeherung>

#figure(placement: bottom,
    image("Abbildungen/LED-Kennlinie_komplett.pdf", width: 80%),
    caption: [Vereinfachte Kennlinie einer LED. Es fließt erst ab dem Überschreiten der Schwellenspannung ein Strom, der linear zur Spannung verläuft.]
)<f.Kennlinie_komplett>

- Die Schwellenspannung wird üblicherweise definiert als die Spannung, bei der 10 % des maximal zulässigen Stroms durch die Diode fließen.
- Selbst für eine ideale Diode wird die Schwellenspannung der Diode nur _näherungsweise_ durch die Ausgleichsgerade bestimmt. Dies liegt unter anderem daran, dass die Kennlinie sich lokal zwar durch eine Ausgleichsgerade annähern lässt, global jedoch einem exponentiellen Verlauf folgt. Dies wird im _phyphox_-Experiment in der Berechnung der Unsicherheit auf die Schwellenspannung bereits berücksichtigt.
- LEDs können sich erhitzen. Dies führt zu einer Änderung der Bandstruktur (i.d.R. hin zu kleineren Energiedifferenzen). Die LEDs sollten daher nicht zur lange oder mit sehr viel höherer Spannung als notwendig betrieben werden (eine rote LED mit 3 $"V"$ zu betreiben ist i.d.R. nicht notwendig, da die Schwellenspannung bei unter 2 $"V"$ liegen sollte).
- Rote LEDs können höhere Schwellenspannungen haben, als es ihre Wellenlänge vermuten lassen würde. Dies liegt daran, dass die Energiebandstruktur um die "Lichterzeugungszone" häufig so gestaltet ist, dass die Elektronen zunächst auf ein Zwischenniveau fallen, bevor sie unter Photonenabgabe mit den Löchern rekombinieren.
- _Falls im Versuch die Beleuchtungsstärke gemessen werden soll_:
    - Eine Überbelichtung der Kamera ist zu vermeiden, da das Sättigen einzelner Pixel (Erreichen des maximalen Helligkeitswerts im HSV-Farbraum) im Auswahlbereich zur Verfälschung der Kennlinie (siehe weiter unten) führt. Daher kann die Smartphone-Kamera auch nicht direkt auf die LED gerichtet werden. Stattdessen kommt ein Reflexionsmaterial in der Abdunklungsbox zum Einsatz, auf welches die Kamera gerichtet wird.
    - Die Leuchtdichte einer LED ist nur näherungsweise proportional zum Strom. Für höhere Ströme flacht die Strom-Leuchtdichten-Kurve ab, was sich in einer Verringerung der Steigung der Spannungs-Leuchtdichten-Kennlinie niederschlägt.
    - Die mit der _phyphox_-Kamera gemessenen relativen Beleuchtungswerte sind nicht notwendigerweise überall proportional zur tatsächlichen Beleuchtungsstärke. 
        - Im höheren Wertebereich zeigt sich auch ohne Überbelichtung häufig ein Sättigungsverlauf, der sich in der Kennlinie niederschlagen kann.
        - Bei sehr geringen Beleuchtungsstärken kann es zu sprunghaften Anstiegen kommen.
        - Ab einer gewissen Beleuchtungsstärke kommt es bei einigen Smartphone-Modellen zu einem Gegenregeln der Bildhelligkeit, sodass nur noch eine Punktewolke gemessen wird.
     Alle drei Effekte sind unter anderem auch von den Bildprozessierungsalgorithmen des jeweiligen Smartphones abhängig. Ein Ausschalten aller ausschaltbaren Prozessierungsfunktionen in der Kamera-App kann die Messkurven in _phyphox_ verbessern.
    - Bei der Durchführung ist vor allem darauf zu achten, dass die Abdunklungsbox hinreichend gut abgedeckt ist und dass die Kamera nicht überbelichtet. Eine unzureichende Abdunklung führt zur Messung eines Offsets und folglich zur Messung systematisch zu geringer Schwellenspannungen. Eine Überbelichtung führt zu Abflachungen, Knicken und ggf. zu mehreren näherungsweise linearen Abschnitten, was eine sinnvolle Platzierung der Ausgleichsgeraden erschwert.
