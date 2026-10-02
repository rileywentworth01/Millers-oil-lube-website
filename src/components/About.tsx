import { Droplet, Users, Award, MapPin, Heart, ShieldCheck } from 'lucide-react';

export default function About() {
  const stats = [
    { icon: Users, value: '10,000+', label: 'Oil Changes Performed' },
    { icon: Award, value: '20 Years', label: 'Serving Whitehall' },
    { icon: MapPin, value: 'Whitehall', label: 'Michigan' },
    { icon: Droplet, value: '100+', label: 'Models Serviced' },
  ];

  return (
    <section id="about" className="py-32 bg-[#0d1220] relative overflow-hidden">
      <div className="absolute inset-0" style={{
        background: `radial-gradient(ellipse at 50% 50%, rgba(201, 169, 110, 0.04) 0%, transparent 60%)`,
      }} />

      <div className="section-padding relative z-10">
        <div className="max-w-3xl mx-auto text-center">
          <div className="inline-flex items-center gap-3 mb-6">
            <div className="w-6 h-px bg-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">About Miller's</span>
            <div className="w-6 h-px bg-[#c9a96e]" />
          </div>
          <h2 className="font-display text-4xl sm:text-5xl text-white mb-8">
            Locally Owned & Operated<br />by Gerrie Miller
          </h2>
          <p className="text-base text-slate-400 font-light leading-relaxed mb-6">
            For twenty years, Gerrie Miller has been the trusted name in oil changes in Whitehall, Michigan.
            What began as a small shop has grown into the community's destination for fast, reliable service —
            but the values haven't changed. Honest pricing, quality products, and getting you back on the road
            in under ten minutes.
          </p>
          <p className="text-base text-slate-400 font-light leading-relaxed mb-10">
            We carry Mobil 1, Valvoline, and Shell Rotella oils, and service every type of vehicle on the road —
            from compact sedans to heavy-duty diesel trucks. When you come to Miller's, you're not just a customer.
            You're a neighbor.
          </p>

          <div className="flex flex-wrap justify-center gap-3 mb-14">
            {[
              { icon: Heart, label: 'Locally Owned' },
              { icon: ShieldCheck, label: 'Trusted & Reliable' },
              { icon: Award, label: '20 Years of Experience' },
            ].map((badge) => (
              <div key={badge.label} className="flex items-center gap-2 px-5 py-2.5 border border-white/10">
                <badge.icon className="w-4 h-4 text-[#c9a96e]" />
                <span className="text-xs font-light text-slate-300 tracking-wide">{badge.label}</span>
              </div>
            ))}
          </div>

          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {stats.map((stat) => (
              <div key={stat.label} className="text-center">
                <div className="w-10 h-10 border border-[#c9a96e]/30 flex items-center justify-center mx-auto mb-4">
                  <stat.icon className="w-5 h-5 text-[#c9a96e]" />
                </div>
                <div className="font-display text-2xl sm:text-3xl text-white">{stat.value}</div>
                <div className="text-[11px] text-slate-500 uppercase tracking-wider mt-1">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
