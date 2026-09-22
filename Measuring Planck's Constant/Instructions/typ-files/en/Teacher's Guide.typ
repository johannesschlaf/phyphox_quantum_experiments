#import "@preview/unify:0.6.0":num, unit, qty
#import "@preview/cetz:0.4.2"
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/showybox:2.0.4": showybox
#set text(lang: "en", font: "New Computer Modern", 12pt)
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
#show figure: set figure(supplement: [Figure])
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
    Planck's Constant\
    #set text(size: 20pt, weight: "bold")
    -- Teacher's Guide --
]
= Motivation and Objective
This experiment serves to address the quantization of the energy of electromagnetic radiation, the discovery of which initiated a series of rapidly successive research studies and quantum-mechanical models through which numerous previously unexplained phenomena, such as emission and absorption spectra, could be explained (the introduction of Planck's constant as a free parameter in a derivation of the black-body radiation spectrum in 1900 by Max Planck is therefore generally regarded as the birth of quantum physics, even though its interpretation as quantization of the energy of electromagnetic radiation was made later in 1905 by Albert Einstein). This is done by determining Planck's constant from the threshold voltage of different LEDs.

= Physical Foundations
== Light
=== Light as an electromagnetic wave
In general, a wave is understood as a temporal change of a state that propagates through space, whereby no matter is transported but energy is. The state of an electromagnetic field is described by the electric field strength $arrow(E)$ and the magnetic induction $arrow(B)$. In an electromagnetic wave, $arrow(E)$ and $arrow(B)$ are oriented perpendicular to each other. The wave propagates in a direction that is perpendicular to the plane formed by $arrow(E)$ and $arrow(B)$. $arrow(E)$ and $arrow(B)$ change periodically (see @f.EM_wave).\
The distance over which $arrow(E)$ and $arrow(B)$ complete one period is called the wavelength $lambda$. It is related to the period $T$ and the oscillation frequency $f$ as follows:
$
  f = 1/T = c/lambda
$
Here, $c$ corresponds to the speed of light in vacuum ($c approx$ 299,800,000 $"m"/"s"$).\
The perceived color of light depends on its wavelength (see @f.wavelength).


#figure(placement: top,
    image("Figures/EM_wave.pdf", width: 50%),
    caption: [Light as an electromagnetic wave. The wavelength $lambda$ corresponds to the distance between two points of maximum electric field strength. Image source: Wikimedia Commons. By: And1mu. #v(1em)]
)<f.EM_wave>


#figure(placement: bottom,
    image("Figures/Wavelength.png", width: 100%),
    caption: [Color spectrum of visible light as a function of wavelength. Image source: Schmidt, P. & Windhausen, S. (2024). _Lohmeyer Praktische Bauphysik_, p. 806. Springer Vieweg. ]
)<f.wavelength>


