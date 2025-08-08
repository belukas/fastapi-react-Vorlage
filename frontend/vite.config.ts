import path from "path"
import react from "@vitejs/plugin-react"
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite"

export default defineConfig({
  plugins: [react(), tailwindcss()],
  server: {
      host: '0.0.0.0',
      port: 5173,
      watch: {
        usePolling: true
      }
  },
  build: {
    rollupOptions: {
      output: {
        // Add hash to filenames for cache busting
        entryFileNames: `assets/[name].[hash].js`,
        chunkFileNames: `assets/[name].[hash].js`,
        assetFileNames: `assets/[name].[hash].[ext]`
      }
    }
  },
  resolve: {
    alias: {
      "@": path.resolve("./src"),
    },
  },
})
