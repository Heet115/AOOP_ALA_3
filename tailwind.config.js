/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./**/*.{jsp,html,js}",
  ],
  theme: {
    extend: {
      colors: {
        primary: '#9FB3DF',
        'primary-dark': '#8A9FCA',
        secondary: '#9EC6F3',
        accent: '#BDDDE4',
        background: '#FFF1D5',
        'text-dark': '#2B4C7E',
        'text-light': '#445566',
        danger: '#ef4444',
        success: '#38a169',
        warning: '#dd6b20',
      },
      spacing: {
        '1': '0.25rem',
        '2': '0.5rem',
        '3': '0.75rem',
        '4': '1rem',
        '5': '1.25rem',
        '6': '1.5rem',
        '8': '2rem',
        '10': '2.5rem',
        '12': '3rem',
      },
      borderRadius: {
        'sm': '0.25rem',
        'md': '0.375rem',
        'lg': '0.5rem',
        'xl': '0.75rem',
      },
      boxShadow: {
        'sm': '0 1px 2px 0 rgba(0, 0, 0, 0.05)',
        'md': '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
        'lg': '0 10px 15px -3px rgba(0, 0, 0, 0.1)',
        'xl': '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
      },
    },
  },
  plugins: [],
} 