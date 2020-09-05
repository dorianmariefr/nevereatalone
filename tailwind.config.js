module.exports = {
  purge: {
    enabled: true,
    content: [
      './app/views/**/*.html.slim',
      './app/helpers/**/*.rb',
    ],
  },
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [],
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
  }
}
