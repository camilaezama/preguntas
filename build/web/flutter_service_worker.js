'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9a30d9d84ae6507783579b9b7249c8a6",
"assets/AssetManifest.bin.json": "79d5f8babd2f40f81956bd31d1ff7aeb",
"assets/AssetManifest.json": "8144c917cfd8e01db5a9243341e3b376",
"assets/assets/ak1.jpg": "673e0397624cd2ef439480aa414a5bce",
"assets/assets/ak2.jpg": "f41b37f6468ad0d181f35f26a51ba463",
"assets/assets/camilo.jpg": "d19dba284b7b809f0f46a702f2164fc0",
"assets/assets/carilo2021-2.jpg": "3f27f60aeb92e0e3fd19ef776f2657c8",
"assets/assets/carilo2021.jpg": "fc88c1ce65be744c5a172cc3779cca1a",
"assets/assets/chile-comida.jpg": "37d3318701e8bb83c1ad99655f272000",
"assets/assets/chile-nieve.jpg": "faaa63226151ddc151cf73680faffd57",
"assets/assets/chile1.jpg": "eae36ad62a2d4d3e2343e4de0ade0bef",
"assets/assets/cordoba1.jpg": "3154843607a7a84cdbb4a1ed0b7dd367",
"assets/assets/cordoba2.jpg": "83ff6fe7b7ed4fe6de69fab243eca2a7",
"assets/assets/correct_answer.jpg": "18354ebf4945a231f3b9c8c8758a4553",
"assets/assets/ep1.jpg": "ed08be17caa5a1367a3fb8f1505678ce",
"assets/assets/ep2.jpg": "a5704647243023310a135f444bf6da1e",
"assets/assets/epcot.jpg": "e14ef1867545082436838dcd06e49288",
"assets/assets/everest1.JPG": "ac712b01916d107b943d94c8634068d4",
"assets/assets/everest2.jpg": "a77f7e0547528228f3a99e6f2df56319",
"assets/assets/francia_final.jpg": "cd718d31b4d5c8f5272c75f89031bd3f",
"assets/assets/goles_messi.jpg": "e240a790070ff3df922d0101985bb2fb",
"assets/assets/holly1.jpg": "aebf1cc1a55868c9ce92753049cc58ce",
"assets/assets/holly2.jpg": "c24268b7db4857c55e743b7e58b243f4",
"assets/assets/incorrect_answer.jpg": "2e0f1b06a36926810b6fdcd3630b423b",
"assets/assets/jani.jpg": "b000e18234bffa5782353f2ab5d316b7",
"assets/assets/jani2022.jpg": "1945a504445d6720c3acdb9b7dd5e1e8",
"assets/assets/linda1.jpg": "4c59cd4ddf2d803b7759feb4daa9ab2f",
"assets/assets/linda2.jpg": "6b183b37f9ab1396a7538facd3862315",
"assets/assets/linda2021.jpg": "38eaa0d517891e05bdd75b9a84bd5e24",
"assets/assets/linda3.jpg": "7f76b823414866f5ccf085bc9419cc6d",
"assets/assets/meli.jpg": "7451af2dade6dbbff0063c6a97ff1c38",
"assets/assets/miramar.jpg": "2b3ac8f45c919127fb160fec33492b0c",
"assets/assets/miramar2.jpg": "50f68a0fd4f06d3e86cf6df7081644ee",
"assets/assets/miramar3.jpg": "90eb12ea325660e75c4def51c6d79314",
"assets/assets/mk1.jpg": "0122db6484e9553bb8eccdcbdc5309dc",
"assets/assets/mk2.jpg": "ce00f9a0f11cca90efb7809b09eef80f",
"assets/assets/mural1.jpg": "fbe8347643aa7107d7ebce7b20e13f25",
"assets/assets/mural2.jpg": "f882985b2e24ca9f3d057676109b1dff",
"assets/assets/recel.jpg": "6c6feea8cb521f5b60da0fc265bf8b5a",
"assets/assets/san-cristobal.jpg": "24cde3de703d9ed31bfa498b796f2c79",
"assets/assets/sl.jpg": "54ddc0fd5fb73eabf55ad8f23e4c03bf",
"assets/assets/sl2.jpg": "1393d5959facae369e2e7b65e42cf870",
"assets/assets/val1.jpg": "e20f753b6f0cd277e718d9aa13d0853c",
"assets/assets/val2.jpg": "d94f684677e91c56c0ed6b3ea8551ea0",
"assets/assets/val3.jpg": "fc6e3535f8f846d84644bb3000134a17",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "9ebfc6bfa04506ca078a0099895c0174",
"assets/NOTICES": "322470163d109ea19c110d7a7e90d67d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "c0b92a5f754ccfc14bc8a77bef8189d1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "bc0533fce11657b7f41923a9a4303072",
"/": "bc0533fce11657b7f41923a9a4303072",
"main.dart.js": "8d879e938620f74679ea2be59ca8e672",
"manifest.json": "8f1dcaca2dd993d69e4589f59b1f96bc",
"version.json": "798924cc54bc9cd36dff7130f1d24ce4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
