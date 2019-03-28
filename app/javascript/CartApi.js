const rails_api = {
    params: {
        headers: {
            "content-type": "application/json; charset=UTF-8",
            "X-Requested-With": "XMLHttpRequest",
            "X-CSRF-TOKEN": window._token
        },
        method: ''
    },

    getCart: async function() {
        this.params.method = "GET";
        let response = await fetch('cart', this.params);
        return response.json(); 
    },

    addToCart: async function(product) {
        if (product === undefined) return;
        try {
            this.params.method = "POST";
            await fetch(`cart/${product.id}/add_to_cart/`, this.params);
        } catch (error) {
            console.log(error);
            console.log(product);
        }
    },

    removeFromCart: async function(product) {
        this.params.method = "DELETE";
        await fetch(`cart/${product.id}/remove_from_cart`, this.params);
    },

    clearCart: async function() {
        this.params.method = "POST";
        await fetch('cart/clear_cart', this.params);
    },

    reduceProduct: async function (product) {
        this.params.method = "DELETE";
        await fetch(`cart/${product.id}/reduce_quantity`, this.params);
    },

    increaseProduct: async function (product) {
        this.params.method = "POST";
        await fetch(`cart/${product.id}/increase_quantity`, this.params);
    }
};

export default rails_api;
