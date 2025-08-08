// Cache the promise to avoid creating a new one on every render
let healthPromise = null

export function useHealthStatus() {
  if (!healthPromise) {
    healthPromise = fetchHealthStatus()
  }
  return healthPromise
}

async function fetchHealthStatus() {
  try {
    // Use the configured API URL from environment
    const API_URL = import.meta.env.VITE_API_URL || 'https://obscure-barnacle-7vgwr7px5jvcrj4p-8000.app.github.dev'
    const response = await fetch(`${API_URL}/api/health`)
    if (!response.ok) return { status: 'error' }
    const data = await response.json()
    return data
  } catch (error) {
    return { status: 'error', message: error.message }
  }
}
