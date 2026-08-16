.md file .profile
# BUILD SPEC PROMPT — Pixel-Perfect Rebuild of Current Framer Site
You are rebuilding a Framer-designed responsive case-study website in **Next.js 14 + TailwindCSS + Framer Motion**. The goal is **100% pixel-perfect recreation** from this spec alone. Do not simplify. Do not reinterpret. Match the current design within 2px at desktop and mobile.
The original Framer canvas uses two responsive variants:
- Desktop design frame: **1289px wide × 8292px tall**
- Phone design frame: **409px wide × 7602px tall**
For implementation:
- Desktop target viewport: **1440px**
  - Center a fixed-width stage of **1289px**
  - Body background: `#080808`
- Tablet target viewport: **768px**
  - Use the mobile layout scaled/centered where needed; no horizontal scroll
- Mobile target viewport: **375px**
  - Use the phone layout proportionally scaled from the 409px Framer reference
  - Scale factor for 375px = `375 / 409 = 0.91687`
  - All phone measurements below are based on the 409px source unless noted
---
## 1. DESIGN TOKENS — EXACT VALUES
### 1.1 Colors
Use these exact colors.
```css
--black-page: rgb(8, 8, 8);              /* #080808 */
--black-panel: rgb(5, 5, 5);             /* #050505 */
--black-pure: rgb(0, 0, 0);              /* #000000 */
--white: rgb(255, 255, 255);             /* #FFFFFF */
--white-text: rgb(252, 250, 250);        /* #FCFAFA */
--near-white-text: rgb(250, 250, 250);   /* #FAFAFA */
--glass-white: rgba(255, 255, 255, 0.16);
--glass-border: rgba(255, 255, 255, 0.32);
--transparent-white: rgba(255, 255, 255, 0);
--transparent-gray: rgba(204, 204, 204, 0);
--default-gray: #CCC;
--case2-black: rgb(0, 0, 0);             /* #000000 */
Gradient:

--black-bottom-gradient: linear-gradient(
  180deg,
  rgba(8, 7, 7, 0.99) 0%,
  rgb(5, 5, 5) 100%
);
1.2 Typography
Load these fonts:

Pixelify Sans
Raleway
DM Retrograde
Potta One
Desktop / shared type styles
/* Case number giant */
.case-number-desktop {
  font-family: “Pixelify Sans”;
  font-weight: 400;
  font-size: 300px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
/* Desktop “Case Study” hero title */
.case-title-desktop {
  font-family: “Pixelify Sans”;
  font-weight: 400;
  font-size: 80px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
/* Desktop profile nav text */
.profile-nav-text-desktop {
  font-family: “Raleway”;
  font-weight: 800;
  font-size: 28px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(250, 250, 250);
  text-align: left;
}
/* Desktop intro paragraph */
.case-intro-paragraph-desktop {
  font-family: “Raleway”;
  font-weight: 400;
  font-size: 28px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
/* Rotator/displayer labels */
.rotator-label-large {
  font-family: “DM Retrograde”;
  font-weight: 400;
  font-size: 28px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
.rotator-label-active {
  font-family: “DM Retrograde”;
  font-weight: 400;
  font-size: 25px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
/* Case 2 large headings */
.case2-heading-desktop {
  font-family: “Pixelify Sans”;
  font-weight: 700;
  font-size: 80px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
  text-align: left;
}
/* Case 2 desktop body text */
.case2-body-desktop {
  font-family: “Raleway”;
  font-weight: 700;
  font-size: 35px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
  text-align: center;
}
/* Dot-chain text symbols */
.dot-large {
  font-family: “Potta One”;
  font-weight: 400;
  font-size: 100px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
}
Mobile / phone type styles
/* Mobile hero title */
.case-title-phone {
  font-family: “Pixelify Sans”;
  font-weight: 400;
  font-size: 40px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
  text-align: left;
}
/* Mobile hero number */
.case-number-phone {
  font-family: “Pixelify Sans”;
  font-weight: 400;
  font-size: 60px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
}
/* Mobile intro paragraph */
.case-intro-phone {
  font-family: “Raleway”;
  font-weight: 400;
  font-size: 28px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(252, 250, 250);
}
/* Mobile nav profile */
.profile-nav-text-phone {
  font-family: “Raleway”;
  font-weight: 800;
  font-size: 15px;
  line-height: 1.2em;
  color: rgb(255, 255, 255);
}
/* Mobile Case 2 / Case 22 title */
.case2-heading-phone {
  font-family: “Pixelify Sans”;
  font-weight: 700;
  font-size: 35px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
}
/* Mobile Case 2 / Case 22 body */
.case2-body-phone {
  font-family: “Raleway”;
  font-weight: 700;
  font-size: 15px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
  text-align: center;
}
/* Mobile dot-chain */
.dot-phone {
  font-family: “Potta One”;
  font-weight: 400;
  font-size: 40px;
  line-height: 1.2em;
  letter-spacing: 0em;
  color: rgb(0, 0, 0);
}
1.3 Border Radius
--radius-nav: 100px;
--radius-glass: 0px; /* glass bar clips rectangle but has masked fade */
--radius-pill: 40px;
--radius-circle: 200px;
--radius-case-card-desktop: 100px;
--radius-case-card-phone: 56px;
--radius-right-round: 0px 100px 100px 0px;
1.4 Shadows
--glass-shadow:
  0px 24px 70px 0px rgba(0, 0, 0, 0.24);
--rotator-shadow:
  0px 0.6021873017743928px 0.6021873017743928px -1.25px rgba(29, 5, 242, 0.68),
  0px 2.288533303243457px 2.288533303243457px -2.5px rgba(29, 5, 242, 0.6),
  0px 10px 10px -3.75px rgba(29, 5, 242, 0.24);
--case-card-shadow:
  0px 3px 50px 27px rgba(0, 0, 0, 0.14);
1.5 Blur / Glass
Glass top bar:

background: rgba(255, 255, 255, 0.16);
border: 1px solid rgba(255, 255, 255, 0.32);
backdrop-filter: blur(17px);
box-shadow: 0px 24px 70px 0px rgba(0, 0, 0, 0.24);
overflow: hidden;
Bottom fade mask for glass:

mask-image: linear-gradient(
  180deg,
  rgb(0, 0, 0) 0%,
  rgb(0, 0, 0) 62%,
  rgba(0, 0, 0, 0.55) 82%,
  rgba(0, 0, 0, 0) 100%
);
mask-mode: alpha;
mask-size: cover;
mask-repeat: no-repeat;
mask-position: center;
Blur divider element:

filter: blur(41px);
opacity: 0.82;
background: linear-gradient(180deg, rgba(8, 7, 7, 0.99) 0%, rgb(5, 5, 5) 100%);
2. LAYOUT & RESPONSIVE RULES
2.1 Global
html, body {
  margin: 0;
  background: #080808;
  overflow-x: hidden;
}
body {
  min-height: 100vh;
}
Use a stage wrapper:

<main className="relative mx-auto overflow-hidden bg-[#080808]">
2.2 Breakpoints
Required implementation breakpoints:

Desktop: min-width: 1289px
Tablet: 768px
Mobile: 375px
Mapping:

Desktop source frame = 1289px × 8292px
Phone source frame = 409px × 7602px
For desktop at 1440:

.desktop-stage {
  width: 1289px;
  min-height: 8292px;
  margin: 0 auto;
  position: relative;
  background: rgb(8, 8, 8);
  overflow: hidden;
}
For mobile:

.phone-stage {
  width: 409px;
  min-height: 7602px;
  margin: 0 auto;
  position: relative;
  background: rgb(8, 8, 8);
  overflow: hidden;
}
For 375px:

@media (max-width: 408px) {
  .phone-stage {
    transform-origin: top center;
    transform: scale(0.91687);
    width: 409px;
  }
}
Do not allow horizontal scroll.

3. PAGE-BY-PAGE COMPONENT BREAKDOWN
The site is one page: /.

It consists of:

Case 1 hero / scroll interaction
Case 1 content sections
Case 2 phone/desktop case-study section
Case 22 phone continuation section
Footer credit
DESKTOP LAYOUT — 1289px reference
Section A — Case 1 Hero
Frame
Position: absolute
x: 0px
y: 0px
Width: 1289px
Height: 1051px
Background image: hZ3I67zF0Ywq6IQBQW2Hqj8xA.jpg
Object fit: cover
Overlay:
Same size: 1289px × 1051px
background: rgb(5, 5, 5)
opacity: 0.82
Top glass/nav bar
Position: absolute
x: 0px
y: 0px
Width: 1289px
Height: 121px
Background: rgba(255,255,255,0.16)
Border: 1px solid rgba(255,255,255,0.32)
Backdrop blur: 17px
Shadow: 0px 24px 70px rgba(0,0,0,0.24)
Apply bottom mask fade.
Inner nav pill
Position: absolute
x: 21px
y: 9px
Width: 1249px
Height: 87px
Radius: 100px
Background: rgb(5,5,5)
Overflow: hidden
Logo:

Position: absolute
x: 31px
y: 14px
Width: 60px
Height: 60px
Image: j8AKnXpDQAMkErvkKGPQskZ8A8M.png
Object fit: cover
Profile text:

Content: Senzwelwe's Profile
Position: absolute
x: 945px
y: 27px
Width: 270px
Height: 31px
Font: Raleway 800, 28px, line-height 1.2
Color: rgb(250,250,250)
Case 1 title
Text: Case Study

Position: absolute
x: 66px
y: 137px
Width: 562px
Height: 109px
Font: Pixelify Sans 400, 80px
Color: rgb(252,250,250)
Case number:

Text: 01
Position: absolute
x: 50px
y: 137px
Width: 297px
Height: 281px
Font: Pixelify Sans 400, 300px
Color: rgb(252,250,250)
Intro paragraph:

Text: Hopefully this is good text combination, questrial and raleway.
Position: absolute
x: 20px
y: 417.5px
Width: 450px
Height: 217px
Font: Raleway 400, 28px
Color: rgb(252,250,250)
Rotator frame
Outer frame:

Name: rotator frame
Position: absolute
x: 798px
y: 404px
Width: 491px
Height: 532px
Background image: jksu9TETRaeLsXhVTN8uVEQXeM.png
Object fit: cover
Overflow: hidden
z-index: 1
Has bounded fade-out interaction, described under animations.
Rotating circular asset:

Position inside rotator:
x: 127px
y: 118px
Width: 252px
Height: 247px
Radius: 200px
Image: fgpKeynPOfr6H6JUkPx1Gh3ixA.png
Shadow: --rotator-shadow
Overflow: hidden
Has bounded quarter-turn scroll interaction.
Lower indicator asset:

Position inside rotator:
x: 167px
y: 439px
Width: 180px
Height: 31px
Image: KBmvRI5RODFKyCvTixYfvSPXV9Q.png
Rotator label stack
There are repeated Litwin's Model of Change labels around the center-left:

Label 1:
x: 302px
y: 525.5px
Width: 471px
Height: 23px
Font: DM Retrograde 400, 28px
Label 2:
x: 302px
y: 555.5px
same style
Active pill text:
x: 320px
y: 600px
Width: 419px
Font: DM Retrograde 400, 25px
Label 4:
x: 302px
y: 647px
same style
Label 5:
x: 302px
y: 678px
same style
Dark background strips:

Strip A:
x: 297px
y: 503px
Width: 476px
Height: 76px
Fill: rgb(5,5,5)
Opacity: 0.82
Strip B:
x: 302px
y: 644px
Width: 476px
Height: 91px
Fill: rgb(5,5,5)
Opacity: 0.82
Active outline pill:

Transparent rectangle
x: 299px
y: 585px
Width: 461px
Height: 50px
Radius: 40px
Border/outline white in visual; match screenshot.
Section B — Case 1 Body / Change Model Content
This section begins below hero after a black/blur transition.

Blur transition:

x: 0
y: 1029px
Width: 1289px
Height: 104px
Background: linear-gradient(180deg, rgba(8,7,7,0.99) 0%, rgb(5,5,5) 100%)
Blur: 41px
Opacity: 0.82
Notable desktop content:

Large circular outline:
Approx. x: 39px
y: 1163px
Diameter: around 750px
Border: 1px solid rgba(255,255,255,0.2)
Transparent fill
Heading 01
Around x: 504px
y: 1163px
Font: Pixelify Sans 400, 80px
Color: white
Main model label:
Text: Change Model
Position around x: 689px
y: 1926px
Font: Pixelify Sans 400, 80px
Color: white
Body paragraph:
Text: Hopefully this is good text combination, questrial and raleway. Then this is where the rest of the text would go, explaining the chosen model, why it was chose n and what results would be expected from it's application.
Font: Raleway 400, 28px
Color: white
Pixel invader icon cluster:
Multiple repeated image assets W6aZ5CQqg56D95eapz7ZP6MH6k.png
Most are 77px × 77px
Arranged roughly around x: 39px–489px, y: 1973px–2255px
Rocket image:
Image: 5BnXxqERWMEtMn113ma4bDQddk.png
Approx 99px × 102px
Holo shader section:
Shader: holo
Desktop rect approx 973px × 646px
Controls:
seed: 600
speed: 0.5
scale: 1
turbAmp: 1
turbIter: 3
warp: 5
fringeFreq: 0.3
iter: 0
bandSpread: 1.2
ambient: 0.07
saturation: 2.55
exposure: 9
Section C — Case 2 Desktop
Case 2 desktop frame:

Name: Case 2 Desktop
Position: inside desktop stage after Case 1
Starts at y: 4146px
Width: 1289px
Height: 4146px
Background: rgb(0,0,0)
Overflow: visible
Primary white content card:

Position:
x: 38px
y: 33px relative to Case 2 frame
Width: 1214px
Height: 3974px
Background: white
Radius: 100px
Shadow: 0px 3px 50px 27px rgba(0,0,0,0.14)
Overflow: hidden
Top heading:

Text: Case Study 02
Position:
x: 309px
y: 105px
Width: 596px
Height: 109px
Font: Pixelify Sans 700, 80px
Color: black
Top body paragraph:

Position:
x: 106px
y: 214px
Width: 789px
Height: 217px
Font: Raleway 700, 35px
Text-align: center
Right/upper robot image:

Image: pMpebbcVJd9F6l0sPn4HxUn2r0.png
Position:
x: 645px
y: 29px
Width: 885px
Height: 817px
Object fit: cover
Overflows right edge intentionally
Large outline frame:

Position:
x: 16px
y: 193px
Width: 789px
Height: 442px
Border: 1px solid rgb(0,0,0)
Radius: 0px 100px 100px 0px
Fill: transparent
Second heading:

Text: Case Study 02
Position:
x: 607px
y: 758px
Width: 596px
Height: 109px
Font: Pixelify Sans 700, 80px
Second paragraph:

Position:
x: 501px
y: 859px
Width: 685px
Height: 217px
Font: Raleway 700, 35px
Text-align: center
Vertical dotted connector:

Dot glyphs: .
Font: Potta One 400, 100px
Color: black
Example dot positions:
x: 53px, y: 758px
x: 53px, y: 816px
x: 53px, y: 874px
Continue vertically down the left edge.
Pixel icons:

Use pTL5bTcgue3KK8RwkKZoG6xlb7w.png
One large rotated icon:
x: 0px
y: 677px
Width: 139px
Height: 137px
Rotation: 89deg
PHONE LAYOUT — 409px reference
Phone Stage
Width: 409px
Height: 7602px
Background: rgb(8,8,8)
Layout source is stacked, but final implementation can be absolute within a relative 409px stage.
No horizontal overflow.
Phone Section A — Case 1 Hero
Hero image:

Position:
x: -9px
y: 0px
Width: 428px
Height: 1051px
Image: hZ3I67zF0Ywq6IQBQW2Hqj8xA.jpg
Object fit: cover
Dark overlay:

Position:
x: 0
y: 0
Width: 409px
Height: 1195px
Background: rgb(5,5,5)
Opacity: 0.82
Glass/nav:

Position:
x: 0
y: 0
Width: 409px
Height: 121px
Fill: rgba(255,255,255,0.16)
Border: 1px solid rgba(255,255,255,0.32)
Backdrop blur: 17px
Apply same bottom mask fade.
Nav black pill:

Position:
x: 8px
y: 14px
Width: roughly 393px
Height: 55px
Radius: 100px
Background: rgb(5,5,5)
Logo:

Position:
x: 20px
y: 19px
Size: approx 42px × 42px
Image: j8AKnXpDQAMkErvkKGPQskZ8A8M.png
Profile text:

Content: Senzwelwe's Profile
Position:
x: 209px
y: 37px
Font: Raleway 800, 15px
Color: white
Hero title:

Text: Case on first line, Study on second
Position:
x: 6px
y: 122px
Font: Pixelify Sans 400, 40px
Color: white
Hero number:

Text: 01
Position:
x: 6px
y: 200px
Font: Pixelify Sans 400, 60px
Color: white
Intro paragraph:

Text: Hopefully this is good text combination, questrial and raleway.
Position:
x: 6px
y: 281px
Width: about 360px
Font: Raleway 400, 28px
Color: white
Rotating black circle:

Position:
x: 225px
y: 383px
Width: 180px
Height: 180px
Radius: 200px
Image: fgpKeynPOfr6H6JUkPx1Gh3ixA.png
Shadow: --rotator-shadow
Has bounded rotation interaction.
Displayer pill:

Position:
x: 6px
y: 591px
Width: approx 211px
Height: 14px
Border: white
Radius: 40px
Transparent fill
Text is not visible on phone at this state; preserve as outline.
End of hero:

y: 1051px
Next black transition begins immediately after.
Phone transition into Case 2
Black divider region:

Starts around y: 1051px
Height: about 173px
Background: black
Contains two diagonal white divider lines around:
x: 176px
y: 1202px
Each line 57px × 1px
Rotation: -50deg
Phone Section B — Case 2 Phone
Case 2 Phone frame:

Position:
x: 0px
y: 1224px
Width: 409px
Height: 6378px
Background: rgb(0,0,0)
Overflow: visible
z-index: 1
White Case 2 content card:

Position:
x: 12px
y: 105px relative to Case 2 phone frame
Width: 386px
Height: approximately 3161px for first phone card content before Case 22
Background: white
Radius: 56px
Overflow: visible
Case 2 content begins at card top:

Top rounded white card visible.
Title: Case Study 02
Position:
x: 64.5px
y: 58px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
Color: black
Top body paragraph:

Position:
x: 21px–35px depending line width
y: 113px
Width: approx 343px
Font: Raleway 700, 15px
Text-align: center
Content: Hopefully this is good text combination, questrial and raleway. Then this is where the rest of the text would go, explaining the chosen model, why it was chose n and what results would be expected from it's application.
Decorative right-angle yellow block:

Yellow block cluster appears at upper-right.
Use pixel/tetris-style CSS blocks or image-equivalent.
Primary color: yellow #FFD900 approximation from screenshot.
Green center block: bright green #3DFF00 approximation.
Match visual block size around 15px–18px.
Round outline:

Position:
x: 156px
y: 177px
Width: 198px
Height: 198px
Border: 1px solid black
Radius: 100px
Transparent fill
First outline panel:

Position:
x: -12px
y: 82px
Width: 258px
Height: 145px
Border: 1px solid black
Radius: 0px 100px 100px 0px
Transparent fill
Second heading:

Text: Case Study 02
Position:
x: 142px
y: 276px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
Second paragraph:

Position:
x: 33px–66px
y: 326px
Width: 343px
Font: Raleway 700, 15px
Text-align: center
Further headings:

Heading 3:
x: 14px
y: 468px
Heading 4:
x: 64.5px
y: 707px
Heading 5:
x: 37px
y: 937px
Heading 6:
x: 64.5px
y: 1139px
All:
Text: Case Study 02
Font: Pixelify Sans 700, 35px
Color: black
Mobile dot-chain:

Dots are text glyphs .
Font: Potta One 400, 40px
Color: black
Width: 4px
Height: 46px
Repeated vertically starting:
x: 31px
y: 860px
Then every 18px:
y: 878, 896, 914, 932, 950, 968, etc.
Continue until about y: 1400px+.
Mobile black icon bubbles:

Use asset 4tQkB7REwzpoTKtjNaJUQGLU.png
Size: 48px × 54px
Rotation: 90deg
Repeated vertically on left:
x: 13px
around y: 1083px, 1191px, 1299px, etc.
Large icon:

Use pTL5bTcgue3KK8RwkKZoG6xlb7w.png
Position:
x: 9px
y: 832px
Width: 58px
Height: 55px
Rotation: 89deg
Robot image:

Image: pMpebbcVJd9F6l0sPn4HxUn2r0.png
Position:
x: 127px
y: 1579px
Width: 394px
Height: 340px
Overflows right intentionally
Footer text inside Case 2:

Position:
x: 57px
y: 6323px
Width: 296px
Height: 32px
Font: Raleway 400, 12px
Color: rgb(252,250,250)
Text-align: center
Content: Produced by Senzelwe... @2026
Match current canvas text exactly if available.
Phone Section C — Case 22 Phone
Case 22 Phone frame:

Name: Case 22 Phone
Position:
Starts after Case 2 content.
It must begin at the bottom edge of Case 2 Phone content, not overlap.
Current separated placement:
inside Case 2 Phone frame, top offset around 3217px
White card size:
Width: 386px
Height: 4107px
Background: white
Radius: 56px
z-index: 2
Overflow: visible
Important rule:

Case 22 must start only after Case 2 phone content ends.
Do not allow it to overlay the first Case 2 white card.
If implementing in normal React, use vertical document flow:
<section className="case2-phone">…</section>
<section className="case22-phone">…</section>
instead of absolute overlap.
Case 22 internal content uses the same visual language:

White rounded card
Black text
Pixelify Sans 700 headings at 35px
Raleway 700 body at 15px
Potta One dot chains at 40px
Black outlined circular/right-rounded panels
Pixel icons on left rail
Case 22 top elements:

Heading:
Text: Case Study 02
Font: Pixelify Sans 700, 35px
Color: black
Body:
Font: Raleway 700, 15px
Color: black
Center aligned
Decorative transparent border:
0px 100px 100px 0px right-rounded rectangle
Border: 1px solid black
Circular outline:
Border: 1px solid black
Radius: 100px
4. INTERACTIONS / ANIMATIONS
Recreate these exact scroll behaviors.

4.1 Shared bounded station logic
const BOUNDED_START_PX = 0;
const BOUNDED_END_PX = 1500;
const DEFAULT_STEP_SIZE = 90;
const DEFAULT_TRANSITION_MS = 350;
function getBoundedStationState() {
  if (typeof window === “undefined”) {
    return {
      scrollTop: 0,
      progress: 0,
      stationIndex: 0,
      rotation: 0,
      isHidden: false,
    };
  }
  const scrollTop = window.scrollY || window.pageYOffset || 0;
  const progress = Math.min(
    1,
    Math.max(0, (scrollTop - BOUNDED_START_PX) / (BOUNDED_END_PX - BOUNDED_START_PX))
  );
  const stationIndex = Math.min(4, Math.max(0, Math.round(progress * 4)));
  const rotation = stationIndex * DEFAULT_STEP_SIZE;
  const isHidden = stationIndex >= 4;
  return { scrollTop, progress, stationIndex, rotation, isHidden };
}
4.2 Rotating circle
Behavior:

Applies to circular rotator asset.
Rotation stations:
station 0: 0deg
station 1: 90deg
station 2: 180deg
station 3: 270deg
station 4: 360deg
Clockwise rotation.
Transition:
transition: transform 350ms ease;
Preserve existing transform and append rotate.
Opacity:
Stations 0–3: opacity: 1
Station 4: opacity: 0
Pointer events:
Station 4: disabled
Framer Motion implementation:

const { stationIndex, rotation, isHidden } = useBoundedStation();
<motion.div
  style={{
    rotate: rotation,
    opacity: isHidden ? 0 : 1,
    pointerEvents: isHidden ? "none" : "auto",
    transition: "transform 350ms ease",
    willChange: "transform, opacity",
  }}
/>
4.3 Rotator frame fade
Applies to outer rotator frame:

Does not rotate.
Fades out when stationIndex >= 4.
Transition:
transition: opacity 350ms ease;
Pointer events disabled when hidden.
4.4 Displayer frame fade
Applies to the displayer frame:

Does not change layout.
Fades out when stationIndex >= 4.
Transition:
transition: opacity 350ms ease;
4.5 Displayer station text
Text labels:

const stationLabels = [
  “Litwin’s Model of Change”,
  “Burke-Litwin Model of Organization”,
  “blaah blaah blaah”,
  “Last station”,
  “Last station”,
];
Change text based on stationIndex. Do not change font styling when text changes.

5. ASSETS LIST
Use these exact assets.

Backgrounds
hZ3I67zF0Ywq6IQBQW2Hqj8xA.jpg
Case 1 desktop and phone hero background
Desktop: 1289px × 1051px
Phone: 428px × 1051px
Navigation / identity
j8AKnXpDQAMkErvkKGPQskZ8A8M.png
Circular profile/logo image
Desktop: 60px × 60px
Phone: approx 42px × 42px
Rotator
jksu9TETRaeLsXhVTN8uVEQXeM.png

Rotator frame background
Desktop: 491px × 532px
fgpKeynPOfr6H6JUkPx1Gh3ixA.png

Circular rotating object
Desktop: 252px × 247px
Phone: 180px × 180px
KBmvRI5RODFKyCvTixYfvSPXV9Q.png

Small lower indicator inside rotator
Desktop: 180px × 31px
Case 1 / pixel decorative assets
W6aZ5CQqg56D95eapz7ZP6MH6k.png

Pixel invader repeated icon
Desktop commonly 77px × 77px
Also repeated smaller in phone
5BnXxqERWMEtMn113ma4bDQddk.png

Rocket / pixel ship icon
Desktop approx 99px × 102px
t9OJ7grmCbISaz4GuS1Qvb8QBLU.png

Gear / decorative image
Used multiple times
pTL5bTcgue3KK8RwkKZoG6xlb7w.png

Black icon / left rail marker
Desktop: 139px × 137px, rotation 89deg
Phone: 58px × 55px, rotation 89deg
4tQkB7REwzpoTKtjNaJUQGLU.png

Repeating black label/bubble icon
Phone: 48px × 54px, rotation 90deg
Case 2 robot
pMpebbcVJd9F6l0sPn4HxUn2r0.png
Robot image
Desktop: 885px × 817px
Phone: 394px × 340px
Object-fit: cover
Can overflow its parent horizontally
Other decorative images
q9WuzQtpTm0rnl5RNb9tkTZW20.png
Small repeated image used in phone fixed decorations
Size: 42px × 42px
YpUmYiREbJz8eXDwuHqcwmSy9Jo.png
Small decorative image
Phone: approx 63px × 59px, rotation -89deg
YRxnzbPbGadT03A5K74jOxpIZyI.png
Small decorative image
Phone: approx 61px × 55px, rotation -89deg
lAXhzwXQZLmv6cAeUdSF3Q4r8Y.png
Small decorative image
Phone: approx 62px × 53px, rotation -90deg
T53scY53sRNafFvibnjw3kwV4U.png
Present in project, decorative use
6. IMPLEMENTATION STRUCTURE
Use this component hierarchy:

<App>
  <HomePage>
    <DesktopStage>
      <Case1HeroDesktop />
      <Case1ContentDesktop />
      <Case2Desktop />
    </DesktopStage>
    <PhoneStage>
      <Case1HeroPhone />
      <PhoneDivider />
      <Case2Phone />
      <Case22Phone />
    </PhoneStage>
  </HomePage>
</App>
Visibility:

.desktop-stage {
  display: block;
}
.phone-stage {
  display: none;
}
@media (max-width: 1288.98px) {
  .desktop-stage {
    display: none;
  }
  .phone-stage {
    display: block;
  }
}
7. CRITICAL RESPONSIVE RULES
Desktop
Use exact 1289px source width.
Center inside 1440px viewport.
Do not stretch to 1440; background outside stage remains #080808.
All desktop elements are absolutely positioned unless otherwise stated.
Tablet
Use phone composition centered.
Scale only if viewport is narrower than 409px.
At 768px, show phone stage at 409px width centered, unless you choose to scale to improve presence; do not alter internal proportions.
Mobile 375
Use 409px phone stage scaled to 375px:
Scale: 0.91687
Ensure no horizontal scroll.
Preserve all absolute measurements relative to 409px source.
8. QA CHECKLIST
The other agent must verify:

Desktop at 1440px: 1289px stage centered.
Mobile at 375px: no horizontal scroll.
Tablet at 768px: phone layout centered and not clipped.
Case 1 hero image matches crop and darkness.
Glass nav bar uses correct translucency, border, blur, and bottom fade.
Rotator circle rotates through 0 / 90 / 180 / 270 / 360 over first 1500px scroll.
Rotator frame and displayer fade out at final station.
Displayer text changes exactly:
Litwin’s Model of Change
Burke-Litwin Model of Organization
blaah blaah blaah
Last station
Case 2 appears after Case 1, not detached.
Case 22 phone starts after Case 2 phone content and does not overlap it.
All white cards keep rounded corners:
Desktop: 100px
Phone: 56px
All text uses exact fonts and sizes.
Pixel icons are not replaced by generic icons.
All images retain object-fit cover/contain behavior as specified.
No visible content is clipped unless clipping is explicitly part of a rounded card or hero crop.
Match current screenshot within 2px.
9. FINAL NOTES FOR THE CODING AGENT
Use TailwindCSS utilities for layout, but use inline styles or CSS modules for exact pixel positioning.
Use Framer Motion only for scroll-state-driven opacity/rotation; CSS transitions are sufficient and should match the original.
The design is intentionally pixel-art / monochrome / high-contrast.
Do not modernize spacing.
Do not replace placeholder copy.
Preserve typos exactly, including:
Senzwelwe's Profile
chose n
it's
Preserve text casing exactly.
Preserve the intentionally long black negative space between sections on phone.
If an element visually overflows, keep the overflow unless it causes horizontal document scroll.

# ADDENDUM — STRICT TOP-TO-BOTTOM BUILD ORDER
Use this as an ordering supplement to the main build spec. Do not replace the original spec. This section exists to ensure the rebuild agent constructs the page in the exact visual sequence from header to footer and does not skip hidden, overlapping, decorative, or transitional layers.
---
## GLOBAL BUILD ORDER PRINCIPLE
Build each breakpoint as a layered vertical document in this order:
1. Page/stage background
2. Hero background image
3. Hero dark overlay
4. Header glass layer
5. Header inner black pill
6. Header logo
7. Header profile text
8. Hero title and number
9. Hero intro paragraph
10. Rotator/displayer system
11. Hero progress/label elements
12. Transition divider into Case 2
13. Case 2 black section background
14. Case 2 white card
15. Case 2 outline decorations
16. Case 2 headings and body copy
17. Case 2 pixel/robot/decorative assets
18. Case 22 white continuation card
19. Case 22 outline decorations
20. Case 22 headings/body/dot-chain/icons
21. Footer production credit
Nothing should be built “later if needed.” Build every visible and intentional invisible/hidden transition element in order.
---
# STRICT DESKTOP ORDER
Desktop source frame:
- Stage width: `1289px`
- Stage height: `8292px`
- Background: `rgb(8, 8, 8)`
- Positioning model: absolute layers inside one relative desktop stage.
---
## DESKTOP ORDER 01 — Page Stage
Create the desktop stage first.
- Element: `main.desktop-stage`
- Position: relative
- Width: `1289px`
- Min-height: `8292px`
- Margin: `0 auto`
- Background: `rgb(8, 8, 8)`
- Overflow: hidden
This stage is the containing coordinate system for every desktop element.
---
## DESKTOP ORDER 02 — Case 1 Hero Background
Add the hero background immediately inside the stage.
- Element: hero image frame
- Position: absolute
- Left: `0px`
- Top: `0px`
- Width: `1289px`
- Height: `1051px`
- Image: `hZ3I67zF0Ywq6IQBQW2Hqj8xA.jpg`
- Object-fit: cover
- Overflow: hidden
This must be behind all hero content.
---
## DESKTOP ORDER 03 — Hero Dark Overlay
Place dark overlay directly above the hero image.
- Position: absolute
- Left: `0px`
- Top: `0px`
- Width: `1289px`
- Height: `1051px`
- Background: `rgb(5, 5, 5)`
- Opacity: `0.82`
This creates the dim monochrome look.
---
## DESKTOP ORDER 04 — Header Glass Bar
Place the glass bar over the hero.
- Position: absolute
- Left: `0px`
- Top: `0px`
- Width: `1289px`
- Height: `121px`
- Background: `rgba(255, 255, 255, 0.16)`
- Border: `1px solid rgba(255, 255, 255, 0.32)`
- Backdrop blur: `17px`
- Shadow: `0px 24px 70px 0px rgba(0, 0, 0, 0.24)`
- Overflow: hidden
- Mask:
  ```css
  mask-image: linear-gradient(
    180deg,
    rgb(0, 0, 0) 0%,
    rgb(0, 0, 0) 62%,
    rgba(0, 0, 0, 0.55) 82%,
    rgba(0, 0, 0, 0) 100%
  );
