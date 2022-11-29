var container = document.querySelector('.container');
var beerStream = document.querySelector('.beerStream');
var handle = document.querySelector('.handle');
var beerLiquid = document.querySelector('.beerLiquid');
var fullGlass = document.querySelector('.fullGlass');
console.log('test')
TweenMax.set(container, {
  position:'absolute',
  top:'50%',
  left:'50%',
  xPercent:-50,
  yPercent:-50
})


var tl = new TimelineMax({delay:1, repeat:-1});
tl.timeScale(2.6)
tl.to(handle, 0.3, {
  rotation:30,
  transformOrigin:'50% 90%',
  ease:Back.easeIn
})
.fromTo(beerStream, 4,{
  y:-450
},{
  y:250,
  ease:Linear.easeNone
})
  .to(handle, 0.3, {
  rotation:0,
  ease:Back.easeOut
}, '-=2')

.fromTo(beerLiquid, 4, {
  y:200,
  x:80
},{
  y:-15,
  x:0
},'-=3.8')

.staggerTo('.froth circle', 1.6, {
  attr:{
    r:'+=15',
    cy:'-=10'
  },
  alpha:1,
  ease:Elastic.easeOut.config(1, 0.61)
}, 0.1, '-=0.6')

.staggerTo('.beerBubbles circle', 3, {
  attr:{
    cy:'-=100'
  },
  ease:Power1.easeIn,
  alpha:1
}, 0.1, '-=3')

.to(fullGlass, 2, {
  attr:{ 
  	x:-400
  },
  ease:Back.easeIn.config(0.5)
})
.staggerTo('.beerBubbles circle',0.1, {
  attr:{
    cy:'+=100'
  }, 
 
  alpha:0
},0)
.staggerTo('.froth circle',0.1, {
  attr:{
    r:'-=15',
    cy:'+=10'
  },
  alpha:0
},0)
.to(fullGlass,0, {
  attr:{
    x:600
  }
})

.set(beerLiquid,{
  x:0,
  y:200
})

.to(fullGlass,2, {
  attr:{
    x:0
  },
  ease:Back.easeOut.config(0.5)
})

.to(fullGlass, 0.3, {
  rotation:16
})
