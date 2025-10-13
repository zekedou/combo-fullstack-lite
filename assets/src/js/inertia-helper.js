// An Inertia helper for resolving page component.
//
// # Usage
//
// Use it in the `resolve` function.
//
// ## Resolve page component
//
//     createInertiaApp({
//       // ...
//       resolve: (name) =>
//         resolvePageComponent(
//           `./pages/${name}.jsx`,
//           import.meta.glob("./pages/**/*.jsx", { eager: true }),
//         ),
//     })
//
// ## Resolve page component with a fallback name
//
//     createInertiaApp({
//       // ...
//       resolve: (name) =>
//         resolvePageComponent(
//           `./pages/${name}.jsx`,
//           import.meta.glob("./pages/**/*.jsx", { eager: true }),
//           { fallbackName: "./pages/404.jsx" },
//         ),
//     })
//
export async function resolvePageComponent(name, pages, options) {
  if (typeof pages[name] === "undefined" && options?.fallbackName) {
    name = options.fallbackName
  }

  const page = pages[name]

  if (typeof page !== "undefined") {
    // When code spiltting is enabled, page is a function.
    // Or, page is an object.
    return typeof page === "function" ? page() : page
  } else {
    throw new Error(`Page not found: ${name}`)
  }
}