This bar must sit above the overlay and below the black nav pill.

DESKTOP ORDER 05 — Header Inner Black Pill
Inside/over the glass bar, add the rounded black pill.

Position: absolute
Left: 21px
Top: 9px
Width: 1249px
Height: 87px
Background: rgb(5, 5, 5)
Radius: 100px
Overflow: hidden
DESKTOP ORDER 06 — Header Logo
Place logo inside the black pill.

Position: absolute
Left: 31px
Top: 14px
Width: 60px
Height: 60px
Image: j8AKnXpDQAMkErvkKGPQskZ8A8M.png
Object-fit: cover
DESKTOP ORDER 07 — Header Profile Text
Place profile text on the right side of the pill.

Content: Senzwelwe's Profile
Position: absolute
Left: 945px
Top: 27px
Width: 270px
Height: 31px
Font: Raleway
Weight: 800
Size: 28px
Line-height: 1.2em
Color: rgb(250, 250, 250)
DESKTOP ORDER 08 — Hero Case Label
Add the Case Study text.

Content: Case Study
Position: absolute
Left: 66px
Top: 137px
Width: 562px
Height: 109px
Font: Pixelify Sans
Weight: 400
Size: 80px
Line-height: 1.2em
Color: rgb(252, 250, 250)
DESKTOP ORDER 09 — Hero Case Number
Add the giant case number.

