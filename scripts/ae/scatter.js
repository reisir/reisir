// timeless random, doesn't change every frame
seedRandom(index, timeless = true);
// sliders from controller
let scatter = thisComp.layer("controller").effect("scatter")("Slider");
let freq = thisComp.layer("controller").effect("freq")("Slider");
let amp = thisComp.layer("controller").effect("amp")("Slider");
// wiggle
let w = wiggle(freq, amp);
// math
let x = (scatter  * Math.random() * (Math.random() > 0.5 ? -1 : 1)) + w[0];
let y = (scatter  * Math.random() * (Math.random() > 0.5 ? -1 : 1)) + w[1];
// output
[x,y]