=== Light as particles
Light energy is _quantized_, i.e. it exists only as multiples of the smallest possible energy units, so-called _photons_. The energy $E_(#text(font: "Calibri")[ph])$ of a photon depends on the frequency $f$. The following holds:
$
  E_(#text(font: "Calibri")[ph]) = h dot f
$
The proportionality constant $h$ is called _Planck's constant_. It is a fundamental physical constant.\


The division of light energy into photons corresponds to the idea of very tiny light particles. It contradicts the idea of light as a continuous electromagnetic wave. Depending on the experiment, light behaves like a collection of light particles, like an electromagnetic wave, or like both simultaneously. This fact is referred to as _wave-particle duality_.

== Diodes
Diodes are electronic components that conduct current only in one direction. If they are connected the wrong way round (reverse direction), they block the circuit and can be damaged if the voltage is high enough. If they are connected in the forward direction, a certain voltage, the so-called _threshold voltage_, must be reached before current can flow. For conventional diodes, this voltage is typically around 0.7 $"V"$. A typical current-voltage characteristic can be found in @f.cc_reduced.\
The threshold voltage can be approximately determined by drawing a tangent to the characteristic curve. The threshold voltage corresponds approximately to the zero crossing of the tangent.\


For so-called LEDs (Light Emitting Diodes), part of the electrical energy is converted into photons. The minimum threshold voltage $U_(#text(font: "Calibri")[threshold])$ required for the LED to emit light corresponds to the photon energy. The following holds:
$
  E_(#text(font: "Calibri")[Ph]) = e dot U_(#text(font: "Calibri")[threshold])
$
Here, $e$ corresponds to the elementary charge ($e approx$ 1.602 $dot 10^(-19) "C"$).


#figure(placement: bottom,
    image("Figures/LED_cc_reduced.pdf"),
    caption: [Typical current–voltage characteristic of a diode with a series resistor.]
)<f.cc_reduced>

pagebreak()
= Experimental Setup and Procedure
Data acquisition in this experiment is carried out with the smartphone app _phyphox_, developed at RWTH Aachen University. This app accesses the internal sensors of the smartphone and can thus read out measured quantities such as, for example, the instantaneous acceleration. In addition, external sensors can be integrated via Bluetooth. In phyphox, you choose what to measure by selecting one of the available experiments. New experiments can be added over Bluetooth from an external sensor device or through a QR code.\


To determine the threshold voltage of an LED, a characteristic curve as in @f.cc_reduced is required. The current through the LED is approximately proportional to its luminous intensity, so instead of measuring the current directly, you can measure the illuminance inside a blackout box. With the DIY setup provided for this experiment, both current measurement and measurement of the illuminance via the smartphone camera are possible.\


Further information regarding setup, procedure, and evaluation can be found in the experiment instructions.

= Background Information
- In a simplified picture, a diode consists of an n-doped semiconductor (with free electrons in the crystal lattice) and a p-doped semiconductor (with electron deficiencies / free holes) joined together. At the contact point (the so-called pn junction), a charge zone without free charge carriers forms due to the diffusion of electrons (concentration equalization) from n to p; this is the so-called depletion region. If a diode is connected with the positive terminal to n and the negative terminal to p, electrons flow from n to the positive terminal and from the negative terminal to p, which enlarges the charge zone and thus the depletion region. In this direction, only a minimal current flow in the range of a few microamperes occurs (so-called reverse current). If the LED is connected the other way round, the depletion region becomes smaller until, above a certain voltage (threshold or turn-on voltage, about 0.7 $"V"$ for an ordinary diode, between 1.6 $"V"$ and 3.3 $"V"$ for LEDs with a visible emission spectrum), it disappears and current can flow. Photon generation occurs during the recombination of electrons (n) with holes (p), which are located at different energy levels.
#pagebreak()
- The simplified explanation above corresponds to the characteristic curve in @f.cc_approximation. In reality, an ideal diode actually follows the following characteristic (see @f.cc_complete):
$
  I=I_(#text(font: "Calibri")[reverse]) dot exp((e dot U)/(n dot k dot T)-1)
$
Here, $n$ is the so-called ideality factor or emission coefficient. For LEDs, it is typically $n=$ 1.4.


#figure(placement: top,
    image("Figures/LED_cc_approximation.pdf", width: 80%),
    caption: [Simplified characteristic curve of an LED. Current flows only after the threshold voltage is exceeded and then increases linearly with voltage.#v(1em)]
)<f.cc_approximation>


#figure(placement: bottom,
    image("Figures/LED_cc_complete.pdf", width: 80%),
    caption: [Simplified characteristic curve of an LED. Current flows only after the threshold voltage is exceeded and then increases linearly with voltage.]
)<f.cc_complete>


- The threshold voltage is usually defined as the voltage at which 10 % of the maximum permissible current flows through the diode.
- Even for an ideal diode, the threshold voltage of the diode is only _approximately_ determined by the line of best fit. This is partly because, although the characteristic curve can be approximated by a straight line locally, it follows an exponential trend overall. This is already taken into account in the _phyphox_ experiment's calculation of the uncertainty of the threshold voltage.
- LEDs can heat up. This leads to a change in the band structure (usually toward smaller energy differences). The LEDs should therefore not be operated for too long or with much higher voltage than necessary (operating a red LED at 3 $"V"$ is generally not necessary, as the threshold voltage should be below 2 $"V"$).
- Red LEDs can have higher threshold voltages than their wavelength would suggest. This is because the energy band structure around the “light-generation zone” is often designed such that the electrons first fall to an intermediate level before recombining with the holes while emitting photons.
- _If the illuminance is to be measured in the experiment_:
    - Overexposure of the camera must be avoided, since saturation of individual pixels (reaching the maximum brightness value in the HSV color space) in the selected area leads to distortion of the characteristic curve (see below). Therefore, the smartphone camera cannot be pointed directly at the LED, so the blackout box has a reflective surface onto which the camera should be pointed.
    - The luminous intensity of an LED is only approximately proportional to the current. For higher currents, the current–luminous-intensity curve flattens, which results in a flattening of the voltage–luminous-intensity curve.
    - The relative illumination values measured with the _phyphox_ camera are not necessarily proportional to the actual illuminance everywhere. 
        - At higher levels, the camera often shows saturation even without overexposure, which distorts the measured curve.
        - At very low illuminances, the measured values can jump abruptly.
        - Some smartphone models automatically adjust the image brightness above certain light levels, so that only a scatter of points is measured.
     All three effects also depend on the image processing algorithms of the respective smartphone. Turning off all switchable processing functions in the camera app can improve the measurement curves in _phyphox_.
    - When carrying out the experiment, it is particularly important to ensure that the blackout box is sufficiently well covered and that the camera is not overexposed. Insufficient light-tightness leads to the measurement of an offset and consequently to systematically too low threshold voltages. Overexposure leads to flattening, kinks, and possibly to several approximately linear sections, which makes sensible placement of the line of best fit more difficult.