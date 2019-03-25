<template>
    <div>
        <p class="title">Cart</p>
        <p
            v-if="!products.length"
        >No items in your cart! Add one!
        </p>
        <div 
            v-else
            v-for="(product, index) in products" 
            :key="index"
        >
            <p>
            {{product.name}}</p>
            <p>{{product.quantity}}</p>
            <button
                class="button is-danger"
                style="display: inline"
                @click="removeOne(product, index)"
            >-</button>
            <button
                class="button is-danger"
                style="display: inline"
                @click="removeProduct(product)"
            >X</button>
        </div>
        <button
            v-if="products.length !== 0"
            class="button is-danger"
            @click="clearCart"
        >Clear Cart
        </button>
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
            this.addToCart(product);
        });
        this.getItems();
    },
    methods: {
        getItems: async function () {
            this.products = await cartApi.getCart() || [];
        },
        clearCart: async function () {
            this.products = [];
            cartApi.clearCart();
        },
        removeProduct: async function (product) {
            this.products = this.products.filter(o => o.id !== product.id);
            await cartApi.removeFromCart(product);
        },
        removeOne: async function (product, index) {
            product.quantity = product.quantity - 1;
            if (product.quantity === 0) {
                this.removeProduct(product);
            }
            else {
                this.products[index] = product;
                await cartApi.reduceProduct(product);
            }
        },
        addToCart: async function (product) {
            let prodIndex = this.products.findIndex(o => o.id === product.id);
            console.log(prodIndex);
            if (prodIndex === -1) {
                this.products.push({
                    "id": product.id,
                    "name": product.name,
                    "quantity": 1,
                    "price": product.price});
                await cartApi.addToCart(product);
            }
            else {
                product.quantity = product.quantity + 1;
                if (product.quantity === 0) {
                    this.removeProduct(product);
                }
                else {
                    this.products[prodIndex] = product;
                    await cartApi.increaseProduct(product);
                    this.getItems();
                }
            }
        }
    }
}
</script>
