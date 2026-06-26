interface Props {
  currentLocale: string;
  base: string;
}

export function LanguageSwitcher({ currentLocale, base }: Props) {
  const isEn = currentLocale === 'en';
  const root = base === '/' ? '' : base;

  return (
    <div className="flex items-center gap-0.5 rounded-full border border-border p-1 text-xs font-medium">
      <a
        href={`${root}/`}
        className={`px-3 py-1 rounded-full transition-colors ${
          isEn ? 'bg-primary text-primary-foreground' : 'text-muted-foreground hover:text-foreground'
        }`}
      >
        EN
      </a>
      <a
        href={`${root}/pt-br/`}
        className={`px-3 py-1 rounded-full transition-colors ${
          !isEn ? 'bg-primary text-primary-foreground' : 'text-muted-foreground hover:text-foreground'
        }`}
      >
        PT-BR
      </a>
    </div>
  );
}
