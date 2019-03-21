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
        let response = await fetch('http://localhost:3000/cart', this.params);
        return response.json(); 
    },

    addToCart: async function(product) {
        if (product === undefined) return;
        try {
            this.params.method = "POST";
            await fetch(`http://localhost:3000/cart/${product.id}/add_to_cart/`, this.params);
        } catch (error) {
            console.log(error);
            console.log(product);
        }
    },

    removeFromCart: function(product) {
    },

    clearCart: async function() {
        this.params.method = "POST";
        await fetch('http://localhost:3000/cart/clear_cart', this.params);
    }
};

export default rails_api;
