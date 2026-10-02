import Header from '@/components/Header';
import Hero from '@/components/Hero';
import OilPriceBanner from '@/components/OilPriceBanner';
import VehicleLookup from '@/components/VehicleLookup';
import OilProducts from '@/components/OilProducts';
import Services from '@/components/Services';
import About from '@/components/About';
import Contact from '@/components/Contact';
import Footer from '@/components/Footer';

function App() {
  return (
    <div className="min-h-screen bg-[#0a0e1a]">
      <Header />
      <main>
        <Hero />
        <OilPriceBanner />
        <VehicleLookup />
        <OilProducts />
        <Services />
        <About />
        <Contact />
      </main>
      <Footer />
    </div>
  );
}

export default App;
