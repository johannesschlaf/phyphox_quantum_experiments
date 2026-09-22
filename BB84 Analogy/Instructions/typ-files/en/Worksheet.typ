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
    The BB84 protocol \
    #set text(size: 20pt, weight: "bold")
    -- Worksheet --
]

#showybox(
    title: text(size: 16pt)[*The BB84 protocol*],
    frame: (
        border-color: green.darken(50%),
        title-color: green.darken(50%),
        body-color: white, 
        radius: 2pt,
        thickness: 2pt,
    ),
    [
        #enum(
            [Alice generates a random polarisation state.],
            [Bob measures the polarisation state using a random measurement basis.],
            [Alice and Bob record the basis they each chose and the polarisation state they generated / measured.],
            [Alice and Bob record the bit associated with the polarisation direction: $0$ for $h$ or $-$, $1$ for $v$ or $=$.]
        )
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: green.darken(50%)) )
        #enum(start: 5,
            [Alice generates a random polarisation state.],
            [Bob measures the polarisation state using a random measurement basis.],
            [Alice and Bob record the basis they each chose and the polarisation state they generated / measured.],
            [Alice and Bob record the bit associated with the polarisation direction: $0$ for $h$ or $-$, $1$ for $v$ or $=$.]
        )
    ]
) #v(7em)

#showybox(
    title: text(size: 16pt)[*Important for the Advanced Experiments!*],
    frame: (
        border-color: rgb("#ff7e22"),
        title-color: rgb("ff7e22"),
        body-color: white, 
        radius: 2pt,
        thickness: 2pt,
    ),
    [
        #list(
           [For the colour signal decryption to work, the state counters of the communicating experiments must run in sync!\
            This means that the state counters must always show the same value _after_ Bob’s measurement.],
            [The Alice–Bob channel uses a different encoding than the Eve–Bob channel. In the Bob experiment, you must therefore first select _whose_ signal is being received!],
        )
    ]
)
#pagebreak()

