<template>
    <div class="tile is-parent is-3">
        <div class="tile is-child box">
            <div
                v-if="link"
                >
                <router-link
                    :to="{name: 'product', params: {id: product.id}}"
                >
                    <img 
                        v-bind:src="product.image"
                    >
                </router-link>
            </div>
            <img 
                v-else
                v-bind:src="product.image"
            >
            <div class="text is-offset-5">
                <p class="sub-title">{{ product.name }}</p>
                <button
                    class="button is-success"
                    @click="addToCart"
                >Add to Cart</button>
            </div>
        </div>
    </div>
</template>

<script>
    import eventBus from '../packs/eventBus.js';
    export default {
        props: ['product', 'link'],
        methods: {
            addToCart: function() {
                eventBus.$emit('add-to-cart', this.product);
            },
            goToProduct: function() {

            }
        }
    }
</script>

