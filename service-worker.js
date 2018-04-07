// Version 0.6.5
self.addEventListener('install', e => {
  const timeStamp = Date.now();
  e.waitUntil(
    caches.open('stories').then(cache => {
      return cache.addAll([
        `/`,
        `/index.html`,
        `/style.css`,
        `/mobilstyle.css`,
      ])
          .then(() => self.skipWaiting());
    })
  );
});

self.addEventListener('activate', event => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request, {ignoreSearch: true}).then(response => {
      return response || fetch(event.request);
    })
  );
});