#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            align(center)[#it]
        }
        rotate(-90deg, reflow: true)[
            #show figure: set align(left)
            #figure(
                caption: [Experiment 1: Key generation], numbering: none,
                pad(right: -2.2cm, bottom: 5cm,
                    table(
                        columns: (auto,)*4 + (1mm,) + (1fr,)*20,
                        rows: (1cm,)*7 + (1mm,) + (2cm,) + (1cm,),
                        stroke: (col, row) => {
                            if row != 7 {(left: 1pt, right: 1pt)} else {none}
                            if row not in (1,2,4,5) {
                                (bottom: 1pt)
                            } else {
                                none
                            }
                        },
                    
                        table.hline(),
                        [], [Photon], [Example], [Example], [],
                        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],

                        [Alice], [Basis], [$h$/$v$], [$h$/$v$], [],
                        ..([],)*20,

                        [], [State], [$v$], [$v$], [],
                        ..([],)*20,

                        [], [Bit], [$1$], [$1$], [],
                        ..([],)*20,

                        [Bob], [Basis], [$+$/$-$], [$h$/$v$], [],
                        ..([],)*20,

                        [], [State], [$+$], [$v$], [],
                        ..([],)*20, 

                        [], [Bit], [$1$], [$1$], [],
                        ..([],)*20,

                        [], [], [], [], [],
                        ..([],)*20,

                        [], [Agree- #linebreak() ment #linebreak() of bases], text(fill: red, size: 20pt)[*$times$*], text(fill: green, size: 20pt)[*$checkmark$*], [],
                        ..([],)*20,

                        table.hline(stroke: (dash: "dashed")),

                        [], [Key], text(fill: red, size: 20pt)[*\/*], text(fill: green, size: 20pt)[*$1$*], [],
                        ..([],)*20
                    )
                )
            )
        ]
    }
]
#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            align(center)[#it]
        }
        rotate(-90deg, reflow: true)[
            #show figure: set align(left)
            #figure(
                caption: [Experiment 2: Eavesdropping], numbering: none,
                pad(right: -0.5cm,
                    table(
                        columns: (auto,)*2 + (1mm,) + (1fr,)*20,
                        rows: (1cm,)*10 + (1mm,) + (2cm,) + (1cm,) + (1cm,),
                        stroke: (col, row) => {
                            if row != 10 {(left: 1pt, right: 1pt)} else {none}
                            if row not in (1,2,4,5,7,8) {
                                (bottom: 1pt)
                            } else {
                                none
                            }
                        },
                    
                        table.hline(),
                        [], [Photon], [],
                        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],

                        [Alice], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Eve], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Bob], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20, 

                        [], [Bit], [],
                        ..([],)*20,

                        [], [], [],
                        ..([],)*20,

                        [], [Agreement #linebreak() of bases #linebreak() (Alice/Bob)], [],
                        ..([],)*20,

                        table.hline(stroke: (dash: "dashed")),

                        [], [Alice's key], [],
                        ..([],)*20, 

                        table.hline(stroke: (dash: "dashed")),

                        [], [Bob's key], [],
                        ..([],)*20, 
                    )
                )
            )
        ]
    }
]
#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            align(center)[#it]
        }
        rotate(-90deg, reflow: true)[
            #show figure: set align(left)
            #figure(
                caption: [Experiment 3: Covert key generation], numbering: none,
                pad(right: -0.5cm,
                    table(
                        columns: (auto,)*2 + (1mm,) + (1fr,)*20,
                        rows: (1cm,)*7 + (1mm,) + (2cm,) + (1cm,),
                        stroke: (col, row) => {
                            if row != 7 {(left: 1pt, right: 1pt)} else {none}
                            if row not in (1,2,4,5) {
                                (bottom: 1pt)
                            } else {
                                none
                            }
                        },
                    
                        table.hline(),
                        [], [Photon], [],
                        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],

                        [Alice], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Bob], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20, 

                        [], [Bit], [],
                        ..([],)*20,

                        [], [], [],
                        ..([],)*20,

                        [], [Agree- #linebreak() ment of #linebreak() bases], [],
                        ..([],)*20,

                        table.hline(stroke: (dash: "dashed")),

                        [], [Key], [],
                        ..([],)*20, 
                    )
                )
            )
        ]
    }
]
#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            align(center)[#it]
        }
        rotate(-90deg, reflow: true)[
            #show figure: set align(left)
            #figure(
                caption: [Experiment 4: Covert eavesdropping], numbering: none,
                pad(right: -0.5cm,
                    table(
                        columns: (auto,)*2 + (1mm,) + (1fr,)*20,
                        rows: (1cm,)*10 + (1mm,) + (2cm,) + (1cm,) + (1cm,),
                        stroke: (col, row) => {
                            if row != 10 {(left: 1pt, right: 1pt)} else {none}
                            if row not in (1,2,4,5,7,8) {
                                (bottom: 1pt)
                            } else {
                                none
                            }
                        },
                    
                        table.hline(),
                        [], [Photon], [],
                        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],

                        [Alice], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Eve], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Bob], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20, 

                        [], [Bit], [],
                        ..([],)*20,

                        [], [], [],
                        ..([],)*20,

                        [], [Agreement #linebreak() of bases #linebreak() (Alice/Bob)], [],
                        ..([],)*20,

                        table.hline(stroke: (dash: "dashed")),

                        [], [Alice's key], [],
                        ..([],)*20, 

                        table.hline(stroke: (dash: "dashed")),

                        [], [Bob's key], [],
                        ..([],)*20, 
                    )
                )
            )
        ]
    }
]
#page[
    #set align(center + horizon)
    #{
        show table.cell: it => {
            align(center)[#it]
        }
        rotate(-90deg, reflow: true)[
            #show figure: set align(left)
            #figure(
                caption: [Experiment 5: Eve, u there?], numbering: none,
                pad(right: -0.5cm,
                    table(
                        columns: (auto,)*2 + (1mm,) + (1fr,)*20,
                        rows: (1cm,)*7 + (1mm,) + (1.5cm,) + (1cm,) + (1cm,),
                        stroke: (col, row) => {
                            if row != 7 {(left: 1pt, right: 1pt)} else {none}
                            if row not in (1,2,4,5) {
                                (bottom: 1pt)
                            } else {
                                none
                            }
                        },
                    
                        table.hline(),
                        [], [Photon], [],
                        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],

                        [Alice], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20,

                        [], [Bit], [],
                        ..([],)*20,

                        [Bob], [Basis], [],
                        ..([],)*20,

                        [], [State], [],
                        ..([],)*20, 

                        [], [Bit], [],
                        ..([],)*20,

                        [], [], [],
                        ..([],)*20,

                        [], [Agreement #linebreak() of bases], [],
                        ..([],)*20,

                        table.hline(stroke: (dash: "dashed")),

                        [], [Alice's key], [],
                        ..([],)*20, 

                        table.hline(stroke: (dash: "dashed")),

                        [], [Bob's key], [],
                        ..([],)*20, 
                    )
                )
            )
        ]
    }
]