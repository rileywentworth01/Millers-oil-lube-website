import { Droplet, MapPin, User } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="bg-[#070b15] py-14 border-t border-white/5">
      <div className="section-padding">
        <div className="flex flex-col md:flex-row items-center justify-between gap-6">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 border border-[#c9a96e] flex items-center justify-center">
              <Droplet className="w-5 h-5 text-[#c9a96e]" fill="currentColor" />
            </div>
            <div className="leading-none">
              <div className="font-display text-lg font-semibold tracking-wide text-white">MILLER'S</div>
              <div className="text-[9px] font-light uppercase tracking-[0.25em] text-[#c9a96e] mt-0.5">Oil Lube & Express</div>
            </div>
          </div>

          <div className="flex items-center gap-2 text-xs text-slate-500 font-light">
            <User className="w-3.5 h-3.5 text-[#c9a96e]" />
            <span>Gerrie Miller, Owner</span>
          </div>

          <div className="flex items-center gap-2 text-xs text-slate-500 font-light">
            <MapPin className="w-3.5 h-3.5 text-[#c9a96e]" />
            <span>Whitehall, Michigan</span>
          </div>

          <div className="text-xs text-slate-600 font-light">
            &copy; {new Date().getFullYear()} Miller's Oil Lube and Express
          </div>
        </div>
      </div>
    </footer>
  );
}