Content: 01
Position: absolute
Left: 50px
Top: 137px
Width: 297px
Height: 281px
Font: Pixelify Sans
Weight: 400
Size: 300px
Line-height: 1.2em
Color: rgb(252, 250, 250)
This overlaps spatially with the case label by design.

DESKTOP ORDER 10 — Hero Intro Paragraph
Add the white paragraph under the number/title area.

Content: Hopefully this is good text combination, questrial and raleway.
Position: absolute
Left: 20px
Top: 417.5px
Width: 450px
Height: 217px
Font: Raleway
Weight: 400
Size: 28px
Line-height: 1.2em
Color: rgb(252, 250, 250)
DESKTOP ORDER 11 — Rotator Label Background Strip A
Add first dark label backing.

Position: absolute
Left: 297px
Top: 503px
Width: 476px
Height: 76px
Background: rgb(5, 5, 5)
Opacity: 0.82
Overflow: hidden
DESKTOP ORDER 12 — Rotator Label Text Rows 1–2
Add the first two station labels above/inside Strip A.

Label row 1:

Content: Litwin's Model of Change
Left: 301.5px
Top: 525.5px
Width: 471px
Height: 23px
Font: DM Retrograde
Weight: 400
Size: 28px
Color: rgb(252, 250, 250)
Label row 2:

