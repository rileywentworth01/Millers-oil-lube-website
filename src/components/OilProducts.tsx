import { useEffect, useState } from 'react';
import { Droplet } from 'lucide-react';
import { supabase, type OilProduct } from '@/lib/supabase';

export default function OilProducts() {
  const [products, setProducts] = useState<OilProduct[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [activeCategory, setActiveCategory] = useState('all');

  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from('oil_products').select('*').order('sort_order');
        if (error) throw error;
        setProducts(data || []);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load products');
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  const categories = [
    { key: 'all', label: 'All' },
    { key: 'synthetic', label: 'Synthetic' },
    { key: 'blend', label: 'Blends' },
    { key: 'conventional', label: 'Conventional' },
    { key: 'diesel', label: 'Diesel' },
  ];

  const filtered = activeCategory === 'all' ? products : products.filter((p) => p.category === activeCategory);

  if (loading) return <section id="products" className="py-32 bg-[#0d1220]"><div className="section-padding text-center"><div className="inline-block w-6 h-6 border border-[#c9a96e] border-t-transparent rounded-full animate-spin" /></div></section>;
  if (error) return <section id="products" className="py-32 bg-[#0d1220]"><div className="section-padding text-center"><p className="text-red-400 text-sm">{error}</p></div></section>;

  return (
    <section id="products" className="py-32 bg-[#0d1220] relative">
      <div className="section-padding">
        <div className="text-center mb-14">
          <div className="inline-flex items-center gap-3 mb-6">
            <div className="w-6 h-px bg-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">Oil Pricing</span>
            <div className="w-6 h-px bg-[#c9a96e]" />
          </div>
          <h2 className="font-display text-4xl sm:text-5xl text-white mb-4">Premium Oil Products</h2>
          <p className="text-base text-slate-400 font-light max-w-xl mx-auto">
            Mobil 1, Valvoline, and Shell Rotella — competitive per-quart pricing. Filter and labor included with every service.
          </p>
        </div>

        <div className="flex flex-wrap justify-center gap-2 mb-10">
          {categories.map((cat) => (
            <button key={cat.key} onClick={() => setActiveCategory(cat.key)}
              className={`px-5 py-2 text-[11px] font-medium uppercase tracking-wider transition-all duration-300 border-b-2 ${
                activeCategory === cat.key ? 'text-[#c9a96e] border-[#c9a96e]' : 'text-slate-500 border-transparent hover:text-slate-300'
              }`}>
              {cat.label}
            </button>
          ))}
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
          {filtered.map((product, idx) => (
            <div key={product.id} className="card p-6 hover:border-[#c9a96e]/20 animate-fade-in-up" style={{ animationDelay: `${idx * 0.05}s` }}>
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="font-display text-xl text-white">{product.brand}</h3>
                  <p className="text-xs text-slate-500 font-light mt-0.5">{product.product_line}</p>
                </div>
                <span className={`badge ${
                  product.category === 'synthetic' ? 'bg-[#c9a96e]/10 text-[#c9a96e]' :
                  product.category === 'blend' ? 'bg-blue-950/40 text-blue-300' :
                  product.category === 'conventional' ? 'bg-white/5 text-slate-400' :
                  'bg-emerald-950/40 text-emerald-300'
                }`}>{product.category}</span>
              </div>
              <div className="flex items-end justify-between pt-4 border-t border-white/5">
                <div>
                  <div className="text-[10px] text-slate-500 uppercase tracking-wider">Viscosity</div>
                  <div className="text-sm text-slate-300 font-light">{product.viscosity}</div>
                </div>
                <div className="text-right">
                  <div className="text-[10px] text-slate-500 uppercase tracking-wider">Per Quart</div>
                  <div className="font-display text-2xl text-[#c9a96e]">${product.price.toFixed(2)}</div>
                </div>
              </div>
            </div>
          ))}
        </div>

        <p className="text-center text-xs text-slate-600 mt-10 font-light max-w-lg mx-auto">
          Prices shown are per quart. Total oil cost depends on your vehicle's capacity. Use the lookup tool above for exact pricing.
        </p>
      </div>
    </section>
  );
}
