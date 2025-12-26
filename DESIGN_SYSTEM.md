# Travel Document Vault - Dark Glass Design System

## 1. Color Palette

### Primary Brand Colors
- **Brand Blue**: `#003A87` (Deep Trust Blue)
- **Brand Gold**: `#FFB000` (Premium Accent)
- **Brand Gold Hover**: `#E69F00` (Interaction State)

### Neutrals (Dark Mode)
- **Background Deep**: `#050B14` (Void Black)
- **Background Mid**: `#0A192F` (Navy Slate)
- **Background Top**: `#1E3A8A` (Blue 900 - Gradient Start)
- **Text Primary**: `#FFFFFF` (White)
- **Text Secondary**: `#E2E8F0` (Slate 200)

## 2. Gradient Backgrounds
**Global Radial Gradient**:
`bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-blue-900 via-[#0a192f] to-[#050b14]`

## 3. Glassmorphism Effects (CSS)

### Glass Card (Floating Elements)
```css
.glass-card {
  background: rgba(17, 25, 40, 0.6);        /* Dark Navy with 60% opacity */
  backdrop-filter: blur(12px);               /* Heavy frost effect */
  -webkit-backdrop-filter: blur(12px);       /* Safari support */
  border: 1px solid rgba(255, 255, 255, 0.08); /* Subtle white border */
  box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.2);
}
```

### Glass Panel (Static Containers)
```css
.glass-panel {
  background: rgba(17, 25, 40, 0.6);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.08); /* Subtle white border */
}
```

### Hover State (Cards)
```css
.glass-card:hover {
  background: rgba(22, 33, 50, 0.7);         /* Slightly lighter/more opaque */
  border-color: rgba(255, 255, 255, 0.15);   /* Brighter border */
  transform: translateY(-2px);               /* Lift effect */
  box-shadow: 0 10px 40px -10px rgba(0,0,0,0.5);
}
```

## 4. Typography
- **Font Family**: "Plus Jakarta Sans", system-ui, sans-serif
- **Headings**: Bold (`700`) or Semibold (`600`) with `tracking-tight`
- **Body**: Regular (`400`) or Medium (`500`)