Content: Litwin's Model of Change
Left: 301.5px
Top: 555.5px
Width: 471px
Height: 23px
Same font styling
DESKTOP ORDER 13 — Active Rotator Outline Pill
Add transparent outline pill.

Position: absolute
Left: 299px
Top: 585px
Width: 461px
Height: 50px
Radius: 40px
Fill: transparent
Border: white/light outline
Must sit above the dark strips and behind active label text
DESKTOP ORDER 14 — Active Rotator Label
Add active label inside the outline pill.

Content: Litwin's Model of Change
Position: absolute
Left: 320px
Top: 600px
Width: 419px
Height: 23px
Font: DM Retrograde
Weight: 400
Size: 25px
Line-height: 1.2em
Color: rgb(252, 250, 250)
This text should later be replaced by scroll station text when interaction runs.

DESKTOP ORDER 15 — Rotator Label Background Strip B
Add lower dark label backing.

Position: absolute
Left: 302px
Top: 644px
Width: 476px
Height: 91px
Background: rgb(5, 5, 5)
Opacity: 0.82
Overflow: hidden
DESKTOP ORDER 16 — Rotator Label Text Rows 4–5
Label row 4:

Content: Litwin's Model of Change
Left: 302px
Top: 647px
Width: 471px
Height: 23px
Font: DM Retrograde
Weight: 400
Size: 28px
Color: rgb(252, 250, 250)
Label row 5:

