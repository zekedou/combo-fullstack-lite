import "vite/modulepreload-polyfill"

import "@fontsource-variable/inter"
import "./app.css"

import { createInertiaApp } from "@inertiajs/react"
import { StrictMode } from "react"
import { createRoot, hydrateRoot } from "react-dom/client"
import { resolvePageComponent } from "./inertia-helper"

import axios from "axios"
axios.defaults.xsrfHeaderName = "x-csrf-token"

const appName = "MyApp"

function ssr_mode() {
  return document.documentElement.hasAttribute("data-ssr")
}

createInertiaApp({
  title: (title) => (title ? `${title} - ${appName}` : appName),
  resolve: (name) =>
    resolvePageComponent(
      `./pages/${name}.tsx`,
      import.meta.glob("./pages/**/*.tsx", { eager: true }),
    ),
  setup({ el, App, props }) {
    if (ssr_mode()) {
      hydrateRoot(el, <App {...props} />)
    } else {
      createRoot(el).render(
        <StrictMode>
          <App {...props} />
        </StrictMode>,
      )
    }
  },
  progress: {
    color: "#F6472F",
  },
})
