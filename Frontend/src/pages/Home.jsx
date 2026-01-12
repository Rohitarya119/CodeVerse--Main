import { HeroSection } from "@/components/hero-section";
import { FeaturesSection } from "@/components/features-section";
import { CompaniesSection } from "@/components/companies-section";
import { CTASection } from "@/components/cta-section";
import { Footer } from "@/components/footer";
export default function HomePage() {
  return <div className="min-h-[calc(100vh-4rem)] bg-background animate-fade-in-up">
    <div>
      <HeroSection />
      <CompaniesSection />
      <FeaturesSection />
      <CTASection />
    </div>
    <Footer />
  </div>;
}
