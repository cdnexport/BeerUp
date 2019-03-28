class HttpError extends Error {
    constructor(response) {
        super(`${response.status} for ${response.url}`);
        this.name = "HttpError";
        this.response = response;
    }
}

const rails_api = {
    headers: {
        "Content-type": "application/json; charset=utf-8",
        "X-CSRF-Token": document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content")
    },

    checkResponse: function(response, expectedStatus) {
        if (response.status !== expectedStatus) {
        throw new HttpError(response);
        }
    },

    getProducts: async function(page, category) {
        let response;
        if(category === 1 || category === undefined) {
            response = await fetch(`products?page=${page}`);
        }
        else {
            response = await fetch(`products?page=${page}&category=${category}`);
        }

        rails_api.checkResponse(response, 200);
        return response.json(); 
    },

    getCategories: async function() {
        let response = await fetch('categories');

        rails_api.checkResponse(response, 200);
        return response.json(); 
    }

};

export default rails_api;
