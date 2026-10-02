import { Droplet, Wrench, Gauge, ShieldCheck, Car, Wind, Filter as FilterIcon, Cog } from 'lucide-react';

const services = [
  { icon: Droplet, title: 'Basic Oil & Filter — $36', description: 'Oil and filter change only. Choose from conventional, synthetic blend, or full synthetic. Done in under 10 minutes.', features: ['Up to 20 quarts included', 'New oil filter', 'Oil and filter only', 'Under 10 minutes, at most'] },
  { icon: Wrench, title: 'Full Service Oil Change', description: 'Everything in Basic plus full fluid check: transmission, rear diff, power steering, external air filter, washer fluid, tire pressure, and brake fluid. Price varies with replacements.', features: ['Oil & filter change', 'Transmission fluid check', 'Rear diff fluid check', 'Power steering fluid', 'External air filter', 'Washer fluid top-off', 'Tire pressure check', 'Brake fluid check'] },
  { icon: Cog, title: 'Drivetrain Services', description: 'Front differential, rear differential, transfer case, and transaxle services on select trucks and SUVs. Use the lookup tool to check availability.', features: ['Front differential', 'Rear differential', 'Transfer case', 'Transaxle'] },
  { icon: ShieldCheck, title: 'Multi-Point Inspection', description: 'Complimentary inspection of key maintenance items with every visit.', features: ['Cabin air filter check', 'Wiper blade inspection', 'Serpentine belt inspection', 'Tire condition'] },
  { icon: Wind, title: 'Wiper Blade Replacement', description: 'Bosch Connect and Bosch Icon blades in all sizes. Rear blades on request. Sourced via Advanced Auto Parts — delivered in 5-10 minutes.', features: ['Bosch Connect from $14', 'Bosch Icon from $28', 'Rear blades on request', '5-10 min delivery'] },
  { icon: FilterIcon, title: 'Mobil 1 Premium Filter', description: 'Upgrade to Mobil 1 oil filter for superior filtration. All Mobil 1 filters are $12.', features: ['Premium filtration', '$12 for any vehicle', 'Superior engine protection', 'Available on any service'] },
  { icon: Gauge, title: 'Diesel Oil Service', description: 'Specialized diesel oil changes using Rotella T-6, T-4, Mobil Delvac, and Delvac Extreme.', features: ['Rotella T-6 & T-4', 'Mobil Delvac options', 'Diesel-spec filters', 'High-capacity engines'] },
  { icon: Car, title: 'Fleet Services', description: 'Priority fleet oil change services with volume pricing and flexible scheduling.', features: ['Volume discounts', 'Flexible scheduling', 'Service records', 'All vehicle types'] },
];

export default function Services() {
  return (
    <section id="services" className="py-32 bg-[#0a0e1a] relative">
      <div className="section-padding">
        <div className="text-center mb-16">
          <div className="inline-flex items-center gap-3 mb-6">
            <div className="w-6 h-px bg-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">What We Do</span>
            <div className="w-6 h-px bg-[#c9a96e]" />
          </div>
          <h2 className="font-display text-4xl sm:text-5xl text-white mb-4">Our Services</h2>
          <p className="text-base text-slate-400 font-light max-w-xl mx-auto">
            From quick oil changes to full-service fluid checks. Most services completed in under 10 minutes.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {services.map((service, idx) => (
            <div key={service.title} className={`card p-8 hover:border-[#c9a96e]/20 animate-fade-in-up ${idx === 0 ? 'border-[#c9a96e]/30' : ''}`} style={{ animationDelay: `${idx * 0.06}s` }}>
              <div className="w-10 h-10 border border-[#c9a96e]/30 flex items-center justify-center mb-5">
                <service.icon className="w-5 h-5 text-[#c9a96e]" />
              </div>
              <h3 className="font-display text-xl text-white mb-3">{service.title}</h3>
              <p className="text-sm text-slate-400 font-light mb-5 leading-relaxed">{service.description}</p>
              <ul className="space-y-2">
                {service.features.map((feature) => (
                  <li key={feature} className="flex items-center gap-2 text-xs text-slate-400 font-light">
                    <div className="w-1 h-1 rounded-full bg-[#c9a96e] flex-shrink-0" />
                    {feature}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Wiper Blade Table */}
        <div className="max-w-3xl mx-auto mt-12">
          <div className="card p-8">
            <div className="flex items-center gap-2 mb-5">
              <Wind className="w-4 h-4 text-[#c9a96e]" />
              <h3 className="font-display text-lg text-white">Wiper Blade Pricing</h3>
            </div>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="text-left border-b border-white/10">
                    <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Brand</th>
                    <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Tier</th>
                    <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Size</th>
                    <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider text-right">Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-300 font-medium" colSpan={4}>Bosch Connect — Economy</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Connect</td><td className="py-2.5 pr-4 text-slate-500">Economy</td><td className="py-2.5 pr-4 text-slate-400">18"–22"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$14</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Connect</td><td className="py-2.5 pr-4 text-slate-500">Economy</td><td className="py-2.5 pr-4 text-slate-400">24"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$17</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Connect</td><td className="py-2.5 pr-4 text-slate-500">Economy</td><td className="py-2.5 pr-4 text-slate-400">26"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$19</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Connect</td><td className="py-2.5 pr-4 text-slate-500">Economy</td><td className="py-2.5 pr-4 text-slate-400">28"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$21</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-300 font-medium" colSpan={4}>Bosch Icon — Premium</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Icon</td><td className="py-2.5 pr-4 text-slate-500">Premium</td><td className="py-2.5 pr-4 text-slate-400">16"–20"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$28</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Icon</td><td className="py-2.5 pr-4 text-slate-500">Premium</td><td className="py-2.5 pr-4 text-slate-400">22"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$30</td></tr>
                  <tr className="border-b border-white/5"><td className="py-2.5 pr-4 text-slate-400 font-light">Bosch Icon</td><td className="py-2.5 pr-4 text-slate-500">Premium</td><td className="py-2.5 pr-4 text-slate-400">24"–28"</td><td className="py-2.5 pr-4 text-right font-display text-[#c9a96e]">$32</td></tr>
                </tbody>
              </table>
            </div>
            <p className="text-[11px] text-slate-600 mt-4 font-light">
              Rear wiper blades available on request. Sourced via Advanced Auto Parts partnership — parts delivered in 5-10 minutes.
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}