Content: Litwin's Model of Change
Left: 302px
Top: 678px
Width: 471px
Height: 23px
Same styling
DESKTOP ORDER 17 — Rotator Frame
Add the rotator frame on the right.

Position: absolute
Left: 798px
Top: 404px
Width: 491px
Height: 532px
Image: jksu9TETRaeLsXhVTN8uVEQXeM.png
Overflow: hidden
z-index: 1
Apply BoundedScrollStationDisplayer behavior:
opacity 1 until station 4
opacity 0 at station 4
transition: opacity 350ms ease
DESKTOP ORDER 18 — Rotating Circle Inside Rotator
Inside rotator frame:

Position: absolute relative to rotator
Left: 127px
Top: 118px
Width: 252px
Height: 247px
Radius: 200px
Image: fgpKeynPOfr6H6JUkPx1Gh3ixA.png
Shadow:
0px 0.6021873017743928px 0.6021873017743928px -1.25px rgba(29, 5, 242, 0.68),
0px 2.288533303243457px 2.288533303243457px -2.5px rgba(29, 5, 242, 0.6),
0px 10px 10px -3.75px rgba(29, 5, 242, 0.24)
Apply BoundedScrollQuarterTurnRotation:
0px scroll: 0deg
approx 375px scroll: 90deg
approx 750px scroll: 180deg
approx 1125px scroll: 270deg
1500px scroll: 360deg + fade out
DESKTOP ORDER 19 — Rotator Bottom Indicator
Inside rotator frame:

