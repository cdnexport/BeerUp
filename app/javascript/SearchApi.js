const rails_api = {
    params: {
        headers: {
            "content-type": "application/json; charset=UTF-8",
            "X-Requested-With": "XMLHttpRequest",
            "X-CSRF-TOKEN": window._token
        },
        method: ''
    },

    search: async function(data, category) {
        this.params.method = "GET";
        let response = null;
        if (category === 1) {
            response = await fetch(`search?data=${data}`, this.params);
        }
        else {
            response = await fetch(`search?data=${data}&category=${category}`, this.params);
        }
        return response.json(); 
    },
};

export default rails_api;
