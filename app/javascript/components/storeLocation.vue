<template>
    <div class="navbar-item">
        <p v-if="store !== null">
            {{store.name}}
        </p>
        <p v-if="storeLoading">
            Fetching store.
        </p>
        <p v-if="store === null && !storeLoading">
            Store not found.
        </p>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            position: null,
            store: null,
            storeLoading: false
        };
    },
    created: function () {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(async (position) => {
                this.storeLoading = true;
                this.position = position.coords;
                let tempStore = await fetch(`http://localhost:3000/store/closest_store?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`);
                this.store = await tempStore.json();
                this.store = this.store[0];
                this.storeLoading = false;
            });
        } else {
            console.log("Geolocation is not supported");
        }
    }
}
</script>
