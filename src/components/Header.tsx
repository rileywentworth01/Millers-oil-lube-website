import { useEffect, useState } from 'react';
import { Menu, X, Droplet } from 'lucide-react';

export default function Header() {
  const [scrolled, setScrolled] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  const navLinks = [
    { label: 'Vehicle Lookup', href: '#lookup' },
    { label: 'Oil Products', href: '#products' },
    { label: 'Services', href: '#services' },
    { label: 'About', href: '#about' },
    { label: 'Contact', href: '#contact' },
  ];

  const handleNavClick = (href: string) => {
    setMobileOpen(false);
    document.querySelector(href)?.scrollIntoView({ behavior: 'smooth' });
  };

  return (
    <header className={`fixed top-0 left-0 right-0 z-50 transition-all duration-500 ${
      scrolled ? 'bg-[#0a0e1a]/95 backdrop-blur-xl py-4 border-b border-white/5' : 'bg-transparent py-6'
    }`}>
      <div className="section-padding flex items-center justify-between">
        <a href="#top" onClick={(e) => { e.preventDefault(); window.scrollTo({ top: 0, behavior: 'smooth' }); }} className="flex items-center gap-3 group">
          <div className="w-10 h-10 rounded-none border border-[#c9a96e] flex items-center justify-center group-hover:bg-[#c9a96e]/10 transition-all duration-500">
            <Droplet className="w-5 h-5 text-[#c9a96e]" fill="currentColor" />
          </div>
          <div className="leading-none">
            <div className="font-display text-xl font-semibold tracking-wide text-white">MILLER'S</div>
            <div className="text-[9px] font-light uppercase tracking-[0.25em] text-[#c9a96e] mt-0.5">Oil Lube & Express</div>
          </div>
        </a>

        <nav className="hidden lg:flex items-center gap-1">
          {navLinks.map((link) => (
            <button key={link.href} onClick={() => handleNavClick(link.href)}
              className="px-4 py-2 text-[13px] font-light text-slate-300 hover:text-[#c9a96e] transition-all duration-300 tracking-wide">
              {link.label}
            </button>
          ))}
          <button onClick={() => handleNavClick('#lookup')} className="btn-primary text-xs ml-3">Find Your Oil</button>
        </nav>

        <button className="lg:hidden text-white p-2" onClick={() => setMobileOpen(!mobileOpen)} aria-label="Toggle menu">
          {mobileOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
        </button>
      </div>

      {mobileOpen && (
        <div className="lg:hidden absolute top-full left-0 right-0 bg-[#0a0e1a]/98 backdrop-blur-xl border-t border-white/5 animate-fade-in">
          <nav className="flex flex-col p-6 gap-1">
            {navLinks.map((link) => (
              <button key={link.href} onClick={() => handleNavClick(link.href)}
                className="px-4 py-3 text-left text-sm font-light text-slate-300 hover:text-[#c9a96e] transition-colors">
                {link.label}
              </button>
            ))}
            <button onClick={() => handleNavClick('#lookup')} className="btn-primary mt-3">Find Your Oil</button>
          </nav>
        </div>
      )}
    </header>
  );
}
