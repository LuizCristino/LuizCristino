import { useState, useEffect } from 'react';
import { Sun, Moon, Monitor } from 'lucide-react';

type Theme = 'auto' | 'light' | 'dark';

const cycleOrder: Theme[] = ['auto', 'light', 'dark'];

function applyTheme(theme: Theme) {
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  const isDark = theme === 'dark' || (theme === 'auto' && prefersDark);
  document.documentElement.classList.toggle('dark', isDark);
}

export function ThemeToggle() {
  const [theme, setTheme] = useState<Theme>('auto');
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    const stored = (localStorage.getItem('theme') as Theme) || 'auto';
    setTheme(stored);

    const mq = window.matchMedia('(prefers-color-scheme: dark)');
    const handleSystem = () => {
      if ((localStorage.getItem('theme') || 'auto') === 'auto') applyTheme('auto');
    };
    mq.addEventListener('change', handleSystem);
    return () => mq.removeEventListener('change', handleSystem);
  }, []);

  if (!mounted) return <div className="w-8 h-8" />;

  function cycle() {
    const idx = cycleOrder.indexOf(theme);
    const next = cycleOrder[(idx + 1) % cycleOrder.length];
    setTheme(next);
    localStorage.setItem('theme', next);
    applyTheme(next);
  }

  const label = theme === 'auto' ? 'Auto' : theme === 'light' ? 'Light' : 'Dark';

  return (
    <button
      onClick={cycle}
      aria-label={`Theme: ${label} — click to cycle`}
      title={`Theme: ${label}`}
      className="flex items-center justify-center w-8 h-8 rounded-md text-muted-foreground hover:text-foreground hover:bg-muted transition-colors"
    >
      {theme === 'light' ? <Sun size={15} /> : theme === 'dark' ? <Moon size={15} /> : <Monitor size={15} />}
    </button>
  );
}
