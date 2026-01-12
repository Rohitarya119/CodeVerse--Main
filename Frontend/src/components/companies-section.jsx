export function CompaniesSection() {
  const companies = ["Google", "Amazon", "Microsoft", "Meta", "Apple", "Netflix", "Adobe", "Salesforce"];
  return <section className="border-y border-border bg-card/50 py-16">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <p className="mb-8 text-center text-sm text-muted-foreground">Prepare for interviews at top companies</p>
        <div className="flex flex-wrap items-center justify-center gap-8 md:gap-16">
          {companies.map((company, index) => <div
    key={company}
    className="text-xl font-semibold text-muted-foreground/60 transition-all duration-300 hover:text-primary hover:scale-110 cursor-pointer hover:-translate-y-1"
    style={{ animationDelay: `${index * 0.05}s` }}
  >
              {company}
            </div>)}
        </div>
      </div>
    </section>;
}
