-- Copyright 2013 Nils Nordman <nino at nordman.org>
-- License: MIT (see LICENSE)

is_header = (line) ->
  return true if line\match('^%#+%s')
  next = line.next
  return next and next\match('^[-=]+%s*$')

{
  lexer: bundle_load('markdown_lexer')

  default_config:
    word_pattern: '%w[%w%d_-]+'
    cursor_line_highlighted: false

  auto_pairs: {
      '(': ')'
      '[': ']'
      '{': '}'
      '"': '"'
    }

  code_blocks:
    multiline: {
      { r'```(\\w+)?\\s*$', '^```', '```'}
    }

  structure: (editor) =>
    [l for l in *editor.buffer.lines when is_header(l)]
}
