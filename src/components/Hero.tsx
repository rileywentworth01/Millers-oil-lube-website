import { Droplet, Wrench, MapPin, Clock, ArrowDown } from 'lucide-react';

export default function Hero() {
  const scrollToLookup = () => document.querySelector('#lookup')?.scrollIntoView({ behavior: 'smooth' });

  return (
    <section id="top" className="relative min-h-screen flex items-center overflow-hidden bg-[#0a0e1a]">
      <div className="absolute inset-0" style={{
        background: `radial-gradient(ellipse at 30% 40%, rgba(201, 169, 110, 0.08) 0%, transparent 50%),
                     radial-gradient(ellipse at 70% 70%, rgba(201, 169, 110, 0.05) 0%, transparent 50%)`,
      }} />
      <div className="absolute inset-0 opacity-[0.015]" style={{
        backgroundImage: `linear-gradient(rgba(255,255,255,0.5) 1px, transparent 1px),
                         linear-gradient(90deg, rgba(255,255,255,0.5) 1px, transparent 1px)`,
        backgroundSize: '60px 60px',
      }} />

      <div className="section-padding relative z-10 pt-32 pb-20 w-full">
        <div className="max-w-2xl">
          <div className="inline-flex items-center gap-2 mb-8 animate-fade-in-up">
            <div className="w-8 h-px bg-[#c9a96e]" />
            <MapPin className="w-3.5 h-3.5 text-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">Whitehall, Michigan</span>
          </div>

          <h1 className="font-display text-5xl sm:text-6xl lg:text-7xl text-white leading-[1.1] mb-8 animate-fade-in-up" style={{ animationDelay: '0.1s' }}>
            Precision Oil Care.<br />
            <span className="shimmer-text">Every Vehicle.</span><br />
            Every Engine.
          </h1>

          <p className="text-base sm:text-lg text-slate-400 font-light mb-10 max-w-xl leading-relaxed animate-fade-in-up" style={{ animationDelay: '0.2s' }}>
            From sedans to heavy-duty diesel trucks — we deliver expert oil service
            with premium products, honest pricing, and a standard of care that has served
            Whitehall for twenty years.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 mb-16 animate-fade-in-up" style={{ animationDelay: '0.3s' }}>
            <button onClick={scrollToLookup} className="btn-primary">
              <Droplet className="w-4 h-4" /> Find Your Vehicle's Oil
            </button>
            <button onClick={() => document.querySelector('#services')?.scrollIntoView({ behavior: 'smooth' })} className="btn-ghost">
              <Wrench className="w-4 h-4" /> Our Services
            </button>
          </div>

          <div className="grid grid-cols-3 gap-8 max-w-md animate-fade-in-up" style={{ animationDelay: '0.4s' }}>
            <div>
              <div className="font-display text-4xl text-[#c9a96e]">$36</div>
              <div className="text-[11px] text-slate-500 uppercase tracking-wider mt-1">Basic Change</div>
            </div>
            <div>
              <div className="font-display text-4xl text-[#c9a96e] flex items-center gap-1">
                <Clock className="w-7 h-7" />10
              </div>
              <div className="text-[11px] text-slate-500 uppercase tracking-wider mt-1">Min, At Most</div>
            </div>
            <div>
              <div className="font-display text-4xl text-[#c9a96e]">20</div>
              <div className="text-[11px] text-slate-500 uppercase tracking-wider mt-1">Years Serving</div>
            </div>
          </div>
        </div>
      </div>

      <div className="absolute bottom-8 left-1/2 -translate-x-1/2 z-10 animate-fade-in" style={{ animationDelay: '0.8s' }}>
        <ArrowDown className="w-5 h-5 text-slate-600 animate-bounce" />
      </div>
    </section>
  );
}
