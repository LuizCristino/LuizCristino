import en from './en.json';
import ptBr from './pt-br.json';

const translations = {
  en,
  'pt-br': ptBr,
} as const;

export type Locale = keyof typeof translations;
export type Translations = typeof en;

export const locales: Locale[] = ['en', 'pt-br'];
export const defaultLocale: Locale = 'en';

export function useTranslations(locale: string): Translations {
  const lang = (locale in translations ? locale : defaultLocale) as Locale;
  return translations[lang] as Translations;
}
