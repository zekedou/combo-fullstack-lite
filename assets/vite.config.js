import { defineConfig } from "vite"
import combo from "vite-plugin-combo"
import tailwindcss from "@tailwindcss/vite"

export default defineConfig({
  plugins: [
    combo({
      input: ["src/css/app.css", "src/js/app.js"],
      staticDir: "../priv/static",
    }),
    tailwindcss()
  ],
})
