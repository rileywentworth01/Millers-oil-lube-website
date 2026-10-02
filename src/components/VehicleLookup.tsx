import { useEffect, useState, useMemo } from 'react';
import { Search, Car, Truck, Droplet, CheckCircle2, XCircle, Filter, Fuel, Gauge, AlertOctagon, ShieldX, ArrowRight } from 'lucide-react';
import { supabase, type Vehicle, type OilProduct } from '@/lib/supabase';

export default function VehicleLookup() {
  const [vehicles, setVehicles] = useState<Vehicle[]>([]);
  const [oilProducts, setOilProducts] = useState<OilProduct[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const [selectedMake, setSelectedMake] = useState('');
  const [selectedModel, setSelectedModel] = useState('');
  const [selectedYear, setSelectedYear] = useState('');
  const [selectedEngine, setSelectedEngine] = useState('');
  const [results, setResults] = useState<Vehicle[]>([]);
  const [searched, setSearched] = useState(false);
  const [mobil1Filter, setMobil1Filter] = useState(false);

  useEffect(() => {
    (async () => {
      try {
        const [vRes, oRes] = await Promise.all([
          supabase.from('vehicles').select('*').order('sort_order'),
          supabase.from('oil_products').select('*').order('sort_order'),
        ]);
        if (vRes.error) throw vRes.error;
        if (oRes.error) throw oRes.error;
        setVehicles(vRes.data || []);
        setOilProducts(oRes.data || []);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load data');
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  const makes = useMemo(() => [...new Set(vehicles.map((v) => v.make))].sort(), [vehicles]);

  const models = useMemo(() => {
    const filtered = vehicles.filter((v) => v.make === selectedMake);
    return [...new Set(filtered.map((v) => v.model))].sort();
  }, [vehicles, selectedMake]);

  const years = useMemo(() => {
    const allYears: number[] = [];
    for (let y = 2024; y >= 1970; y--) allYears.push(y);
    return allYears;
  }, []);

  const engines = useMemo(() => {
    let filtered = vehicles;
    if (selectedMake) filtered = filtered.filter((v) => v.make === selectedMake);
    if (selectedModel) filtered = filtered.filter((v) => v.model === selectedModel);
    return filtered.map((v) => ({
      label: `${v.engine_liters || '?'}L ${v.engine_type.toUpperCase()} — ${v.engine_specs || v.body_type}`,
      value: v.id,
    }));
  }, [vehicles, selectedMake, selectedModel]);

  const handleSearch = () => {
    let filtered = [...vehicles];

    if (selectedMake) filtered = filtered.filter((v) => v.make === selectedMake);
    if (selectedModel) filtered = filtered.filter((v) => v.model === selectedModel);
    if (selectedYear) {
      filtered = filtered.filter((v) =>
        v.year_start !== null && v.year_end !== null &&
        parseInt(selectedYear) >= v.year_start && parseInt(selectedYear) <= v.year_end
      );
    }
    if (selectedEngine) filtered = filtered.filter((v) => v.id === selectedEngine);

    setResults(filtered);
    setSearched(true);
  };

  const handleReset = () => {
    setSelectedMake('');
    setSelectedModel('');
    setSelectedYear('');
    setSelectedEngine('');
    setResults([]);
    setSearched(false);
    setMobil1Filter(false);
  };

  const getRecommendedOils = (vehicle: Vehicle): OilProduct[] => {
    if (vehicle.engine_type === 'electric') return [];
    if (vehicle.engine_type === 'diesel') return oilProducts.filter((o) => o.category === 'diesel');
    if (vehicle.synthetic_recommended) return oilProducts.filter((o) => o.category === 'synthetic' || o.category === 'blend');
    return oilProducts;
  };

  const calculateOilCost = (vehicle: Vehicle, product: OilProduct): number => {
    return vehicle.oil_capacity_quarts * product.price;
  };

  if (loading) {
    return (
      <section id="lookup" className="py-32 bg-[#0a0e1a]">
        <div className="section-padding text-center">
          <div className="inline-block w-6 h-6 border border-[#c9a96e] border-t-transparent rounded-full animate-spin mb-4" />
          <p className="text-slate-500 text-sm">Loading vehicle database...</p>
        </div>
      </section>
    );
  }

  if (error) {
    return (
      <section id="lookup" className="py-32 bg-[#0a0e1a]">
        <div className="section-padding text-center">
          <p className="text-red-400 text-sm">Unable to load data: {error}</p>
        </div>
      </section>
    );
  }

  return (
    <section id="lookup" className="py-32 bg-[#0a0e1a] relative">
      <div className="absolute inset-0 opacity-[0.01]" style={{
        backgroundImage: `linear-gradient(rgba(255,255,255,0.5) 1px, transparent 1px),
                         linear-gradient(90deg, rgba(255,255,255,0.5) 1px, transparent 1px)`,
        backgroundSize: '60px 60px',
      }} />

      <div className="section-padding relative z-10">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="inline-flex items-center gap-3 mb-6">
            <div className="w-6 h-px bg-[#c9a96e]" />
            <span className="text-[11px] font-light text-[#c9a96e] uppercase tracking-[0.25em]">Vehicle Lookup</span>
            <div className="w-6 h-px bg-[#c9a96e]" />
          </div>
          <h2 className="font-display text-4xl sm:text-5xl text-white mb-4">
            Find Your Vehicle's Oil Specifications
          </h2>
          <p className="text-base text-slate-400 font-light max-w-xl mx-auto leading-relaxed">
            Select your make, model, year, and engine to discover exact oil capacity,
            recommended oil type, drivetrain service availability, and per-quart pricing.
          </p>
        </div>

        {/* Search Form */}
        <div className="card p-8 sm:p-10 max-w-3xl mx-auto mb-12">
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
            <div>
              <label className="label-lux">Make</label>
              <select value={selectedMake}
                onChange={(e) => { setSelectedMake(e.target.value); setSelectedModel(''); setSelectedEngine(''); }}
                className="input-lux">
                <option value="">All Makes</option>
                {makes.map((make) => <option key={make} value={make}>{make}</option>)}
              </select>
            </div>
            <div>
              <label className="label-lux">Model</label>
              <select value={selectedModel}
                onChange={(e) => setSelectedModel(e.target.value)}
                disabled={!selectedMake}
                className="input-lux disabled:opacity-40">
                <option value="">All Models</option>
                {models.map((model) => <option key={model} value={model}>{model}</option>)}
              </select>
            </div>
            <div>
              <label className="label-lux">Year</label>
              <select value={selectedYear}
                onChange={(e) => setSelectedYear(e.target.value)}
                className="input-lux">
                <option value="">Any Year</option>
                {years.map((year) => <option key={year} value={year}>{year}</option>)}
              </select>
            </div>
            <div>
              <label className="label-lux">Engine / Liters</label>
              <select value={selectedEngine}
                onChange={(e) => setSelectedEngine(e.target.value)}
                disabled={!selectedMake}
                className="input-lux disabled:opacity-40">
                <option value="">All Engines</option>
                {engines.map((eng) => <option key={eng.value} value={eng.value}>{eng.label}</option>)}
              </select>
            </div>
          </div>

          <div className="flex flex-col sm:flex-row gap-3 mt-8">
            <button onClick={handleSearch} className="btn-primary flex-1">
              <Search className="w-4 h-4" /> Search Vehicles
            </button>
            <button onClick={handleReset} className="btn-ghost">
              <Filter className="w-4 h-4" /> Reset
            </button>
          </div>
        </div>

        {/* Results */}
        {searched && (
          <div className="max-w-3xl mx-auto">
            <div className="flex items-center justify-between mb-6">
              <h3 className="font-display text-2xl text-white">
                {results.length} {results.length === 1 ? 'Result' : 'Results'}
              </h3>
              <span className="text-xs text-slate-500 uppercase tracking-wider">Oil specs & pricing</span>
            </div>

            {results.length === 0 ? (
              <div className="card p-16 text-center">
                <Car className="w-10 h-10 text-slate-600 mx-auto mb-4" />
                <p className="text-lg font-display text-slate-300">No vehicles found</p>
                <p className="text-slate-500 mt-2 text-sm">Try adjusting your search filters.</p>
              </div>
            ) : (
              <div className="grid grid-cols-1 gap-6">
                {results.map((vehicle, idx) => {
                  const recommendedOils = getRecommendedOils(vehicle);
                  const isElectric = vehicle.engine_type === 'electric';
                  const notServiceable = !vehicle.serviceable;

                  return (
                    <div key={vehicle.id} className="card p-8 hover:border-[#c9a96e]/30 animate-fade-in-up" style={{ animationDelay: `${idx * 0.08}s` }}>
                      {notServiceable && (
                        <div className="mb-6 bg-red-950/30 border border-red-800/40 p-4 flex items-start gap-3">
                          <ShieldX className="w-5 h-5 text-red-400 flex-shrink-0 mt-0.5" />
                          <div>
                            <p className="font-display text-base text-red-300">We cannot service this vehicle.</p>
                            <p className="text-sm text-red-400/70 mt-1 font-light">
                              The exhaust system covers the oil pan and filter on this vehicle, so it must be taken to a dealership for service.
                            </p>
                          </div>
                        </div>
                      )}

                      {/* Vehicle Header */}
                      <div className="flex items-start justify-between mb-6">
                        <div>
                          <h4 className="font-display text-3xl text-white mb-2">
                            {vehicle.make} {vehicle.model}
                          </h4>
                          <div className="flex items-center gap-3 flex-wrap">
                            <span className="text-xs text-slate-500">
                              {vehicle.year_start}–{vehicle.year_end || 'Present'}
                            </span>
                            <span className={`badge ${
                              vehicle.engine_type === 'diesel' ? 'bg-blue-950/50 text-blue-300' :
                              vehicle.engine_type === 'hybrid' ? 'bg-emerald-950/50 text-emerald-300' :
                              vehicle.engine_type === 'electric' ? 'bg-teal-950/50 text-teal-300' :
                              'bg-[#c9a96e]/10 text-[#c9a96e]'
                            }`}>
                              <Fuel className="w-3 h-3" />
                              {vehicle.engine_type.charAt(0).toUpperCase() + vehicle.engine_type.slice(1)}
                            </span>
                          </div>
                        </div>
                        <div className="text-right">
                          <div className="text-[11px] text-slate-500 uppercase tracking-wider">Engine</div>
                          <div className="text-sm text-slate-300 font-light max-w-[200px]">{vehicle.engine_specs || '—'}</div>
                          {vehicle.engine_liters ? <div className="text-xs text-[#c9a96e] mt-1">{vehicle.engine_liters}L</div> : null}
                        </div>
                      </div>

                      {/* Key Specs */}
                      {!isElectric && (
                        <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-6">
                          <div className="border-l border-[#c9a96e]/30 pl-3">
                            <div className="text-[10px] text-slate-500 uppercase tracking-wider mb-1">Oil Capacity</div>
                            <div className="font-display text-2xl text-[#c9a96e]">{vehicle.oil_capacity_quarts} <span className="text-sm text-slate-500">qt</span></div>
                          </div>
                          <div className="border-l border-white/10 pl-3">
                            <div className="text-[10px] text-slate-500 uppercase tracking-wider mb-1">Oil Type</div>
                            <div className="text-sm text-slate-300 font-medium">
                              {vehicle.synthetic_recommended ? 'Synthetic' : 'Conventional'}
                            </div>
                            <div className="text-[10px] text-slate-500">
                              {vehicle.synthetic_recommended ? 'Recommended' : 'OK'}
                            </div>
                          </div>
                          <div className="border-l border-white/10 pl-3">
                            <div className="text-[10px] text-slate-500 uppercase tracking-wider mb-1">Oil Filter</div>
                            <div className="text-sm text-slate-300 font-medium">{vehicle.oil_filter || '—'}</div>
                          </div>
                          <div className="border-l border-white/10 pl-3">
                            <div className="text-[10px] text-slate-500 uppercase tracking-wider mb-1">Mobil 1 Filter</div>
                            <div className="text-sm text-slate-300 font-medium">$12.00</div>
                            <div className="text-[10px] text-slate-500">Premium upgrade</div>
                          </div>
                        </div>
                      )}

                      {/* Drivetrain Service */}
                      {!isElectric && (
                        <div className="flex flex-wrap gap-2 mb-6">
                          {[
                            { label: 'Rear Differential', available: vehicle.rear_diff_service },
                            { label: 'Front Differential', available: vehicle.front_diff_service },
                            { label: 'Transfer Case', available: vehicle.transfer_case_service },
                            { label: 'Transaxle', available: vehicle.transaxle_service },
                          ].map((item) => (
                            <span key={item.label} className={`badge border ${
                              item.available
                                ? 'bg-[#c9a96e]/5 text-[#c9a96e] border-[#c9a96e]/20'
                                : 'bg-white/[0.02] text-slate-600 border-white/5'
                            }`}>
                              {item.available ? <CheckCircle2 className="w-3 h-3" /> : <XCircle className="w-3 h-3" />}
                              {item.label}
                            </span>
                          ))}
                        </div>
                      )}

                      {/* Oil Pricing */}
                      {!isElectric && !notServiceable && recommendedOils.length > 0 && (
                        <div className="pt-6 border-t border-white/10">
                          <div className="flex items-center justify-between mb-4 flex-wrap gap-3">
                            <div className="flex items-center gap-2">
                              <Gauge className="w-4 h-4 text-[#c9a96e]" />
                              <h5 className="text-[11px] font-medium text-slate-300 uppercase tracking-[0.15em]">Recommended Oil & Pricing</h5>
                            </div>
                            <label className="flex items-center gap-2 text-xs cursor-pointer">
                              <input type="checkbox" checked={mobil1Filter}
                                onChange={(e) => setMobil1Filter(e.target.checked)}
                                className="w-3.5 h-3.5 rounded-none border-white/20 bg-transparent text-[#c9a96e] focus:ring-0" />
                              <span className="text-slate-400 font-light">Mobil 1 Premium Filter (+$12)</span>
                            </label>
                          </div>
                          <div className="overflow-x-auto">
                            <table className="w-full text-sm">
                              <thead>
                                <tr className="text-left border-b border-white/10">
                                  <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Brand</th>
                                  <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Product</th>
                                  <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider">Viscosity</th>
                                  <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider text-right">Per Quart</th>
                                  <th className="py-3 pr-4 text-[10px] font-medium text-slate-500 uppercase tracking-wider text-right">Total ({vehicle.oil_capacity_quarts}qt)</th>
                                </tr>
                              </thead>
                              <tbody>
                                {recommendedOils.map((oil) => {
                                  const total = calculateOilCost(vehicle, oil) + (mobil1Filter ? 12 : 0);
                                  return (
                                    <tr key={oil.id} className="border-b border-white/5 hover:bg-white/[0.02] transition-colors">
                                      <td className="py-3 pr-4 text-white font-medium">{oil.brand}</td>
                                      <td className="py-3 pr-4 text-slate-400 font-light">{oil.product_line}</td>
                                      <td className="py-3 pr-4 text-slate-400 font-light">{oil.viscosity}</td>
                                      <td className="py-3 pr-4 text-right text-slate-300">${oil.price.toFixed(2)}</td>
                                      <td className="py-3 pr-4 text-right font-display text-lg text-[#c9a96e]">${total.toFixed(2)}</td>
                                    </tr>
                                  );
                                })}
                              </tbody>
                            </table>
                          </div>
                          <p className="text-[11px] text-slate-600 mt-3 font-light">
                            * Total reflects oil{mobil1Filter ? ' + Mobil 1 premium filter' : ''}. Standard filter and labor included. Final price confirmed at the shop.
                          </p>
                        </div>
                      )}

                      {isElectric && (
                        <div className="pt-6 border-t border-white/10">
                          <div className="bg-teal-950/20 border border-teal-800/30 p-4 flex items-center gap-3">
                            <CheckCircle2 className="w-5 h-5 text-teal-400 flex-shrink-0" />
                            <p className="text-sm text-teal-300 font-light">Electric vehicles don't require oil changes. We can help with other maintenance — contact us for details.</p>
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}

        {!searched && (
          <div className="max-w-3xl mx-auto">
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-6">
              {[
                { icon: Car, label: 'Sedans', count: vehicles.filter(v => v.body_type === 'Sedan').length },
                { icon: Car, label: 'SUVs', count: vehicles.filter(v => v.body_type === 'SUV').length },
                { icon: Truck, label: 'Trucks', count: vehicles.filter(v => v.body_type === 'Truck').length },
              ].map((item) => (
                <div key={item.label} className="card p-8 text-center hover:border-[#c9a96e]/20 transition-all">
                  <item.icon className="w-8 h-8 text-[#c9a96e] mx-auto mb-4" />
                  <div className="font-display text-3xl text-white">{item.count}+</div>
                  <div className="text-[11px] text-slate-500 uppercase tracking-wider mt-1">{item.label}</div>
                </div>
              ))}
            </div>

            <div className="mt-8 bg-amber-950/20 border border-amber-800/30 p-5 flex items-start gap-3">
              <AlertOctagon className="w-5 h-5 text-amber-500 flex-shrink-0 mt-0.5" />
              <p className="text-sm text-amber-200/80 font-light">
                <span className="font-medium">Note:</span> We cannot service any MINI Cooper — the exhaust covers the oil pan and filter, requiring dealership service.
              </p>
            </div>

            <div className="text-center mt-8">
              <p className="text-slate-500 text-sm font-light">
                Use the filters above to find your vehicle and see exact oil specs, drivetrain service availability, and pricing.
              </p>
              <button onClick={handleSearch} className="btn-ghost mt-6">
                Browse All Vehicles <ArrowRight className="w-4 h-4" />
              </button>
            </div>
          </div>
        )}
      </div>
    </section>
  );
}
