# A Eunicorn's World - Mobile Version

An interactive illustrated map experience where users guide an animated unicorn character across a hand-drawn seasonal map. Fully optimized for mobile devices with touch controls.

## Features

### Mobile Controls
- **Tap-to-Move**: Tap anywhere on the map to move the unicorn to that location
- **Pinch-to-Zoom**: Use pinch gestures to zoom in and out
- **Camera Following**: The camera automatically follows the unicorn as it moves
- **Season Selector**: Drag the slider at the bottom to change seasons

### Animations
- **Running Animation**: 8-frame animation when the unicorn is moving
- **Standing Animation**: 4-frame idle animation when stationary
- **Swimming Animation**: 4-frame animation when in water regions
- **Snow Effects**: Animated snowfall during winter season

### Session Persistence
- Anonymous session tracking with Supabase
- Saves unicorn position and current season
- Resumes from last position on return visit
- Debounced writes to minimize database calls

### Accessibility
- WCAG 2.5.5 compliant touch targets (minimum 44x44px)
- `prefers-reduced-motion` support for users who prefer less animation
- ARIA labels on interactive controls
- Single-pointer operable (WCAG 2.5.1)

### Responsive Design
- Optimized for phones (375px+)
- Tablet support up to 1024px
- Smooth performance on 4G connections
- No horizontal scroll or overflow

## Technical Stack

- **Frontend**: Vanilla JavaScript (ES modules)
- **Database**: Supabase (PostgreSQL)
- **Build Tool**: Vite
- **Styling**: Pure CSS with mobile-first approach

## Getting Started

### Prerequisites
- Node.js 16+
- npm or yarn

### Installation

1. Install dependencies:
```bash
npm install
```

2. Run development server:
```bash
npm run dev
```

3. Build for production:
```bash
npm run build
```

## Project Structure

```
.
├── index.html              # Main HTML file
├── mobile-app.js           # Main application logic
├── mobile-style.css        # Mobile-optimized styles
├── src/                    # Static assets
│   ├── images/            # Map images, sprites, UI elements
│   └── fonts/             # Custom fonts
└── dist/                  # Build output
```

## Features Implementation

### Tap-to-Move Navigation
The unicorn moves in a direct path to any tapped location on the map. Tapping a new destination while moving cancels the current path and starts routing to the new target.

### Camera System
The viewport follows the unicorn automatically, keeping it centered on screen. The camera respects map boundaries to prevent showing areas outside the map.

### Season System
Four seasonal map variants:
- Spring (slider values 1-25)
- Summer (slider values 26-50)
- Autumn (slider values 51-75)
- Winter (slider values 76-100)

All map images are preloaded for instant season switching.

### Water Detection
The unicorn automatically switches to swimming animation when entering water regions, which are defined as specific coordinate zones on the map.

## Performance Optimizations

- `requestAnimationFrame` for smooth animations
- Image preloading for instant season changes
- Debounced database writes (max once per 2 seconds)
- Efficient sprite frame management
- Touch event passive listeners where appropriate

## Browser Support

- iOS Safari 12+
- Chrome Mobile 80+
- Firefox Mobile 68+
- Samsung Internet 12+

## License

All artwork and design © Original Creator