Position: absolute
Left: 167px
Top: 439px
Width: 180px
Height: 31px
Image: KBmvRI5RODFKyCvTixYfvSPXV9Q.png
DESKTOP ORDER 20 — Hero-to-Content Blur Divider
Add divider under hero.

Position: absolute
Left: 0px
Top: approximately 1029px
Width: 1289px
Height: 104px
Background:
linear-gradient(180deg, rgba(8, 7, 7, 0.99) 0%, rgb(5, 5, 5) 100%)
Blur: 41px
Opacity: 0.82
DESKTOP ORDER 21 — Case 1 Intermediate Content
Build all intermediate Case 1 sections after the divider and before Case 2.

The visual order must be:

Black background continuation
Thin diagonal line decorations
Large circular/oval outline elements
White pixel headings
White paragraphs
Pixel invader clusters
Rocket/ship decorative images
Holo shader area
Any hidden decorative assets that are part of the responsive inherited layout
Maintain the source styling:

Headings: Pixelify Sans, white
Paragraphs: Raleway, white
Pixel icons: use original image assets
Background remains rgb(8, 8, 8) / rgb(5, 5, 5) as appropriate
Do not move Case 2 upward. This intermediate section provides the long black narrative scroll.

DESKTOP ORDER 22 — Case 2 Desktop Section Background
Add Case 2 Desktop section.

