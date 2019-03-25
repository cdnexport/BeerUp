import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue';
import storeLocation from '../components/storeLocation.vue';
import Buefy from 'buefy';
import 'buefy/dist/buefy.css';

Vue.use(TurbolinksAdapter);
Vue.use(Buefy);

document.addEventListener('turbolinks:load', () => {
    const el = document.getElementById('storeLocation');

    if(el != null) {
        const app = new Vue({
            el,
            render: h => h(storeLocation)
        });
    }
});