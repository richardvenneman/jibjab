# jQuery JibJab

jQuery JibJab lets you reveal a string of text in a container, one character at the time.

Examples:

- [Rise and shine](http://richardvenneman.github.com/jibjab/rise-and-shine.html) (gasping enabled)
- [Berserk](http://richardvenneman.github.com/jibjab/berserk.html) (gasping disabled)

## Usage

After including the jquery.jibjab.js javascript along with jQuery, you can call `jibjab()` on a DOM element:

```javascript
$('#container').jibjab();
```

## Options

The following options can be passed with initialization.

```javascript
$('#container').jibjab({
  gasping: false,
  eolDelay: 600
});
```

### `speed` - integer
_Default: 60_

The speed in milliseconds at which characters should be revealed.

### `gasping` - boolean
_Default: true_

Whether or not punctutation breathing space should be inserted. Currently comma's, multiple dots and EOL dots are supported.

### `commaDelay` - integer
_Default: 200_

Breathing space after a comma. Requires gasping to be true.

### `dotsDelay` - integer
_Default: 140_

Breathing space after multiple dots. Requires gasping to be true.

### `eolDelay` - integer
_Default: 200_

Breathing space after completing a line. Requires gasping to be true.

## Events

JibJab fires the following events.

```javascript
$('#container').on('finish', function() {
  alert('JibJab has finished. So much fun!');
});
```

### `progress` - (event, progress)

Returns the progress on a 0-100 scale after revealing a character.

### `finished`

Fired when all characters have been revealed.

## Planned

- Specs
- HTML tag support
- Sound effects
- Computing word breaks within container
