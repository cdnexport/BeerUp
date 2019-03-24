<template>
    <div id="app">
        <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="/">
                <!-- <img src="../assets/images/beer.png" height="40"> -->
                BeerUp
                </a>
                <storeLocation />
                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item">
                        Beer
                    </a>
                    <a class="navbar-item">
                        Stores
                    </a>
                    <a class="navbar-item">
                        About
                    </a>
                    <a class="navbar-item">
                        Contact
                    </a>
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
export default {
    components: {storeLocation},
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