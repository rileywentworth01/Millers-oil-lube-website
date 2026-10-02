import { MapPin, Clock, Phone, Droplet, User } from 'lucide-react';

export default function Contact() {
  const hours = [
    { day: 'Monday', time: 'Closed' },
    { day: 'Tuesday', time: '8:30 AM – 5:30 PM' },
    { day: 'Wednesday', time: '8:30 AM – 5:30 PM' },
    { day: 'Thursday', time: '8:30 AM – 5:30 PM' },
    { day: 'Friday', time: '8:30 AM – 5:30 PM' },
    { day: 'Saturday', time: '9:00 AM – 2:00 PM' },
    { day: 'Sunday', time: 'Closed' },
  ];

  return (
    <section id="contact" className="py-32 bg-[#0a0e1a] relative">
      <div className="section-padding">
        <div className="text-center mb-16">
          <div className="inline-flex items-center gap-3 mb-6">
            <div className="w-6 h-px bg-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">Visit Us</span>
            <div className="w-6 h-px bg-[#c9a96e]" />
          </div>
          <h2 className="font-display text-4xl sm:text-5xl text-white mb-4">Come See Us in Whitehall</h2>
          <p className="text-base text-slate-400 font-light max-w-xl mx-auto">
            No appointment needed — just drive in. We'll have you back on the road in under ten minutes.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 max-w-4xl mx-auto">
          <div className="card p-10">
            <h3 className="font-display text-2xl text-white mb-8">Location & Hours</h3>

            <div className="space-y-5 mb-8">
              <div className="flex items-start gap-3">
                <MapPin className="w-4 h-4 text-[#c9a96e] flex-shrink-0 mt-1" />
                <div>
                  <div className="text-sm text-white font-medium">Miller's Oil Lube and Express</div>
                  <div className="text-sm text-slate-400 font-light">Whitehall, Michigan</div>
                </div>
              </div>
              <div className="flex items-start gap-3">
                <User className="w-4 h-4 text-[#c9a96e] flex-shrink-0 mt-1" />
                <div>
                  <div className="text-sm text-white font-medium">Gerrie Miller — Owner</div>
                  <div className="text-sm text-slate-400 font-light">Locally owned & operated for 20 years</div>
                </div>
              </div>
              <div className="flex items-start gap-3">
                <Phone className="w-4 h-4 text-[#c9a96e] flex-shrink-0 mt-1" />
                <div>
                  <div className="text-sm text-white font-medium">Give us a call</div>
                  <div className="text-sm text-slate-400 font-light">(231) 000-0000</div>
                </div>
              </div>
            </div>

            <div className="flex items-center gap-2 mb-4">
              <Clock className="w-4 h-4 text-[#c9a96e]" />
              <h4 className="text-[11px] font-medium text-slate-300 uppercase tracking-wider">Business Hours</h4>
            </div>
            <div>
              {hours.map((entry) => (
                <div key={entry.day} className="flex items-center justify-between py-2.5 border-b border-white/5 last:border-0">
                  <span className="text-sm text-slate-400 font-light">{entry.day}</span>
                  <span className={`text-sm ${entry.time === 'Closed' ? 'text-red-400/70' : 'text-slate-300'} font-light`}>{entry.time}</span>
                </div>
              ))}
            </div>
          </div>

          <div className="flex flex-col gap-6">
            <div className="card p-10 bg-gradient-to-br from-[#c9a96e]/5 to-transparent border-[#c9a96e]/20">
              <Droplet className="w-8 h-8 text-[#c9a96e] mb-5" fill="currentColor" />
              <h3 className="font-display text-2xl text-white mb-3">Ready for Your Oil Change?</h3>
              <p className="text-sm text-slate-400 font-light mb-6 leading-relaxed">
                Use our vehicle lookup tool to find your car's oil specs and pricing, then drive in — no appointment needed. Most services done in under 10 minutes.
              </p>
              <button onClick={() => document.querySelector('#lookup')?.scrollIntoView({ behavior: 'smooth' })} className="btn-primary w-full">
                <Droplet className="w-4 h-4" /> Find Your Vehicle's Oil
              </button>
            </div>

            <div className="card p-10">
              <h3 className="font-display text-lg text-white mb-5">What to Expect</h3>
              <ul className="space-y-3">
                {[
                  'Drive in — no appointment needed',
                  'Choose from Mobil 1, Valvoline, or Rotella',
                  'Professional service — under 10 minutes',
                  'Multi-point inspection included',
                  'Pay and hit the road',
                ].map((item) => (
                  <li key={item} className="flex items-center gap-3 text-sm text-slate-400 font-light">
                    <div className="w-1.5 h-1.5 rounded-full bg-[#c9a96e] flex-shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
