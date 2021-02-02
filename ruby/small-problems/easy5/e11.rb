No, because the string is split into an array of sub strings, which makes them new objects. It doesn't matter that we call `string#reverse!` because the original object is not the one being modified.
