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
#show figure: set figure(supplement: [Figure])
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
    -- Handout for the analogy experiment --
]

= Background and Theory
The BB84 protocol is a method from quantum cryptography. It provides a way to generate digital keys by exploiting quantum effects and to exchange them in a manner that is secure against eavesdropping. It was published in 1984 by Charles H. Bennett and Gilles Brassard.

== Motivation
Many common encryption algorithms can be cracked significantly faster by sufficiently powerful quantum computers than by classical computers. One example is the RSA scheme, where security is based on the difficulty of factoring sufficiently large numbers (prime factors with over 100 digits) in a reasonable time (this currently takes several weeks). The so-called _Shor algorithm_, which was already published in 1994, was designed for sufficiently large and low-error quantum computers, and could perform such a factorisation in a reasonable time (presumably a few seconds).
For this reason, it is sensible to study quantum-cryptographic protocols in which security arises from exploiting specific quantum effects that cannot be beaten by greater computational power and/or quantum computing.

== Concept of message transmission
To transmit messages securely, a key is required. In message transmission, every message and every key consists of zeros and ones. Encryption can be performed according to the following rules: #v(0.5em)
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
            }), caption: [$h$/$v$ measuring base #v(1em)], numbering: none
        ),
        figure(
            cetz.canvas(length: 1cm, {
                import cetz.draw: *
                line((x:-1.7, y:1.7), (x:1.7, y:-1.7), stroke: 1.5pt, name: "-", mark: (start: ">", end: ">", fill: black))
                line((x:-1.7, y:-1.7), (x:1.7, y:1.7), stroke: 1.5pt, name: "+", mark: (start: ">", end: ">", fill: black))
                content("-.0%", [$-$], anchor: "south", padding: 0.1)
                content("+.100%", [$+$], anchor: "south", padding: 0.1)
            }), caption: [$+$/$-$ measuring base #v(1em)], numbering: none
        )
    ), caption: [Four polarisation states, divided into two measurement bases. #v(1em)]
) <measuring_bases>
This could look as follows: #v(0.5em)
#grid(
    columns: (30%, 1fr), rows: 5mm, gutter: 1em,
    align: (right, center),
    [Message:], [1~ 1~ 0~ 0~ 0~ 1~ 1~ 1~ 0],
    [Key:], [0~ 1~ 1~ 0~ 1~ 0~ 0~ 0~ 1],
    [Encrypted Message:], [1~ 0~ 1~ 0~ 1~ 1~ 1~ 1~ 1]
)\
Since both $0+0=0$ and $1+1=0$ hold, the key can also be used again for decryption: #v(0.5em)
#grid(
    columns: (30%, 1fr), rows: 5mm, gutter: 1em,
    align: (right, center),
    [Encrypted Message:], [1~ 0~ 1~ 0~ 1~ 1~ 1~ 1~ 1],
    [Key:], [0~ 1~ 1~ 0~ 1~ 0~ 0~ 0~ 1],
    [Message:], [1~ 1~ 0~ 0~ 0~ 1~ 1~ 1~ 0]
)\
Since keys are generally at least as long as the message (and thus the key does not repeat within the message), it is not possible to decrypt the encrypted message without knowing the key. To ensure secure transmission, one therefore "only" needs to exchange the key in a manner that is secure against eavesdropping. The BB84 protocol can be used for this purpose.

== Physical Foundations of the BB84 Protocol
In the BB84 protocol, single photons are sent from a sender (usually called _Alice_) to a receiver (usually called _Bob_). The following *properties of single photons* are crucial for the protocol to work:
- A single photon cannot be copied.\
 $=>$ One can measure the polarisation state of a single photon only once.
- A single photon cannot be split.
The latter property ensures that the polarisation state can only be measured sharply if the photon can assume only one of two known, mutually orthogonal states. #v(1em)

_Example_: If I know that a photon is polarised either in the $h$ or in the $v$ direction (see @measuring_bases), I can align a polariser in the $v$ direction. A $v$-polarised photon then passes through with 100% probability, but an $h$-polarised photon will not pass through. This way the state is measured sharply. However, if a photon that is neither $h$- nor $v$-polarised passes through the polariser, it cannot split into a $v$ component and an $h$ component, so it passes through with a probability that depends on the angle relative to the $v$ direction. Since this this probability is unknown, I cannot make a statement about the polarisation state (except "_not_ $h$" if the photon passes through, and "_not_ $v$" if it does not). #v(1em)

