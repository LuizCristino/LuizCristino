import { useState, useEffect } from 'react';

interface TypeWriterProps {
  roles: string[];
}

export function TypeWriter({ roles }: TypeWriterProps) {
  const [text, setText] = useState(roles[0]);
  const [roleIndex, setRoleIndex] = useState(0);
  const [isDeleting, setIsDeleting] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => { setMounted(true); }, []);

  useEffect(() => {
    if (!mounted) return;
    const current = roles[roleIndex % roles.length];
    const timeout = setTimeout(
      () => {
        if (!isDeleting && text === current) {
          setTimeout(() => setIsDeleting(true), 2000);
          return;
        }
        if (isDeleting && text === '') {
          setIsDeleting(false);
          setRoleIndex((i) => (i + 1) % roles.length);
          return;
        }
        setText(isDeleting ? current.slice(0, text.length - 1) : current.slice(0, text.length + 1));
      },
      isDeleting ? 40 : 80
    );
    return () => clearTimeout(timeout);
  }, [text, roleIndex, isDeleting, mounted, roles]);

  return (
    <span>
      <span className="text-primary">{text}</span>
      <span className="animate-pulse text-primary">|</span>
    </span>
  );
}
