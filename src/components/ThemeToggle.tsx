import { useState, useEffect } from 'react';
import { Sun, Moon, Monitor, Check } from 'lucide-react';
import {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuItem,
} from './ui/dropdown-menu';

type Theme = 'auto' | 'light' | 'dark';

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

  function select(next: Theme) {
    setTheme(next);
    localStorage.setItem('theme', next);
    applyTheme(next);
  }

  const TriggerIcon = theme === 'light' ? Sun : theme === 'dark' ? Moon : Monitor;

  if (!mounted) return <div className="w-8 h-8" />;

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <button
          aria-label="Toggle theme"
          className="flex items-center justify-center w-8 h-8 rounded-md text-muted-foreground hover:text-foreground hover:bg-muted transition-colors"
        >
          <TriggerIcon size={15} />
        </button>
      </DropdownMenuTrigger>

      <DropdownMenuContent align="end">
        <DropdownMenuLabel>Theme</DropdownMenuLabel>
        <DropdownMenuSeparator />

        <DropdownMenuItem onClick={() => select('light')}>
          <Sun size={14} className="text-muted-foreground" />
          <span className="flex-1">Light</span>
          {theme === 'light' && <Check size={13} className="text-primary" />}
        </DropdownMenuItem>

        <DropdownMenuItem onClick={() => select('dark')}>
          <Moon size={14} className="text-muted-foreground" />
          <span className="flex-1">Dark</span>
          {theme === 'dark' && <Check size={13} className="text-primary" />}
        </DropdownMenuItem>

        <DropdownMenuItem onClick={() => select('auto')}>
          <Monitor size={14} className="text-muted-foreground" />
          <span className="flex-1">System</span>
          {theme === 'auto' && <Check size={13} className="text-primary" />}
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
