<template>
    <div class="tile is-parent is-3">
        <div class="tile is-child box">
            <img v-bind:src="product.image">
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
        props: ['product'],

        methods: {
            addToCart: function() {
                eventBus.$emit('add-to-cart', this.product);
            }
        }
    }
</script>

