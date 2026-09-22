#import "@preview/unify:0.6.0":num, unit, qty
#set text(lang: "en", font: "New Computer Modern", 12pt)
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
#let students = false
#align(center)[
    #set text(size: 25pt, weight: "bold")
    Planck's Constant
]

= Material
#figure(
    grid(
        columns: (1fr, 40%, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Figures/h-box.png", width: 90%), caption: [_phyphox_:h-box (voltage control)]),
        figure(image("Figures/Blackout_box.png", width: 100%), caption: [Blackout box #linebreak() ~]),
        figure(image("Figures/Aid_free.png", width: 70%), caption: [Stabilisation aid #linebreak() ~])
    )
)
#figure(
    grid(
        columns: (1fr, 30%, 1fr),
        gutter: 1em,
        align: bottom,

        figure(image("Figures/LED_insert_free.png", width: 90%), caption: [Various LED inserts of different wavelengths \ #linebreak()]),
        figure(image("Figures/Connection_cable.png", width: 100%), caption: [Connection cable \ #linebreak() ~]),
        figure(image("Figures/Smartphone_free.png", width: 90%), caption: [Smartphone (light intensity measurement) #linebreak() ~])
    )
)
#pagebreak()

= Setup/Preparation
+ Set up the experimental apparatus according to the figure below.
+ Download the corresponding _phyphox_ experiment bundle:
    - The _phyphox_: h-Box must be connected to the smartphone (or another power source).
    - Open the _phyphox_ app.
    - Click on the plus symbol.
    - Select "Add experiment for Bluetooth device".
    - Select your _phyphox_:h-Box from the list (numbering on the side).
    - Wait until the download is complete.
    - Save the desired experiment (or both) in the collection.


#figure(image("Figures/Setup.png"), caption: [Completed setup], placement: bottom)
#pagebreak()

= Procedure with the smartphone camera
- If the appropriate _phyphox_ experiment does not open automatically or needs to be reopened during the experiment:
    + Select the _phyphox_ experiment *Planck's Constant* (camera in the icon) under the _Quantum Physics_ section.
    + Select your _phyphox_: h-Box from the appearing list of Bluetooth devices (the number is on the side of the box). $=>$ The box will now connect to the app and send the value of the applied voltage.
- Determine the threshold voltages of several LEDs (13 steps):
    + Insert an LED insert into the blackout box.
    + Set the voltage regulator on the _phyphox_: h-Box to maximum.
    + Place your smartphone on the blackout box so that the camera is positioned above the white reflective material. Use the stabilization aid if necessary.
    + Reduce the voltage to the highest value at which the camera's selection area _has no overexposure anywhere_ (i.e. the selection area must _not contain any red-marked areas_).
        - The selection area is the slightly brighter rectangle within the camera preview.
        - Overexposure may occur outside the selection area.
        - The selection area can be moved. To do this, tap on the camera preview.
    + Switch to the "Identify the threshold voltage" tab.
    + Start the measurement (play button in the top right).
    + Record an LED characteristic curve by _slowly_ reducing the voltage.
    + Pause the measurement.
    + Place the green regression line in the characteristic curve _by adjusting the minimum and maximum considered intensity_. The regression line should run through the approximately linear region of the characteristic curve. Any saturation curve should therefore _not_ be taken into account.
    + Note down the threshold voltage $U_sans("threshold")$ calculated by the experiment in the table on page #ref(<tabelle>, supplement: [page]). Also note the corresponding uncertainty.
    + Enter the wavelength of the LED in the experiment and save the _wavelength-threshold voltage_ pair in the experiment. The pair is now available in the "Measuring h" tab.
    + Do _not_ use the button with the trash can symbol during the procedure. This deletes _all_ data.\
     Now delete the measurement curve using the button provided specifically for this purpose.
    + Repeat the measurement process with the next LED.
#pagebreak()

= Procedure without the smartphone camera
- If the appropriate _phyphox_ experiment does not open automatically or needs to be reopened during the experiment:
    + Select the _phyphox_ experiment *Planck's Constant* (no camera in the icon) under the _Quantum Physics_ section.
    + Select your _phyphox_: h-Box from the appearing list of Bluetooth devices (the number is on the side of the box). $=>$ The box will now connect to the app and send the value of the applied voltage.
- Determine the threshold voltages of several LEDs (11 steps):
    + Set the voltage regulator on the _phyphox_: h-Box to minimum.
    + Insert an LED insert into the blackout box.
    + Switch to the "Determine Threshold Voltage" tab.
    + Start the measurement (play button in the top right).
    + Record an LED characteristic curve by varying the voltage.
    + Pause the measurement.
    + Place the green regression line in the characteristic curve _by adjusting the minimum and maximum considered current_. The regression line should run through the approximately linear region of the characteristic curve. Any saturation curve should therefore _not_ be taken into account.
    + Note down the threshold voltage $U_sans("threshold")$ calculated by the experiment in the table on page #ref(<tabelle>, supplement: [page]). Also note the corresponding uncertainty.
    + Enter the wavelength of the LED in the experiment and save the _wavelength-threshold voltage_ pair in the experiment. The pair is now available in the "Measuring h" tab.
    + Do _not_ use the button with the trash can symbol during the procedure. This deletes _all_ data.\
     Now delete the measurement curve using the button provided specifically for this purpose.
    + Repeat the measurement process with the next LED.
#pagebreak()


= Analysis
#if not students [
    + Calculate the corresponding photon energies from the threshold voltages\
    _Reminder_: $e = 1.602 dot 10^(-19) "C"$
    + Enter the obtained frequency-energy pairs into the diagram on page #ref(<diagramm>, supplement: [page]).
    + Draw a regression line in the diagram and determine its gradient.
    + #underline[_If uncertainties were addressed_]:\
        - Draw the lines of minimum and maximum slope (within the scope of the uncertainties) in the diagram.
        - Calculate the uncertainty in the measured value for Planck's constant.
    + Compare the obtained value for Planck's constant with the value displayed in the app and discuss possible deviations.
] else [
    + Calculate the corresponding light frequencies with corresponding uncertainty from the wavelengths entered in the table on page #ref(<tabelle>, supplement: [page]). The uncertainty is determined using Gaussian error propagation.
    + Calculate the corresponding photon energies with their respective uncertainties from the threshold voltages.
    + Plot the pairs using Python or Excel (including error bars) and create a regression line.
    + Draw the lines of minimum and maximum slope through the uncertainty regions.
    + Calculate a value for Planck's constant including uncertainty from the slopes of the three drawn lines.
    + Perform a comparison of the obtained value with the literature value.
]
#pagebreak()

#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            let alignment = if it.y == 0 {left} else {right}
            if it.x in (2,3) and it.y != 0 [
                #if not students {align(alignment + horizon)[#it]} else []
            ] else {align(alignment + horizon)[#it]}
        }
        rotate(-90deg, reflow: true)[
            #figure(
                caption: [Table 1: Measurement data of threshold voltage as a function of wavelength.],
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
                    [*$lambda "[nm]"$*], [*$u_lambda "[nm]"$*], [*$f "["10^14 "Hz]"$*], [*$u_f "["10^14 "Hz]"$*], [*$U_sans("threshold") "[V]"$*], [*$u_U "[V]"$*], [*$E_sans("photon") "[J]"$*], [*$u_E "[J]"$*],

                     [405], [7], [7.40], [0.13], [], [], [], [],
                     [463], [8], [6.48], [0.12], [], [], [], [],
                     [469], [10], [6.39], [0.14], [], [], [], [],
                     [504], [18], [5.95], [0.22], [], [], [], [],
                     [575], [8], [5.21], [0.08], [], [], [], [],
                     [586], [8], [5.12], [0.07], [], [], [], [],
                     [591], [7], [5.07], [0.07], [], [], [], [],
                     [595], [8], [5.03], [0.07], [], [], [], [],
                     [630], [5], [4.76], [0.04], [], [], [], [],
                     [631], [8], [4.75], [0.07], [], [], [], [],
                     [655], [9], [4.58], [0.07], [], [], [], []
                )
            ) <tabelle>
        ]
    }
]

#if not students [
    #page[
        #set align(center + horizon)
        #rotate(-90deg, reflow: true)[
            #layout(size => {
                figure(
                    pad(x: -0.5cm, y: -3cm, image("Figures/Analysis_Graph.pdf", width: 100%))
                )
            })
        ]<diagramm>
    ]
    #page[
        #set align(center + horizon)
        #rotate(-90deg, reflow: true)[
            #layout(size => {
                figure(
                    pad(x: -0.5cm, y: -3cm, image("Figures/Analysis_Graph.pdf", width: 100%))
                )
            })
        ]
    ]
]