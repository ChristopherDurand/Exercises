class Calculator {
  constructor() {
    this.currentNumber = 0;
    this.storedNumber = null;
    this.storedOperator = null;
    this.operations = {
      "*": this.mult.bind(this),
      "/": this.div.bind(this),
      "+": this.plus.bind(this),
      "-": this.minus.bind(this),
      "=": this.equals.bind(this),
      "%": this.mod.bind(this),
    };
  }

  mod() {
    this.storedNumber %= this.currentNumber;
  }

  mult() {
    this.storedNumber *= this.currentNumber;
  }
  div() {
    this.storedNumber /= this.currentNumber;
  }
  plus() {
    this.storedNumber += this.currentNumber;
  }
  minus() {
    this.storedNumber -= this.currentNumber;
  }
  equals() {
    this.currentNumber = this.operations[this.storedOperator]();
    this.storedNumber = null;
    this.storedOperator = null;
  }

  numberButton(digit) {
    this.currentNumber = this.currentNumber * 10 + Number(digit);
  }

  operatorButton(operator) {
    if (this.operator !== '=') {
      this.storedOperator = operator;
    }
    if (this.storedNumber) {
      this.operations[operator]();
    } else {
      this.storedNumber = this.currentNumber;
    }
    // this.storedNumber = this.currentNumber;
    this.currentNumber = 0;
  }
}

$(() => {
  let App = {
    init() {
      this.calculator = new Calculator();
      let app = this;
      $('#buttons').on('click', '.number', function(e) {
        e.preventDefault();
        app.calculator.numberButton($(this).text());
        $('#number').text(app.calculator.currentNumber);
      });
      $('#buttons').on('click', '.operator', function(e) {
        e.preventDefault();
        app.calculator.operatorButton($(this).text());
        $('#number').text(app.calculator.currentNumber);
        $('#calculation').text(`${app.calculator.storedOperator || 'none'} ${app.calculator.storedNumber}`);
      });
    }
  }
  App.init();
});