<template>
    <div>
        <p 
            v-for="(product, index) in products" 
            :key="index">
        {{product.name}}</p>
    </div>
</template>

<script>
import ProductList from './products.vue';
import eventBus from '../packs/eventBus.js';
export default {
    data: function () {
        return {
            products: []
        }
    },
    created: function () {
        eventBus.$on('add-to-cart', (product) => {
            this.products.push(product);
        });
    }
}
</script>
