/* ---- particles.js config ---- */

particlesJS("particles-js2", {
  "particles": {
    "number": {
      "value": 25,
      "density": {
        "enable": true,
        "value_area": 800.8649341288591
      }
    },
    "color": {
      "value": "#65bfaf"
    },
    "shape": {
      "type": "circle",
      "stroke": {
        "width": 4,
        "color": "#4ea1be"
      },
      "polygon": {
        "nb_sides": 3
      },
      "image": {
        "src": "img/github.svg",
        "width": 100,
        "height": 100
      }
    },
    "opacity": {
      "value": 0.2,
      "random": false,
      "anim": {
        "enable": false,
        "speed": 0.081115500360964,
        "opacity_min": 0.04055775018048201,
        "sync": false
      }
    },
    "size": {
      "value": 10.01729868257718,
      "random": true,
      "anim": {
        "enable": false,
        "speed": 30,
        "size_min": 1.6223100072192802,
        "sync": false
      }
    },
    "line_linked": {
      "enable": true,
      "distance": 224.24218155608057,
      "color": "#4ea1be",
      "opacity": 1,
      "width": 1.28570856525047
    },
    "move": {
      "enable": true,
      "speed": 4,
      "direction": "none",
      "random": false,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": true,
        "mode": "grab"
      },
      "onclick": {
        "enable": true,
        "mode": "push"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 400,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble": {
        "distance": 400,
        "size": 40,
        "duration": 2,
        "opacity": 8,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 2
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});