Position: absolute / normal block after Case 1
Top: approximately 4146px
Width: 1289px
Height: 4146px
Background: rgb(0, 0, 0)
DESKTOP ORDER 23 — Case 2 Desktop White Card
Inside Case 2 Desktop:

Position: absolute
Left: 38px
Top: 33px
Width: 1214px
Height: 3974px
Background: white
Radius: 100px
Shadow:
0px 3px 50px 27px rgba(0, 0, 0, 0.14)
Overflow: hidden
DESKTOP ORDER 24 — Case 2 Top Heading
Inside white card:

Text: Case Study 02
Left: 309px
Top: 105px
Width: 596px
Height: 109px
Font: Pixelify Sans 700, 80px
Color: black
DESKTOP ORDER 25 — Case 2 Top Body Text
Text: Hopefully this is good text combination, questrial and raleway. Then this is where the rest of the text would go, explaining the chosen model, why it was chose n and what results would be expected from it's application.
Left: 106px
Top: 214px
Width: 789px
Height: 217px
Font: Raleway 700, 35px
Text-align: center
Color: black
DESKTOP ORDER 26 — Case 2 Top Outline Shape
Left: 16px
Top: 193px
Width: 789px
Height: 442px
Border: 1px solid rgb(0, 0, 0)
Radius: 0px 100px 100px 0px
Fill: transparent
This can visually sit behind/around the top paragraph.

DESKTOP ORDER 27 — Case 2 Robot Image
Image: pMpebbcVJd9F6l0sPn4HxUn2r0.png
Left: 645px
Top: 29px
Width: 885px
Height: 817px
Object-fit: cover
Allow intentional right overflow
DESKTOP ORDER 28 — Case 2 Second Heading
Text: Case Study 02
Left: 607px
Top: 758px
Width: 596px
Height: 109px
Font: Pixelify Sans 700, 80px
Color: black
DESKTOP ORDER 29 — Case 2 Second Body Text
Same paragraph copy as above
Left: 501px
Top: 859px
Width: 685px
Height: 217px
Font: Raleway 700, 35px
Text-align: center
Color: black
DESKTOP ORDER 30 — Case 2 Left Rail Icons and Dots
Build the left rail after major text blocks:

Large rotated pixel icon:

Image: pTL5bTcgue3KK8RwkKZoG6xlb7w.png
Left: 0px
Top: 677px
Width: 139px
Height: 137px
Rotation: 89deg
Dotted vertical chain:

Dot character: .
Font: Potta One 400, 100px
Color: black
x: 53px
Start y: 758px
Repeat down at roughly 58px vertical intervals
Additional repeated pixel icons:

Use source asset positions from the design
Maintain left rail rhythm
Do not replace with vector icons
DESKTOP ORDER 31 — Case 2 Remaining Content
Continue the white card content downward in the same visual system:

Alternating headings
Centered Raleway body text
Circular/outline geometry
Dot rail on the left
Pixel icon clusters
Large blank white lower area
Keep final white card bottom rounded and visible.

STRICT PHONE ORDER
Phone source frame:

Width: 409px
Height: 7602px
Background: rgb(8, 8, 8)
PHONE ORDER 01 — Phone Stage
Create phone stage.

Width: 409px
Min-height: 7602px
Background: rgb(8, 8, 8)
Position: relative
Overflow-x: hidden
Overflow-y: visible/auto
PHONE ORDER 02 — Phone Hero Image
Position: absolute or first block
Left: -9px
Top: 0px
Width: 428px
Height: 1051px
Image: hZ3I67zF0Ywq6IQBQW2Hqj8xA.jpg
Object-fit: cover
Overflow: hidden
PHONE ORDER 03 — Phone Hero Dark Overlay
Left: 0px
Top: 0px
Width: 409px
Height: 1195px
Background: rgb(5, 5, 5)
Opacity: 0.82
PHONE ORDER 04 — Phone Glass Header
Left: 0px
Top: 0px
Width: 409px
Height: 121px
Background: rgba(255,255,255,0.16)
Border: 1px solid rgba(255,255,255,0.32)
Backdrop blur: 17px
Shadow: 0px 24px 70px rgba(0,0,0,0.24)
Apply same mask fade
PHONE ORDER 05 — Phone Header Black Pill
Left: approximately 8px
Top: 14px
Width: approximately 393px
Height: approximately 55px
Radius: 100px
Background: rgb(5, 5, 5)
PHONE ORDER 06 — Phone Header Logo
Left: approximately 20px
Top: approximately 19px
Width: approximately 42px
Height: approximately 42px
Image: j8AKnXpDQAMkErvkKGPQskZ8A8M.png
PHONE ORDER 07 — Phone Header Profile Text
Content: Senzwelwe's Profile
Left: approximately 209px
Top: approximately 37px
Font: Raleway 800, 15px
Color: white
PHONE ORDER 08 — Phone Hero Title
Content:
Case
Study
Left: 6px
Top: 122px
Font: Pixelify Sans 400, 40px
Color: rgb(252, 250, 250)
PHONE ORDER 09 — Phone Hero Number
Content: 01
Left: 6px
Top: 200px
Font: Pixelify Sans 400, 60px
Color: rgb(252, 250, 250)
PHONE ORDER 10 — Phone Hero Intro Copy
Text: Hopefully this is good text combination, questrial and raleway.
Left: 6px
Top: 281px
Width: about 360px
Font: Raleway 400, 28px
Color: rgb(252, 250, 250)
PHONE ORDER 11 — Phone Rotating Circle
Left: 225px
Top: 383px
Width: 180px
Height: 180px
Radius: 200px
Image: fgpKeynPOfr6H6JUkPx1Gh3ixA.png
Shadow: --rotator-shadow
Apply bounded rotation behavior
PHONE ORDER 12 — Phone Progress/Outline Pill
Left: approx 6px
Top: 591px
Width: approx 211px
Height: approx 14px
Radius: 40px
Transparent fill
White outline
PHONE ORDER 13 — Phone Hero End / Black Spacer
After the hero image ends at y: 1051px, maintain a black transition space.

Background: black
Height: from 1051px to about 1224px
PHONE ORDER 14 — Diagonal Divider Lines
Place two diagonal thin white/gray lines.

Line 1:

Left: 176px
Top: 1202px
Width: 57px
Height: 1px
Rotation: -50deg
Fill: #CCC
Line 2:

Left: 176px
Top: 1213px
Width: 57px
Height: 1px
Rotation: -50deg
Fill: #CCC
PHONE ORDER 15 — Case 2 Phone Background Frame
Top: 1224px
Left: 0px
Width: 409px
Height: 6378px
Background: rgb(0, 0, 0)
Overflow: visible
z-index: 1
This frame contains both Case 2 and Case 22 in the current design. In code, it is safer to make Case 2 and Case 22 two normal stacked sections.

