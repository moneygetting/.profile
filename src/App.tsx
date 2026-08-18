import { useState, useEffect, useRef } from 'react'
import { createPortal } from 'react-dom'
import { Check, Copy } from 'lucide-react'

const LOGO_URL =
  'https://res.cloudinary.com/gzou7y5z/image/upload/v1786812186/s.i_6.png'
const HERO_BG_URL =
  'https://res.cloudinary.com/gzou7y5z/image/upload/v1786812125/pexels-krivitskiy-8236998.jpg'
const ROBOT_URL =
  'https://res.cloudinary.com/gzou7y5z/image/upload/v1786812076/pexels-jonathan-pagaoa-46448199-33827091-Photoroom.png'

export default function App() {
  const [expandProgress, setExpandProgress] = useState(0)
  const [navVisible, setNavVisible] = useState(true)
  const [contactOpen, setContactOpen] = useState(false)
  const [copiedField, setCopiedField] = useState<'email' | 'phone' | null>(null)
  const stageWrapRef = useRef<HTMLDivElement>(null)
  const stageRef = useRef<HTMLDivElement>(null)
  const transitionTrackRef = useRef<HTMLDivElement>(null)
  const lastScrollYRef = useRef(0)

  // Responsive scale handler for pixel-exact hero stage
  useEffect(() => {
    const handleResize = () => {
      if (stageWrapRef.current && stageRef.current) {
        const scale = Math.min(1, stageWrapRef.current.clientWidth / 1289)
        stageRef.current.style.transform = `scale(${scale})`
        stageWrapRef.current.style.height = `${1051 * scale}px`
        document.documentElement.style.setProperty('--hero-scale', String(scale))
      }
    }

    handleResize()
    window.addEventListener('resize', handleResize)
    return () => window.removeEventListener('resize', handleResize)
  }, [])

  // Keep the navigation visible while scrolling up and hide it while scrolling down.
  useEffect(() => {
    const handleNavScroll = () => {
      const currentScrollY = window.scrollY
      setNavVisible(currentScrollY >= lastScrollYRef.current || currentScrollY < 24)
      lastScrollYRef.current = currentScrollY
    }

    window.addEventListener('scroll', handleNavScroll, { passive: true })
    return () => window.removeEventListener('scroll', handleNavScroll)
  }, [])

  // Scroll expansion handler for Case Study 02 white card container
  useEffect(() => {
    const handleExpandScroll = () => {
      if (!transitionTrackRef.current) return
      const rect = transitionTrackRef.current.getBoundingClientRect()
      const windowHeight = window.innerHeight

      const triggerStart = windowHeight * 0.75
      const expandDistance = windowHeight * 0.6

      const rawProgress = (triggerStart - rect.top) / expandDistance
      const clampedProgress = Math.min(1, Math.max(0, rawProgress))

      setExpandProgress(clampedProgress)
    }

    window.addEventListener('scroll', handleExpandScroll, { passive: true })
    window.addEventListener('resize', handleExpandScroll)
    handleExpandScroll()

    return () => {
      window.removeEventListener('scroll', handleExpandScroll)
      window.removeEventListener('resize', handleExpandScroll)
    }
  }, [])

  return (
    <div id="main-app" className="min-h-screen bg-[#080707] text-[#FCFAFA] w-full overflow-x-hidden font-body">
      {/* ---------------- SECTION 1: HERO STAGE ---------------- */}
      <section id="case1-hero" className="relative w-full overflow-hidden bg-[#080707] flex items-center justify-center">
        <div ref={stageWrapRef} className="hero-stage-wrap w-full max-w-[1289px] mx-auto">
          <div ref={stageRef} className="hero-stage">
            {/* Hero background portrait */}
            <div style={{ position: 'absolute', left: 0, top: 0, width: '1289px', height: '1051px', overflow: 'hidden' }}>
              <img
                src={HERO_BG_URL}
                crossOrigin="anonymous"
                referrerPolicy="no-referrer"
                fetchPriority="high"
                decoding="async"
                alt="Close-up black and white portrait"
                style={{ width: '100%', height: '100%', objectFit: 'cover' }}
              />
            </div>

            {/* Dark overlay */}
            <div style={{ position: 'absolute', left: 0, top: 0, width: '1289px', height: '1051px', background: 'rgb(5, 5, 5)', opacity: 0.82 }} />

            {/* Blur transition divider */}
            <div className="blur-divider" style={{ position: 'absolute', left: 0, top: '1029px', width: '1289px', height: '104px', zIndex: 1, pointerEvents: 'none' }} />

            {/* Glass nav bar */}
            {createPortal(<div className={`site-nav ${navVisible ? 'site-nav-visible' : 'site-nav-hidden'}`} aria-label="Main navigation">
              <div className="glass-bar site-nav-glass" style={{ position: 'absolute', left: 0, top: 0, width: '1289px', height: '121px' }} />

              {/* Inner black nav pill */}
              <div
                className="site-nav-pill"
                style={{
                position: 'absolute',
                left: '21px',
                top: '9px',
                width: '1249px',
                height: '87px',
                borderRadius: '100px',
                background: 'rgb(5, 5, 5)',
                overflow: 'hidden',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                paddingLeft: '28px',
                paddingRight: '36px',
              }}
            >
              <img
                src={LOGO_URL}
                alt="S.i logo"
                crossOrigin="anonymous"
                referrerPolicy="no-referrer"
                decoding="async"
                className="site-nav-logo"
                style={{ width: '60px', height: '60px', borderRadius: '30px', objectFit: 'cover' }}
              />
              <div
                className="font-body"
                style={{ fontWeight: 800, fontSize: '28px', lineHeight: '1.2em', color: 'rgb(250, 250, 250)', whiteSpace: 'nowrap' }}
              >
                <button type="button" className="contact-trigger" onClick={() => setContactOpen(true)}>Senzwelwe&apos;s Profile</button>
              </div>
              </div>
            </div>, document.body)}

            {/* Giant case number */}
            <div
              className="font-display hero-case-number"
              style={{ position: 'absolute', left: '50px', top: '137px', width: '297px', height: '281px', fontWeight: 400, fontSize: '300px', lineHeight: '1.2em', color: 'rgb(252, 250, 250)', userSelect: 'none', zIndex: 10 }}
            >
              01
            </div>

            {/* Case title */}
            <div
              className="font-display hero-case-title"
              style={{ position: 'absolute', left: '66px', top: '137px', width: '562px', height: '109px', fontWeight: 400, fontSize: '80px', lineHeight: '1.2em', color: 'rgb(252, 250, 250)', zIndex: 10 }}
            >
              Case Study
            </div>

            {/* Intro paragraph */}
            <div
              className="font-body hero-intro"
              style={{ position: 'absolute', left: '50px', top: '430px', width: '600px', maxWidth: '48%', height: 'auto', fontWeight: 400, fontSize: '28px', lineHeight: '1.2em', color: 'rgb(252, 250, 250)', zIndex: 10 }}
            >
              A national Internet Service Provider, wanted to disrupt the local fintech space by launching a fintech product to directly compete with their competitor&apos;s already successful fintech product. However, they rushed the launch without aligning their internal teams. Because customer care, tech support, and sales agents weren&apos;t talking to each other, technical glitches stalled the rollout, causing employees to panic, shift blame and give up.
            </div>
          </div>
        </div>
      </section>

      {/* ---------------- VIDEO LABEL ---------------- */}
      <section id="hero-video" className="bg-[#080707] w-full flex items-center justify-center py-6 sm:py-10 px-4">
        <span className="font-demun text-[#FCFAFA] text-[clamp(13px,4.2vw,34px)] sm:text-[28px] md:text-[34px] leading-none text-center whitespace-nowrap tracking-tight sm:tracking-wide max-w-full">
          Organisational Psychology
        </span>
      </section>

      {/* ---------------- SECTION 2: CASE 1 CONTENT ---------------- */}
      <section id="case1-content" className="bg-[#000000] py-0">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div id="technology-video" className="technology-video relative overflow-hidden rounded-[60px]">
            <video
              autoPlay
              loop
              muted
              playsInline
              preload="metadata"
              poster={ROBOT_URL}
              className="w-full h-full object-cover"
            >
              <source src="https://res.cloudinary.com/gzou7y5z/video/upload/q_auto,f_auto/technologyVideo.YyDVUGsY.mp4" type="video/mp4" />
              <source src="https://res.cloudinary.com/gzou7y5z/video/upload/f_auto,q_auto/technologyVideo.YyDVUGsY.mp4" type="video/mp4" />
            </video>
          </div>

          {/* First "The Diagnosis" block */}
          <div className="flex flex-col sm:flex-row items-start gap-6 sm:gap-8 mb-12 mt-8">
            <div className="flex-1 min-w-0">
              <h2 className="font-display text-[#FCFAFA] font-normal leading-[1.2] mb-3 text-[32px] sm:text-[50px]">The Diagnosis</h2>
              <p className="font-body text-[#FCFAFA] font-normal text-[15px] sm:text-[18px] leading-[1.4]">
                Instead of looking at the whole company, we zoom in on how the teams were designed to work together using the Group-Level Open Systems Model. The marketing team was pushed to get app downloads, in response to external pressure from the competition, while the customer support team was overwhelmed trying to handle system errors. They were running in completely opposite directions.
              </p>
            </div>
          </div>

          {/* Second "Change Intervention" block */}
          <div className="mb-12">
            <h2 className="font-display text-[#FCFAFA] font-normal leading-[1.2] mb-3 text-[32px] sm:text-[50px]">Change Intervention</h2>
            <div className="flex flex-col sm:flex-row items-start gap-6 sm:gap-8 mt-4">
              <div className="flex-1 min-w-0 space-y-4">
                <p className="font-body text-[#FCFAFA] font-normal text-[15px] sm:text-[18px] leading-[1.4]">
                  To fix this, HR shouldn&apos;t just send an email, they need to physically change how these employees interact daily using Technostructural Interventions (Work Design) and the Positive Effects of Feedback framework. They need to create Cross-Functional teams consisting of one tech engineer, one customer agent, and one sales rep who should all work with clear common goals.
                </p>
                <p className="font-body text-[#FCFAFA] font-normal text-[15px] sm:text-[18px] leading-[1.4]">
                  When they do not reach KPIs, HR must pivot by facilitating transparent, no-blame feedback sessions where teams look at the data together to solve problems, rather than hiding mistakes out of fear.
                </p>
              </div>
            </div>
          </div>

          {/* Expanding Case Study 02 Container */}
          <div ref={transitionTrackRef} className="mt-16 mb-12 sm:mb-16 w-full flex justify-center px-2">
            {/* Mobile layout */}
            <div className="block lg:hidden w-full max-w-[386px]">
              <div
                className="relative bg-[#F2F2F2] overflow-hidden shadow-[0px_3px_50px_27px_rgba(0,0,0,0.14)] transition-all duration-300 ease-out"
                style={{ borderRadius: `${40 + expandProgress * 16}px`, padding: `${28 + expandProgress * 20}px ${16 + expandProgress * 8}px` }}
              >
                <div
                  className="flex items-center justify-center transition-opacity duration-300"
                  style={{ display: expandProgress > 0.8 ? 'none' : 'flex', opacity: Math.max(0, 1 - expandProgress * 2.2), paddingTop: `${(1 - expandProgress) * 16}px`, paddingBottom: `${(1 - expandProgress) * 16}px` }}
                >
                  <h2 className="font-display font-bold text-[#000000] text-center text-[28px] sm:text-[36px]">Case Study 02</h2>
                </div>

                <div style={{ opacity: expandProgress < 0.1 ? 0 : Math.min(1, (expandProgress - 0.1) / 0.9), display: expandProgress < 0.05 ? 'none' : 'block', transition: 'opacity 300ms ease-out' }}>
                  {[
                    { id: 1, heading: 'Case Study 02', text: 'Another company, which also has an ISP wing, tried to launch a digital cross-border money transfer service, to capture the migrant worker remittance market. While the market desperately needed it, the service suffocated under the weight of the company\'s old-school public utility framework. Frontline branch workers were terrified of the new digital compliance rules, and rigid administrative layers made it impossible to adapt quickly to changing financial regulations.' },
                    { id: 2, heading: 'The Diagnosis', text: 'This was not a team issue; it was a massive clash of company identity and environment (Org. Culture) analyzed through the Burke-Litwin Model (Transformational Factors). The company tried to run a fast-paced digital fintech product using an old, risk-averse "post office" mindset. Also, branch staff were deeply comfortable with their legacy, manual workflows. When modern digital financial regulations were introduced, it triggered intense internal resistance because workers felt inadequately trained and feared looking incompetent.' },
                    { id: 3, heading: 'Change Intervention', text: 'When a company\'s culture is this rigid, you cannot force change from the top down. You have to nurture it safely using Parallel Learning Structures and the Normative-Reeducative Strategy. They could establish a temporary, separate team completely outside the strict post office hierarchy. Let this small group test the product, make mistakes, and build the workflow smoothly without getting slowed down by official paperwork and bureaucracies.' },
                    { id: 4, heading: '', text: 'Also, you can\'t order people to change their values. HR needs to hold interactive, story-driven workshops where employees actively participate in redefining the company’s identity—shifting their self-image from traditional operators into the modern community financial guides.' },
                  ].map((item) => (
                    <div key={item.id} className="relative z-10 mb-8 last:mb-2">
                      {item.heading && (
                        <h2 className="font-display font-bold text-[24px] sm:text-[32px] leading-[1.2] text-[#000000] text-center mb-2">{item.heading}</h2>
                      )}
                      <p className="font-body font-bold case-study-mobile-copy text-[14px] sm:text-[15px] leading-[1.4] text-[#000000] text-center">
                        {item.text}
                      </p>
                      {item.id === 1 && (
                        <div className="w-full flex justify-start -ml-8 sm:-ml-12 -my-8 sm:-my-12 overflow-visible">
                          <img
                            src={ROBOT_URL}
                            alt="Pixelated robot character"
                            crossOrigin="anonymous"
                            referrerPolicy="no-referrer"
                            decoding="async"
                            className="w-[440px] max-w-[96vw] h-auto object-contain select-none pointer-events-none drop-shadow-md -translate-x-10 sm:-translate-x-14"
                          />
                        </div>
                      )}
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* Desktop layout */}
            <div className="hidden lg:flex justify-center w-full">
              <div
                className="relative bg-[#F2F2F2] overflow-hidden shadow-[0px_3px_50px_27px_rgba(0,0,0,0.14)] transition-all duration-300 ease-out"
                style={{
                  width: `calc(386px + ${expandProgress} * (100vw - 60px - 386px))`,
                  borderRadius: `${56 + expandProgress * (100 - 56)}px`,
                  padding: `${48 + expandProgress * 32}px ${24 + expandProgress * 36}px`,
                  minHeight: `${120 + expandProgress * 1750}px`,
                }}
              >
                <div className="flex items-center justify-center transition-opacity duration-300" style={{ display: expandProgress > 0.85 ? 'none' : 'flex', opacity: Math.max(0, 1 - expandProgress * 2.5), minHeight: expandProgress < 0.2 ? '100px' : 'auto' }}>
                  <h2 className="font-display font-bold text-[#000000] text-center text-[40px]">Case Study 02</h2>
                </div>

                <div style={{ opacity: expandProgress < 0.1 ? 0 : Math.min(1, (expandProgress - 0.1) / 0.9), display: expandProgress < 0.05 ? 'none' : 'block', transition: 'opacity 300ms ease-out' }}>
                  {/* Item 1: Case Study 02 Header & Intro text */}
                  <div className="absolute left-1/2 -translate-x-1/2 text-center" style={{ top: '50px', width: 'min(85%, 900px)' }}>
                    <h2 className="font-display font-bold text-[50px] lg:text-[60px] leading-[1.2] text-[#000000] mb-3">Case Study 02</h2>
                    <p className="font-body font-bold text-[20px] lg:text-[24px] leading-[1.4] text-[#000000]">
                      Another company, which also has an ISP wing, tried to launch a digital cross-border money transfer service, to capture the migrant worker remittance market. While the market desperately needed it, the service suffocated under the weight of the company&apos;s old-school public utility framework. Frontline branch workers were terrified of the new digital compliance rules, and rigid administrative layers made it impossible to adapt quickly to changing financial regulations.
                    </p>
                  </div>

                  {/* Robot image placed beneath intro text and before The Diagnosis, shifted to the far left with edge clipping */}
                  <div className="absolute -left-12 lg:-left-20 xl:-left-24 pointer-events-none" style={{ top: '180px' }}>
                    <img
                      src={ROBOT_URL}
                      alt="Pixelated robot character"
                      crossOrigin="anonymous"
                      referrerPolicy="no-referrer"
                      decoding="async"
                      className="w-[520px] max-w-[48vw] h-auto object-contain select-none pointer-events-none drop-shadow-lg"
                    />
                  </div>

                  {/* Item 2: The Diagnosis */}
                  <div className="absolute left-1/2 -translate-x-1/2 text-center" style={{ top: '540px', width: 'min(85%, 900px)' }}>
                    <h2 className="font-display font-bold text-[50px] lg:text-[60px] leading-[1.2] text-[#000000] mb-3">The Diagnosis</h2>
                    <p className="font-body font-bold text-[20px] lg:text-[24px] leading-[1.4] text-[#000000]">
                      This was not a team issue; it was a massive clash of company identity and environment (Org. Culture) analyzed through the Burke-Litwin Model (Transformational Factors). The company tried to run a fast-paced digital fintech product using an old, risk-averse &quot;post office&quot; mindset. Also, branch staff were deeply comfortable with their legacy, manual workflows. When modern digital financial regulations were introduced, it triggered intense internal resistance because workers felt inadequately trained and feared looking incompetent.
                    </p>
                  </div>

                  {/* Item 3: Change Intervention */}
                  <div className="absolute left-1/2 -translate-x-1/2 text-center" style={{ top: '940px', width: 'min(85%, 900px)' }}>
                    <h2 className="font-display font-bold text-[50px] lg:text-[60px] leading-[1.2] text-[#000000] mb-3">Change Intervention</h2>
                    <p className="font-body font-bold text-[20px] lg:text-[24px] leading-[1.4] text-[#000000]">
                      When a company&apos;s culture is this rigid, you cannot force change from the top down. You have to nurture it safely using Parallel Learning Structures and the Normative-Reeducative Strategy. They could establish a temporary, separate team completely outside the strict post office hierarchy. Let this small group test the product, make mistakes, and build the workflow smoothly without getting slowed down by official paperwork and bureaucracies.
                    </p>
                  </div>

                  {/* Item 4: Second intervention text block without header */}
                  <div className="absolute left-1/2 -translate-x-1/2 text-center" style={{ top: '1340px', width: 'min(85%, 900px)' }}>
                    <p className="font-body font-bold text-[20px] lg:text-[24px] leading-[1.4] text-[#000000]">
                      Also, you can&apos;t order people to change their values. HR needs to hold interactive, story-driven workshops where employees actively participate in redefining the company’s identity—shifting their self-image from traditional operators into the modern community financial guides.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* ---------------- CRISES AVERSION (placed in the space between the white box and footer) ---------------- */}
          <div id="crises-aversion-block" className="w-full flex items-center justify-center pt-2 pb-12 sm:pb-16 px-4">
            <span className="font-sandy text-[#FFD700] text-[clamp(13px,4.2vw,34px)] sm:text-[28px] md:text-[34px] leading-none text-center whitespace-nowrap tracking-tight sm:tracking-wide select-none max-w-full">
              Crises Aversion
            </span>
          </div>
        </div>
      </section>

      {/* ---------------- FOOTER ---------------- */}
      <footer id="footer" className="bg-[#000000] py-6 w-full border-t border-white/10">
        <div className="flex flex-col items-center justify-center text-center gap-1">
          <button type="button" className="contact-trigger font-body font-normal text-[12px] leading-[1.4] text-[#FCFAFA]" onClick={() => setContactOpen(true)}>Produced by Senzelweyinkosi MJ.r Dlamini</button>
          <p className="font-body font-normal text-[12px] leading-[1.4] text-white/60">© 2026</p>
        </div>
      </footer>

      {contactOpen && (
        <div className="contact-overlay" role="presentation" onClick={() => setContactOpen(false)}>
          <section className="contact-card" role="dialog" aria-modal="true" aria-labelledby="contact-title" onClick={(event) => event.stopPropagation()}>
            <img src={ROBOT_URL} alt="Green robot" className="contact-robot" crossOrigin="anonymous" referrerPolicy="no-referrer" />
            <h2 id="contact-title" className="font-display contact-title">Contact Me!</h2>
            <p className="font-body contact-copy">If you like what you see and would like to find out more about my work, feel free to hit me up at:</p>
            <div className="contact-fields">
              {[
                { id: 'email' as const, value: 'senzelwemoosadlamini@gmail.com' },
                { id: 'phone' as const, value: '(+268)7853 5955' },
              ].map(({ id, value }) => (
                <button
                  key={id}
                  type="button"
                  className="contact-field"
                  onClick={async () => {
                    await navigator.clipboard.writeText(value)
                    setCopiedField(id)
                    window.setTimeout(() => setCopiedField(null), 1600)
                  }}
                  aria-label={`Copy ${id}`}
                >
                  <span>{value}</span>
                  {copiedField === id ? <Check aria-hidden="true" /> : <Copy aria-hidden="true" />}
                </button>
              ))}
            </div>
            <button type="button" className="contact-dismiss" onClick={() => setContactOpen(false)}>OK, Bye</button>
          </section>
        </div>
      )}
    </div>
  )
}

