import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue';
import shopdisplay from '../components/shopdisplay.vue';
import Buefy from 'buefy';
import 'buefy/dist/buefy.css';

Vue.use(TurbolinksAdapter);
Vue.use(Buefy);

document.addEventListener('turbolinks:load', () => {
    const el = document.getElementById('shopdisplay');

    if(el != null) {
        const app = new Vue({
            el,
            render: h => h(shopdisplay)
        });
    }
});