The above example holds for all pairs of mutually orthogonal states. Such a pair of states is therefore also called a _measurement basis_. In the BB84 protocol, two measurement bases rotated by $45degree$ with respect to each other are used (see @measuring_bases).

== Procedure of the BB84 Protocol
+ Alice sends a random sequence of polarisation states to Bob.
+ Bob knows that each single photon was prepared either in the $h$/$v$ measurement basis or in the $+$/$-$ measurement basis. Therefore, he measures each single photon randomly either in the $h$/$v$ basis or in the $+$/$-$ basis:
    - Suppose Alice sends an $h$-polarised photon.
    - If Bob measures the photon in the $h$/$v$ basis, he will also measure an $h$ polarisation.
    - If Bob measures the photon in the $+$/$-$ basis, he can only measure a $+$ or a $-$ polarisation. Since the $h$/$v$ and $+$/$-$ measurement bases are rotated by $45degree$ with respect to each other, Bob measures a $+$ polarisation with a probability of 50% and a $-$ polarisation with a probability of 50% as well.
+ For each transmitted photon, Alice and Bob compare the chosen basis system. For those single photons where the basis systems agree, Bob must have measured the polarisation state sent by Alice. Only the states of these photons are taken into account for key generation.
+ The key is generated as follows:
    - $h$ polarisation or $-$ polarisation: 0
    - $v$ polarisation or $+$ polarisation: 1
+ Alice compares the first few digits of the key she generated with the first few digits of the key Bob generated (in reality about 1000 digits) to ensure that the transmission has worked.

#figure(
    image("Figures/BB84_complete.pdf", width: 100%), caption: [Example of the BB84 protocol. #v(1em)], placement: top
) <BB84>

An example can be found in @BB84.

== Further Explanations
+ The comparison of the measurement bases can be carried out over a channel that is not secure against eavesdropping. The only information conveyed this way is for which measurements Bob chose the correct measurement basis. The measured states themselves, and thereby also the key, remain known only to Alice and Bob.
+ If the key transmission is to be eavesdropped, the eavesdropper (usually referred to as _Eve_, from _eavesdropping_) would have to insert herself between Alice and Bob, since single photons cannot be copied. In order for Bob not to notice this, Eve must forward the measured polarisation states to Bob. Since Eve will choose the "wrong" measurement basis with a probability of 50%, errors occur in the transmission of the states from Alice to Bob. These become apparent when Alice and Bob compare the first few digits of the keys they generated. In this way, the eavesdropping is detected.
#pagebreak()

#let fig_stack = [
    #stack(dir: ttb, spacing: 1em)[
        #show figure: set align(right)
        #figure(image("Figures/QR_QC-Bundle.png", width: 3cm), numbering: none)
        #show figure: set align(center)
        #figure(
            image("Figures/Screenshot_Alice.jpg", width: 5cm),
            caption: [Screenshot #linebreak() from _phyphox_. #v(1em)]
        ) <Alice>
    ] 
]

#wrap-content(fig_stack, align: right+top, column-gutter: 1.5em)[
    = The Experiment
    == Overview and Preparation
    Since single-photon sources are expensive and cumbersome to align, you will perform an analogy experiment in _phyphox_. Here, transmitted single photons are simulated by coloured patches on the smartphone screen (see @Alice). Each polarisation state is assigned exactly one colour. To measure the state, one can use the camera of a second device to read out the colour of the patch and the associated polarisation state. This is then internally "measured."#footnote[Random numbers generated from the noise of the accelerometer is used to both generate and measure the states. These are overlaid with pseudo-random numbers to ensure that the experiment functions even on devices with a defective accelerometer.] #v(1em)

    There are a total of seven _phyphox_ experiments for the BB84 protocol. Three of these are intended for the introductory experiments and four for the advanced experiments. The experiments can be loaded as a bundle in the _phyphox_ app via the QR code at the top right of this page. To do this, tap the plus symbol in _phyphox_ and select "New experiment from a QR code". #v(1em)

    For each of the experiments there is a table on the worksheet.
]

