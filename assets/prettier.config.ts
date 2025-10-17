import type { Config } from "prettier"

const config: Config = {
  printWidth: 98,
  tabWidth: 2,
  semi: false,
  singleQuote: false,
  trailingComma: "all",
  quoteProps: "consistent",
  bracketSpacing: true,
  arrowParens: "always",
  singleAttributePerLine: false,
  plugins: ["prettier-plugin-tailwindcss"],
  tailwindFunctions: ["clsx", "cn"],
  tailwindStylesheet: "src/css/app.css",
}

export default config
