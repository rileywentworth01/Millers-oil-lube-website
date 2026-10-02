import { useEffect, useState } from 'react';
import { TrendingUp, TrendingDown } from 'lucide-react';
import { supabase, type OilPriceAlert } from '@/lib/supabase';

export default function OilPriceBanner() {
  const [alert, setAlert] = useState<OilPriceAlert | null>(null);

  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase
          .from('oil_price_alerts')
          .select('*')
          .eq('active', true)
          .order('created_at', { ascending: false })
          .limit(1)
          .maybeSingle();
        if (error) throw error;
        setAlert(data);
      } catch {
        setAlert(null);
      }
    })();
  }, []);

  if (!alert) return null;

  const isUp = alert.direction === 'up';

  return (
    <div className={`relative overflow-hidden ${isUp ? 'bg-red-950/80' : 'bg-emerald-950/80'} border-y border-white/10`}>
      <div className="section-padding py-3 flex items-center justify-center gap-4 flex-wrap">
        <div className="flex items-center gap-2">
          {isUp ? <TrendingUp className="w-4 h-4 text-red-400 animate-flash-pulse" /> : <TrendingDown className="w-4 h-4 text-emerald-400 animate-flash-pulse" />}
          <span className="font-display text-xl font-semibold animate-flash-pulse text-white">
            {isUp ? '+' : '-'}{alert.percentage.toFixed(1)}%
          </span>
        </div>
        <div className="w-px h-4 bg-white/20" />
        <span className="text-xs font-light text-slate-300 tracking-wide">{alert.message}</span>
      </div>
    </div>
  );
}
