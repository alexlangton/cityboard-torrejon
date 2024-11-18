<template>
  <div class="card">
    <h5>Test de Conexión API</h5>
    <Button label="Probar Conexión Backend" @click="testApi" :loading="loading" />
    
    <div v-if="response" class="mt-3 text-green-500">
      {{ response }}
    </div>
    
    <div v-if="error" class="mt-3 text-red-500">
      {{ error }}
    </div>
    
    <div v-if="fullResponse" class="mt-3">
      <pre class="text-sm bg-gray-100 p-3 rounded">{{ fullResponse }}</pre>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';

const loading = ref(false);
const response = ref('');
const error = ref('');
const fullResponse = ref(null);

const testApi = async () => {
  loading.value = true;
  try {
    console.log('Iniciando petición a /api/test');
    const result = await axios.get('/api/test');
    console.log('Respuesta recibida:', result);
    
    response.value = result.data.message;
    fullResponse.value = JSON.stringify(result.data, null, 2);
  } catch (err) {
    console.error('Error en la petición:', err);
    error.value = `Error: ${err.message}`;
    if (err.response) {
      fullResponse.value = JSON.stringify(err.response.data, null, 2);
    }
  } finally {
    loading.value = false;
  }
};
</script>

<style scoped>
.card {
  padding: 2rem;
  border-radius: 10px;
  background-color: var(--surface-card);
}

pre {
  white-space: pre-wrap;
  word-wrap: break-word;
}
</style> 