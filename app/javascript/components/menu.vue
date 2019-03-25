<template>
    <div id="app">
        <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="/">
                <!-- <img src="../assets/images/beer.png" height="40"> -->
                BeerUp
                </a>
                <storeLocation />
                <search />
                <a role="button" id="hamburger" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <router-link
                         to="/" 
                         v-on:click.native="closeMenu"
                         class="navbar-item">
                    Beer
                    </router-link>
                    <a class="navbar-item">
                        Stores
                    </a>
                    <router-link
                        to="/about"
                        v-on:click.native="closeMenu"
                        class="navbar-item">
                    About
                    </router-link>
                    <router-link 
                        to="/contact" 
                        v-on:click.native="closeMenu"
                        class="navbar-item">
                    Contact
                    </router-link>
                </div>

                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <a class="button is-primary">
                                <strong>Sign up</strong>
                            </a>
                            <a class="button is-light">
                                Log in
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</template>
<script>
import storeLocation from './storeLocation.vue';
import search from './search.vue';
export default {
    components: {storeLocation, search},
    mounted: function () {
        const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
        if ($navbarBurgers.length > 0) {
            $navbarBurgers.forEach( el => {
                el.addEventListener('click', () => {
                    const target = el.dataset.target;
                    const $target = document.getElementById(target);
                    el.classList.toggle('is-active');
                    $target.classList.toggle('is-active');
                });
            });
        }
    },
    methods: {
        closeMenu: function () {
            document.getElementById("navbarBasicExample").classList.toggle('is-active');
            document.getElementById("hamburger").classList.toggle('is-active');
        }
    }
}
</script>
<style scoped>
		body {
			background-color: #FBFFFE;
		}
		.navbar {
			background-color: orange;
		}
</style>