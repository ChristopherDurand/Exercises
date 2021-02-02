class Timer {
  constructor() {
    this.running = false;
    this.storedTime = 0;
  }

  start() {
    if (!this.running) {
      this.intervalStart = Date.now();
      this.running = true;
    }
  }

  reset() {
    if (this.running) {
      this.running = false;
    }
    this.storedTime = 0;
  }

  pause() {
    if(this.running) {
      this.storedTime += Date.now() - this.intervalStart;
      this.running = false;
    }
  }

  current() {
    if(this.running) {
      return this.storedTime + Date.now() - this.intervalStart;
    } else {
      return this.storedTime;
    }
  }
}

$(() => {
  let App = {
    init() {
      this.step = 10;
      this.timer = new Timer();
      this.$timer = $('#timer');
      this.$startButton = $('#start');
      this.$startButton.on('click', this.start.bind(this));
      $('#reset').on('click', this.reset.bind(this));
      this.drawTime();
    },

    drawTime() {
      let padLeft = n => n === 0 ? '00' : (n < 10 ? `0${n}` : n);
      let time = this.timer.current();
      let h, m, s, cs;
      h = Math.floor(time / 3600000);
      m = Math.floor(time / 60000 - h * 60);
      s = Math.floor(time / 1000 - m * 60 - h * 3600);
      cs = Math.floor((time / 10) % 100);

      this.$timer.text(`${padLeft(h)}:${padLeft(m)}:${padLeft(s)}:${padLeft(cs)}`);
    },

    pause() {
      this.timer.pause();
      clearInterval(this.interval);
      this.$startButton
        .text('Start')
        .off('click')
        .on('click', this.start.bind(this));
    },

    start() {
      this.timer.start();
      this.interval = setInterval(this.drawTime.bind(this), this.step)
      this.$startButton
        .text('Stop')
        .off('click')
        .on('click', this.pause.bind(this));
    },

    reset() {
      this.pause();
      this.timer.reset();
      this.drawTime();
   },
  }

  App.init();
});