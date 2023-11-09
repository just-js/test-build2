function assert (condition, message, ErrorType = Error) {
  if (!condition) {
    if (message && message.constructor.name === 'Function') {
      throw new ErrorType(message())
    }
    throw new ErrorType(message || "Assertion failed")
  }
  return condition
}

function wrap (h, fn, plen = 0) {
  const call = fn
  const params = (new Array(plen)).fill(0).map((_, i) => `p${i}`).join(', ')
  const f = new Function(
    'h',
    'call',
    `return function ${fn.name} (${params}) {
    call(${params}${plen > 0 ? ', ' : ''}h);
    return h[0] + ((2 ** 32) * h[1]);
  }`,)
  const fun = f(h, call)
  if (fn.state) fun.state = fn.state
  return fun
}

const console = {
  log: str => spin.print(`${str}\n`)
}

const handle = new Uint32Array(2)
spin.hrtime = wrap(handle, spin.hrtime)
console.log(spin.hrtime() - spin.start)
console.log(spin.version.spin)
console.log(spin.version.v8)
//spin.runMicroTasks()
//console.log(spin.builtins())
//console.log(spin.libraries())
//console.log(spin.builtin('main.js'))