PHONE ORDER 16 — Case 2 Phone White Card
Left: 12px
Top: 105px relative to Case 2 frame
Width: 386px
Height: approximately 3161px
Background: white
Radius: 56px
Overflow: visible
PHONE ORDER 17 — Case 2 Phone First Outline Shape
Left: -12px
Top: 82px
Width: 258px
Height: 145px
Border: 1px solid rgb(0,0,0)
Radius: 0px 100px 100px 0px
Fill: transparent
PHONE ORDER 18 — Case 2 Phone First Circle Outline
Left: 156px
Top: 177px
Width: 198px
Height: 198px
Border: 1px solid rgb(0,0,0)
Radius: 100px
Fill: transparent
PHONE ORDER 19 — Case 2 Phone First Heading
Text: Case Study 02
Left: 64.5px
Top: 58px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
Color: black
PHONE ORDER 20 — Case 2 Phone First Body
Text: Hopefully this is good text combination, questrial and raleway. Then this is where the rest of the text would go, explaining the chosen model, why it was chose n and what results would be expected from it's application.
Top: 113px
Width: approx 343px
Font: Raleway 700, 15px
Text-align: center
Color: black
PHONE ORDER 21 — Case 2 Phone Second Heading
Text: Case Study 02
Left: 142px
Top: 276px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
PHONE ORDER 22 — Case 2 Phone Second Body
Top: 326px
Width: approx 343px
Font: Raleway 700, 15px
Text-align: center
PHONE ORDER 23 — Case 2 Phone Third Heading
Text: Case Study 02
Left: 14px
Top: 468px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
PHONE ORDER 24 — Case 2 Phone Third Body
Below third heading
Font: Raleway 700, 15px
Text-align: center
Maintain paragraph copy exactly
PHONE ORDER 25 — Case 2 Phone Fourth Heading
Text: Case Study 02
Left: 64.5px
Top: 707px
Width: 255px
Height: 55px
Font: Pixelify Sans 700, 35px
PHONE ORDER 26 — Case 2 Phone Left Rail Icon Start
Image: pTL5bTcgue3KK8RwkKZoG6xlb7w.png
Left: 9px
Top: 832px
Width: 58px
Height: 55px
Rotation: 89deg
PHONE ORDER 27 — Case 2 Phone Dot Chain
Build a vertical chain of dot glyphs.

Character: .
Font: Potta One 400, 40px
Color: black
Width: 4px
Height: 46px
Left: 31px
Start top: 860px
Repeat every 18px
Explicit first dot positions:

top: 860px
top: 878px
top: 896px
top: 914px
top: 932px
top: 950px
top: 968px
top: 986px
top: 1004px
top: 1022px
top: 1040px
Continue until rail section ends
PHONE ORDER 28 — Case 2 Phone Mid Headings and Bodies
Continue the sequence:

Heading at top: 937px
Body below
Heading at top: 1139px
Body below
Additional repeated headings and bodies down the white card
All headings:

Font: Pixelify Sans 700, 35px
Color: black
All bodies:

Font: Raleway 700, 15px
Text-align: center
Color: black
PHONE ORDER 29 — Case 2 Phone Repeated Bubble Icons
Place repeated black bubble icons on the left rail.

Asset:

4tQkB7REwzpoTKtjNaJUQGLU.png
Typical size:

Width: 48px
Height: 54px
Rotation: 90deg
Typical x:

Left: 13px
Place them down the left dotted rail in the same rhythm as the screenshot. They visually alternate with the dotted rail.

PHONE ORDER 30 — Case 2 Phone Robot Image
Image: pMpebbcVJd9F6l0sPn4HxUn2r0.png
Left: 127px
Top: 1579px
Width: 394px
Height: 340px
Allow right overflow
Do not clip against the 409px page unless it creates horizontal scroll; use overflow-x: hidden on the document.
PHONE ORDER 31 — Case 2 Phone Lower White Blank Area
Maintain the large blank lower white area after the repeated case-study rows.

Do not collapse this space. The blank space is part of the visual rhythm.

PHONE ORDER 32 — Case 22 Phone Start
Case 22 Phone must begin only after Case 2 Phone ends.

Current intended order:

Case 1 Hero
↓
Black divider
↓
Case 2 Phone white card
↓
Case 22 Phone white card
↓
Footer credit
Do not place Case 22 on top of Case 2. Do not absolute-position Case 22 over the first card.

If using flow layout:

<section className="case2-phone-card" />
<section className="case22-phone-card" />
If using absolute layout:

Case 22 top must equal:
Case 2 card top + Case 2 card height
Use a small gap only if visually present; otherwise direct continuation.
PHONE ORDER 33 — Case 22 Phone Card
Width: 386px
Height: 4107px
Background: white
Radius: 56px
Overflow: visible
z-index: above black background, but not covering Case 2
PHONE ORDER 34 — Case 22 Top Outline Decorations
Repeat the same decoration logic:

Transparent right-rounded outline panel
Border: 1px solid black
Radius: 0px 100px 100px 0px
Circular outline
Border: 1px solid black
Radius: 100px
Pixel block/icon decorations
PHONE ORDER 35 — Case 22 Text Content
Build text blocks in the same alternating rhythm.

Headings:

Text: Case Study 02
Font: Pixelify Sans 700, 35px
Color: black
Body:

Text: Hopefully this is good text combination, questrial and raleway. Then this is where the rest of the text would go, explaining the chosen model, why it was chose n and what results would be expected from it's application.
Font: Raleway 700, 15px
Line-height: 1.2em
Text-align: center
Color: black
PHONE ORDER 36 — Case 22 Dot Chain and Icons
Repeat left rail:

Dot glyph .
Font: Potta One 400, 40px
Black
Repeated every ~18px vertically
Repeat icons:

Use 4tQkB7REwzpoTKtjNaJUQGLU.png
Width: 48px
Height: 54px
Rotation: 90deg
Do not skip the repeated rail. It is a major visual motif.

PHONE ORDER 37 — Footer Credit
Footer appears at bottom after the white card content.

Text-align: center
Font: Raleway 400, 12px
Color: rgb(252, 250, 250)
Width: approximately 296px
Content includes production credit and @2026
Ensure footer is not hidden behind the white card.
FINAL ORDER VALIDATION
Before handing off, verify this exact scroll order:

Desktop
Glass header over dark hero
Hero title/number/body
Rotator interaction
Long black Case 1 narrative area
Case 2 desktop black frame
Case 2 white rounded card
Case 2 content and decorations
Footer / end content
Phone
Glass header over dark hero
Hero title/number/body
Rotator/progress elements
Black spacer/divider
Case 2 phone black frame
Case 2 phone white rounded card
Case 2 phone content, dotted rail, icons, robot
Case 22 phone white rounded card
Case 22 phone content, dotted rail, icons
Footer credit

please ensure to defferentiate between mobile and desktop versions and do not merge them into one version but note responsiveness.