= Introductory Experiments
These experiments should definitely be carried out before the advanced experiments. The corresponding _phyphox_ experiments are:
- Alice: Sends polarisation states (as coloured patches)
- Bob: "Measures" polarisation states by reading out Alice's coloured patches with the camera.
- Eve: Intercepts polarisation states from Alice and forwards the measured states to Bob.

=== Experiment 1: Key Generation
For this experiment, two people and two smartphones are required. One person operates the Alice experiment, the other person operates the Bob experiment.\
Have Alice and Bob generate a key using the BB84 protocol. _Use the table on the worksheet for this!_

#showybox(
    title: [*The BB84 protocol*],
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
            [Alice generates a random polarisation state.],
            [Bob measures the polarisation state using a random measurement basis.],
            [Alice and Bob record the basis they each chose and the polarisation state they generated / measured.],
            [Alice and Bob record the bit associated with the polarisation direction: $0$ for $h$ or $-$, $1$ for $v$ or $=$.]
        )
        #line(length: 100%, stroke: (thickness: 1pt, dash: "dashed", paint: green.darken(50%)))
        #enum(start: 5,
            [Alice and Bob repeat steps 1–4 several times.],
            [Alice and Bob compare the measurement bases for each measurement.],
            [If the measurement bases agree, the corresponding bit is used for the key (otherwise it is not).]
        )
    ]
) #v(1em)

=== Experiment 2: Eavesdropping
In this experiment, you should investigate what happens when a third party tries to eavesdrop on the key transmission. The _Eve_ experiment is intended for this purpose. Eve inserts herself between Alice and Bob. She intercepts single photons from Alice and measures the polarisation states. She then forwards the measured states to Bob.
#[
    #set enum(numbering: "a)")
    + Carry out the BB84 protocol as before, with Eve between Alice and Bob. _Use the table on the worksheet for this!_\
     Since Alice and Bob are unaware of Eve, they continue to compare their measurement bases with each other during key generation.
    + Compare the key generated by Alice with the key generated by Bob.
        - What do you notice?
        - How can your observation be explained?
]
#pagebreak()

== Advanced Experiments
In these experiments, a total of four _phyphox_ experiments are used:
- V-Alice
- V-Bob
- V-Eve
- Eve, u there? #v(1em)


V-Alice differs from Alice in that the transmitted polarisation states are no longer directly visible. This is achieved by two measures:
+ The generated states (max. 20) are stored in a separate tab so that they can be transferred to a table at a later time.
+ The colours are no longer uniquely assigned to a polarisation state. Instead, the colour signal is encrypted using pseudo-random numbers. #v(1em)


V-Bob differs from Bob in that he can decrypt the colour signal again. V-Eve and Eve differ in all aspects that concern V-Alice and V-Bob. #v(1em)


#showybox(
    title: text(size: 20pt)[*Important!*],
    frame: (
        border-color: green.darken(50%),
        title-color: green.darken(50%),
        body-color: white, 
        radius: 2pt,
        thickness: 2pt,
    ),
    [
        #list(
            [For the colour signal decryption to work, the state counters of the communicating experiments must run in sync!\
            This means that the state counters must always show the same value _after_ Bob's measurement.],
            [The Alice–Bob channel uses a different encoding than the Eve–Bob channel. In the Bob experiment, you must therefore first select _whose_ signal is being received!],
        )
    ]
) #v(1em)


The goal of making the transmitted states non-visible is to bring the analogy closer to reality. After all, during photon transmission, Alice and Bob cannot check whether the key transmission has worked as intended.
#pagebreak()


=== Experiment 3: Covert Key Generation
This experiment corresponds to Experiment 1.


=== Experiment 4: Covert Eavesdropping
This experiment corresponds to Experiment 2.


=== Experiment 5: Eve, u there?
This experiment is performed like Experiment 3, with the following change:\
Instead of "V-Alice", the experiment "Eve, u there?" is used. It works exactly like "V-Alice" (i.e. Bob sets the channel to Alice–Bob), but Eve can be activated via a separate tab, who then internally measures the generated state and outputs it as a colour signal.\
For Bob, it is not apparent whether he is receiving the colour signal from Alice or from Eve. The aim of the experiment is for Bob to determine whether the key transmission has been eavesdropped on or not.