### Flutter app + Cloudflare Worker

This project explores how we can make Flutter app more dynamic using Remote Flutter Widgets library.

┌─────────────────┐                   ┌──────────────────┐
│                 │                   │                  │
│                 │                   │                  │
│                 │    Splash screen  │                  │
│   Flutter app   ├─────────────────► │   Cloudflare     │
│                 │                   │                  │
│ ┌─────────────┐ │                   │   Wasm Worker    │
│ │ Widgets lib │ │ ◄──────────────── │                  │
│ └─────────────┘ │   Screen layouts  │                  │
└─────────────────┘                   └──────────────────┘
