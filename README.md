# jQuery JibJab

jQuery JibJab lets you reveal a string of text in a container, one character at the time.

Examples:

- [Rise and shine](http://richardvenneman.github.com/jibjab/rise-and-shine.html) (gasping enabled)
- [Berserk](http://richardvenneman.github.com/jibjab/berserk.html) (gasping disabled)

## Usage

After including the jquery.jibjab.js javascript along with jQuery, you can call `jibjab()` on a DOM element:

```javascript
$('#container').jibjab({text: 'This text will be revealed one character at the time' });
```

When calling `jibjab()` without the `text` option, JibJab utilises the elements innerHTML. Make sure you pass some text when calling `jibjab()` on an empty target element.

## Options

The following options can be passed with initialization.

| Option         | Type    | Default | Description                                                                                                                  |
| -------------- | ------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **speed**      | integer | 60      | The speed in milliseconds at which characters should be revealed.                                                            |
| **gasping**    | boolean | true    | Whether or not punctutation breathing space should be inserted. Currently comma's, multiple dots and EOL dots are supported. |
| **commaDelay** | integer | 200     | Breathing space after a comma. Requires gasping to be true.                                                                  |
| **dotsDelay**  | integer | 140     | Breathing space after multiple dots. Requires gasping to be true.                                                            |
| **eolDelay**   | integer | 200     | Breathing space after completing a line. Requires gasping to be true.                                                        |

Pass options like this:

```javascript
$('#container').jibjab({
  gasping: false,
  eolDelay: 600
});
```

## Events

JibJab fires the following events.

| Event        | Parameters      | Description                                                        |
| ------------ | --------------- | ------------------------------------------------------------------ |
| **Progress** | event, progress | Returns the progress on a 0-100 scale after revealing a character. |
| **Finished** | *none*          | Fired when all characters have been revealed.                      |

Subscribe to events like this:

```javascript
$('#container').on('finish', function() {
  alert('JibJab has finished. So much fun!');
});
```

## Specs

The specs are written with mocha. To run the specs:

1. Install [mocha](http://mochajs.org/)
2. run `npm install` from the project directory to install the dependencies
3. run `mocha --compilers coffee:coffee-script` from the project directory, optionally passing `--reporter nyan` (:

## Planned

- HTML tag support
- Sound effects
- Computing word breaks within container
