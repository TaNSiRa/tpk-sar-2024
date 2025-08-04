'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "8cf8463b34caa8ac871a52d5dd7ad1ef",
".git/config": "7bdd934bcd31c07c3fc0d8dffed2e29c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "6ce801ae2bf6d862bbe58df4638728f1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a182cd7d44d4448cdaeea5f3100bbffa",
".git/logs/refs/heads/master": "a182cd7d44d4448cdaeea5f3100bbffa",
".git/logs/refs/remotes/origin/HEAD": "9cd6b20926e4993e71f343d09d6555f9",
".git/logs/refs/remotes/origin/master": "8b1fde9dd382f788f29a14fad00831d8",
".git/objects/11/fccf7b674768f002938d68709803d813861dd4": "00b423b4077684d6a3a6c34aea29a733",
".git/objects/12/241e50cba0f3f045c24fe1482cdccdaa7d3469": "dacb883b8dc92deeebc74a1343c63f6a",
".git/objects/13/2ea0682de2d8a65ed79105f4a8b8324c2c29b0": "96c42f6a8f14ab31499405459d919553",
".git/objects/18/4a79a60b56c28db8e406cccd909788eeaddde5": "1fc53079d9c30485dad2a04f7cf23c81",
".git/objects/23/0bf3346f1c46f283448aa083a848535f23000a": "f4e57ff08ae5a39a90cc5576579ebac9",
".git/objects/23/3ffd5437e34c466cbb2b0741c7263ba56df015": "d529ab71a5846809ca35af3b616dc9ea",
".git/objects/25/4362dbb7bbb65e32a338f2055b4ba34e3522ed": "d82b704b53fa8fd7af78f7112aaf4f8f",
".git/objects/25/f02d556af1692096953f62a8c211efaa24d332": "c4cdfb49a74123c08e5ea7f63412b8d8",
".git/objects/26/0976adaeacdf5b832dc35b0bada604a8810bd0": "49d916df8bad44d1a5e7273a6d20a5d6",
".git/objects/27/eb4538a11ab92040e85e30c476105eba2efa6c": "c729ffd37725325a00edb593dffb8207",
".git/objects/29/c9d08f2360a88b01d0a5658b49016d4d31e818": "4fc7344e898aa2ca81f4339f2e9e73e8",
".git/objects/2d/6d13bab8e1dd9c263f103ac274ac1d1e1b4bc9": "8d3c534972c56536269bd12ed2aa8fd5",
".git/objects/30/e43e092d27ca77742f9c1b549f3c8cd1d05c8f": "e4bf5c90a0f3417b42a6d9712c445880",
".git/objects/33/0170f045ba803cc62301e582df0bd2db8d9296": "1273e50e16f0a1c372c49d8e82f67e4b",
".git/objects/41/41e31f190fa4ac5bbb147e522c0bbf936ad1c2": "18c06b5ec318e0a503171b05fa2fd833",
".git/objects/49/53a9fa89f31eeb9730c3cb4fe786910c25e5d8": "c959352f79f73b6ffd64a0938bad645e",
".git/objects/4a/5ccbacf86af253d7460b3ab8c65fd970c71e5a": "edf01b9c770f08e310609391182eea8b",
".git/objects/4e/dda16f28e9626d7110026488f9c314e18640b2": "624e0252681f3e9ee1448b1bca512b2c",
".git/objects/54/6642139704fc01d17b441db5aa93bb65ea4216": "6dc12c41e50f61df61b9ce248e319a66",
".git/objects/55/d19578cb96a39e96380ced9495d254c9f2c022": "5c8ee5b6e60ecea0fc8f107e6c9ac091",
".git/objects/56/544865a9011b7de38a2f459a36ba585148503d": "a020571d48dd5728894af803df970701",
".git/objects/56/603be4df158693353c75a4f58110419b0e6dda": "e0e9c6291998ddfa6fec778c0b439320",
".git/objects/56/86ae86b70ae1e03c45bfc283ba83365e97f868": "1e933ffa8abb59c40d2ed26667759295",
".git/objects/57/3db49c4590f7693b95c15b5dfc5bc747ad44e8": "9b34ccc7981b922590e9bc60df1a4e61",
".git/objects/58/30569a5214901d0bcc0e4f34b8c360d721a2c8": "d99ab8bea1b600562afb2c8473bbf192",
".git/objects/5e/274edaa0761ca7113ac9180fbe55568e46d8f4": "d802d6fc0d1723d58fa79f5d25d55727",
".git/objects/5e/f504b1f03f500cd2717b5b6c8022611cefa420": "017cd8d13e12d3db50bb843103102a7f",
".git/objects/66/15d40b55fb8903f26542f298324e09bfc56dd6": "704c5a10c2d8d37dcbd2069f75c659b0",
".git/objects/68/63c12af93f24df40865bfe5593722aa6ff33cd": "715697817d232a114e4da155443a59b8",
".git/objects/6a/1e739aad55011bb1e82e2641f97535160571a1": "71229b5126d4fd02a07af0c38bab9868",
".git/objects/6a/8a217634ebbdcdbe862ae7a3d9e7216c813bce": "32519f096243fc60102493687eb4ea93",
".git/objects/6b/f3fa7059651a2bacded16f3c981c4c70cd6c4e": "f6ccf8abd7564afa9ffd80f3113c75c8",
".git/objects/6c/e4f941e4723e434cf7204b3b7d15eb13a5ecd0": "4a1861c38d337e003f5cfc8e71cc5dfe",
".git/objects/74/b065aee4df9ca7da9433be3f39d47b862a412d": "413e45d13363fc0040a4bd024aafd426",
".git/objects/78/3084ac21d0ac0905537c052cd5255141c07bb5": "4bb48cf9d5e59e301bf4b3759918f7fc",
".git/objects/7b/4d314ac58fbe660fc49d8adbc341328c8bd81c": "da25f99e15aaec231d7ae62d9c993b37",
".git/objects/81/c41a643fe4967feec1896e5fe03870bd1ae0ea": "084356cac9887349a0680f83e7f519f4",
".git/objects/82/0f61c32b8a21abf372c1bce93d73096ca7a4ed": "568cd0f6a02774dfd4deb20aa789baa6",
".git/objects/82/1931b5f30b1cffd42c4410b2c4344db7db295f": "9a9ee842262f4ed79c164f56833c6c16",
".git/objects/82/a088181696d3fee8d4aab8a6c40d2e758acd0e": "a5215955ff05f1f9afb350780414d56e",
".git/objects/83/400d20c069ddd4cdd722aa021dbaf3d0fa0f02": "c5392b54d5080fb12fe7c83a27342a33",
".git/objects/85/3692477008e62eff82c5203307fecb0fd5b1a5": "d0beaa7997cc56f78a3a0301fbb32abd",
".git/objects/85/ada897196791aed78a637b8f017b387149ed9b": "d51cf29490ad921363ef03439a3dfaad",
".git/objects/88/77e13c0f0e73df112cf6bf9da3b888dd181e67": "438967aaf82a2ea127667810d0cfd9f3",
".git/objects/8a/e03a862d2f69123196b4f89dedde709a1b7c5e": "68d4c5a9ff900c42d26b3e6a2e417be1",
".git/objects/8d/f46951a8e10dbfb58cfd10f14daa7fb7d3d6a1": "7556ffa39aedaf70736d6fb6aa01b5a8",
".git/objects/91/be17b5fda98323219f5e89be60412b18a98001": "d4c915582f213b197a619998eb96cef9",
".git/objects/97/0e246edc45df2350d7e2ea8d6a1341232a0c9b": "73c84e2890496dcbb05ed4c76d3df482",
".git/objects/99/5146925bfe429666d79a08835666710fae8afe": "aab70aa0b92b972b73db0c624b83b10d",
".git/objects/9a/ac6b2066f548254db0bfbf4d9c2708cd36af70": "14a4833edd4724463f3e72d8ddc06c3e",
".git/objects/9c/aa28d06f357ef566e0c9dff992e404819d7c35": "26ee1c6dec3dd14dfe90ee61920e8eea",
".git/objects/a1/4ee1eeb411f4359e592d7a861cb442da384d57": "a70f50246d605079dd1f6dec558e514f",
".git/objects/ab/8a699b08d80e1bf3290b4d078ba96b17ab193e": "b34eecfbed7dc85eff3a3a73a21d9a03",
".git/objects/b7/a064c79b446b2c8921f5bcb480c14daa910ceb": "b44506bf4d46e22466e43eb651342cf3",
".git/objects/b8/c6054ba74ba39c887e1b86adac8f3da46be74f": "f3f94a4e1bdd218677b0df898eb82cff",
".git/objects/ba/37b40069021175dc6feab4a9de544238e77932": "939d91697bc782452342453d89ab7a8f",
".git/objects/bd/041290acff78b9abfb208e86c48549ab6a6e68": "3568fcd41ceb6aaec9bbde96c2f05ccf",
".git/objects/be/6472c24620703f5421102cd1774f7a1972d39a": "dc9eaed99cf99381eb8d9361a1b031e9",
".git/objects/c3/a8992588ab5769fcf9ca3848004eebe8fa6ca9": "8f76736dfcfbe9325234db72a6ccdd05",
".git/objects/c7/f392c667507770bd0da6c710c302858c4dfe15": "7fd1c569d56a50dd98bf9a5eedbe7863",
".git/objects/cb/d6894de97f9498d4d287ca6f5a6761dba5ff13": "0f32add9e19628554960950ea0453ffd",
".git/objects/d4/cc6b062f38946e119494becc81f29fdecd45e0": "a2decd01b5769374fb38a518b09002ff",
".git/objects/d4/e9964db40de6b34b66cf4a8007f9a0d5ca31b7": "a9afb6a8ce661bec390cd722ebb30add",
".git/objects/d5/53a8e254719815713c7985f7bdbc63e47f4a63": "cc1c85e01a1f5ece05e27dff211b819f",
".git/objects/d5/910c20a644063b81e33d5015a4c17b511770f3": "759002a4ba39de939abe9ce4265dea96",
".git/objects/d6/ff2512001e37fb3d9ce6b08f70d5c45c1de1ee": "928dbbde3017577c5cb0d9788d081268",
".git/objects/d9/b7c1f93e5a4a500f18e40a6d970e50703301b6": "5fa1c1bff68e214c3d4072d2cda38573",
".git/objects/da/3ddcb5e17001ffdea5bb7864a7d77dc55011af": "f620d3b19c82ec0c910bb40828237ffd",
".git/objects/dc/065394858434a8b6e976d37f80b2290d79083a": "2d8611466827fc4ac5c3affcdbb48ec4",
".git/objects/de/b9203a8910e9d24aed2814f251cbb2d867a2f9": "b0472daffe19d199d7a6d54b44454deb",
".git/objects/df/56ec9604fb76e4a5bec4973d800182cd331488": "651bc52bb990255f79192d7abff30afa",
".git/objects/e0/5a0178fc12d3b80e928aaa80e91ace474537e0": "9fc84a1a51ca4c75b44c69c57e41e871",
".git/objects/e0/ae5452da8232bbb8aa084002111206e8b4c185": "071b4ea98c63149f76ae5f2c3c9f15ef",
".git/objects/e3/fd1ac0b19b74c9f5f6e90f95d9de4f47706206": "6b423cf1cb37f298183f038cbe6d9523",
".git/objects/e5/45805fdffe6728467c65e73eb5016dc6ba7f70": "00af05b6f2b446f631f20916a4c08256",
".git/objects/e5/bbefbf71bb12c8910c52bf24b0469a4a5b8b46": "8407baf555891918cb359553f529550f",
".git/objects/e8/89245b1cc6b9eeaba7fcccd2efa1a2bbc0c252": "4a354060f94a58e37ff7376ee99ecddc",
".git/objects/ea/2da70a67b73e200f35bea951bf376beee644b0": "9e5b645df38aaeb846916282a784a45a",
".git/objects/ef/ea1c86cbd84bbd67a255e1b4f731d1db5abae2": "db4c7b4bbd00c501570d6f0d65a25462",
".git/objects/f2/0468f4cf15f4734d8154b907a4ec19a0f9854c": "916279402d821ddac8b2c2a2c270893f",
".git/objects/f3/764524b3c226dbd14a21026d92ba14cc8fe68d": "920cc88ae5d520e727529f5d6088bc27",
".git/objects/f4/f5fb513c9cc8361a2f128c6afcc069c892b378": "b4ac22bfcd256ca2de67b2c78dd67296",
".git/objects/fa/f27c18cc48e869059c6c457006382402c50971": "b56ac31ef87a1465c3e0f087c9e8a5bb",
".git/objects/pack/pack-f8664f7a45fba3d33aa62eccc49227fd47ac2851.idx": "9cb2cf935779dfa7d78ca90fc27d9f87",
".git/objects/pack/pack-f8664f7a45fba3d33aa62eccc49227fd47ac2851.pack": "3f5376c62d19690b731f626456d1797b",
".git/objects/pack/pack-f8664f7a45fba3d33aa62eccc49227fd47ac2851.rev": "1c547b7d513a9efd155f6f19af8d65fd",
".git/packed-refs": "edf1c3f9ed7dda59ee760ec4eab4af1a",
".git/refs/heads/master": "94f0447362ea50b53f76fa7c19ace659",
".git/refs/remotes/origin/HEAD": "73a00957034783b7b5c8294c54cd3e12",
".git/refs/remotes/origin/master": "94f0447362ea50b53f76fa7c19ace659",
".vscode/settings.json": "63f9a30b2c173d1ed4340d350de6e802",
"assets/AssetManifest.bin": "b00f52fa7d51d2b280ab2954a861cbfe",
"assets/AssetManifest.json": "9b9aace3a3edade3dcf520b48c8d1140",
"assets/assets/icons/icon-notifications.png": "01e90e91bd50b2eb166784bac884b7e3",
"assets/assets/images/logo_tpk.png": "6c5e90f3a6d7793651ae96a21318a911",
"assets/assets/images/nosample.png": "2ca47899805df7514ed21acff67c2846",
"assets/assets/images/notsendsample.png": "a73dba07c506d97288bf77b0a57cca1c",
"assets/assets/images/receivedsample.png": "d2d52279c1378d2f32119c721c57491c",
"assets/assets/images/rejectsample.png": "3915e834cb0b230cbc27932248a32867",
"assets/assets/images/SampleSEM.png": "fab8e7f733ce31bbe0c354b58adbfbee",
"assets/assets/images/sendsample.png": "c9bc9a6a0a611f24c2de8c58521f5937",
"assets/assets/images/waitsample.png": "796dffdad2fd5619824cc81b134f6ebc",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2a032c418f60b1bfb0f3feebd86a3e6e",
"assets/NOTICES": "6c64a9398c80a16a4c1a61ac8432a31f",
"assets/packages/cool_alert/assets/flare/error_check.flr": "d9f54791d0d79935d22206966707e4b3",
"assets/packages/cool_alert/assets/flare/info_check.flr": "f6b81c2aa3ae36418c13bfd36d11ac04",
"assets/packages/cool_alert/assets/flare/loading.flr": "b6987a8e6de74062b8c002539d2d043e",
"assets/packages/cool_alert/assets/flare/success_check.flr": "9d163bcc6f6b58566e0abde7761a67a0",
"assets/packages/cool_alert/assets/flare/warning_check.flr": "ff4a110b8d905dedb4d4639a17399703",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fe3f6650de53b86368398ea1ca5cb01c",
"/": "fe3f6650de53b86368398ea1ca5cb01c",
"main.dart.js": "d7187dfe089d09bd46e4ca825faa5cc8",
"manifest.json": "920749f91f0b5bc9b802afac26573b9e",
"version.json": "51b84a0988b0aeadc54f37dc103d2bbe"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
