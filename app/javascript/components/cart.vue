<template>
    <div>
        <p class="title">Cart</p>
        <p
            v-if="!products.length"
        >No items in your cart! Add one!
        </p>
        <p 
            v-else
            v-for="(product, index) in products" 
            :key="index">
        {{product.name}}</p>
    </div>
</template>

<script>
import ProductList from './products.vue';
import eventBus from '../packs/eventBus.js';
import cartApi from '../CartApi.js';
export default {
    data: function () {
        return {
            products: []
        }
    },
    created: function () {
        eventBus.$on('add-to-cart', async (product) => {
            this.products.push(product);
            await cartApi.addToCart(this.products[this.products.length -1]);
        });
        this.getItems();
    },
    methods: {
        getItems: async function () {
            this.products = await cartApi.getCart() || [];
            console.log(await cartApi.getCart());
        }
    }
}
</script>
