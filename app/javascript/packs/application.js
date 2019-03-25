// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import '@babel/polyfill';
import 'bulma';
import shopdisplay from '../components/shopdisplay.vue';
import main from '../components/app.vue';
import Vue from 'vue';
import Buefy from 'buefy';
import 'buefy/dist/buefy.css';
import TurbolinksAdapter from 'vue-turbolinks';
import VueRouter from 'vue-router';
import about from '../components/about.vue';
import contact from '../components/contact.vue';

Vue.use(TurbolinksAdapter);
Vue.use(Buefy);
Vue.use(VueRouter)

const routes = [
    {path: '/', name: 'home', component: shopdisplay },
    {path: '/about', name: 'about', component: about},
    {path: '/contact', name: 'contact', component: contact}
];

const router = new VueRouter({
    routes
});

document.addEventListener('turbolinks:load', () => {
    const el = document.getElementById('app');

    if(el != null) {
        const app = new Vue({
            el,
            render: h => h(main),
            router
        });
    }
});