function bind(func, context, ...preArgs) {
  return function (...args) {
    return func.apply(context, [...preArgs, ...args]);
  }
}