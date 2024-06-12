from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.label import Label
from kivy.clock import Clock
from kivy.graphics import Rectangle, Color
from random import choice

# 形状和颜色
shapes = [
    [['.....',
      '.....',
      '..00.',
      '.00..',
      '.....'],
     ['.....',
      '..0..',
      '..00.',
      '...0.',
      '.....']],

    [['.....',
      '.....',
      '.00..',
      '..00.',
      '.....'],
     ['.....',
      '..0..',
      '.00..',
      '.0...',
      '.....']],

    [['.....',
      '..0..',
      '..0..',
      '..0..',
      '..0..'],
     ['.....',
      '0000.',
      '.....',
      '.....',
      '.....']],

    [['.....',
      '.....',
      '.00..',
      '.00..',
      '.....']],

    [['.....',
      '.0...',
      '.000.',
      '.....',
      '.....'],
     ['.....',
      '..00.',
      '..0..',
      '..0..',
      '.....'],
     ['.....',
      '.....',
      '.000.',
      '...0.',
      '.....'],
     ['.....',
      '..0..',
      '..0..',
      '.00..',
      '.....']],

    [['.....',
      '...0.',
      '.000.',
      '.....',
      '.....'],
     ['.....',
      '..0..',
      '..0..',
      '..00.',
      '.....'],
     ['.....',
      '.....',
      '.000.',
      '.0...',
      '.....'],
     ['.....',
      '.00..',
      '..0..',
      '..0..',
      '.....']],

    [['.....',
      '..0..',
      '.000.',
      '.....',
      '.....'],
     ['.....',
      '..0..',
      '..00.',
      '..0..',
      '.....'],
     ['.....',
      '.....',
      '.000.',
      '..0..',
      '.....'],
     ['.....',
      '..0..',
      '.00..',
      '..0..',
      '.....']]
]

shape_colors = [(0, 255, 0), (255, 0, 0), (0, 255, 255), (255, 255, 0), (255, 165, 0), (0, 0, 255), (128, 0, 128)]


class TetrisApp(App):
    def build(self):
        self.game = TetrisGame()
        Clock.schedule_interval(self.game.update, 1 / 2)
        return self.game


class TetrisGame(Widget):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.grid = [[(0, 0, 0) for _ in range(10)] for _ in range(20)]
        self.current_piece = self.new_piece()
        self.next_piece = self.new_piece()
        self.locked_positions = {}
        self.score = 0

        with self.canvas:
            self.rects = [[Rectangle(pos=(x * 30, y * 30), size=(30, 30)) for x in range(10)] for y in range(20)]

    def new_piece(self):
        return Piece(5, 0, choice(shapes))

    def update(self, dt):
        self.clear_widgets()
        self.update_grid()
        self.draw_grid()

    def update_grid(self):
        self.current_piece.y += 1
        if not self.valid_space(self.current_piece, self.grid):
            self.current_piece.y -= 1
            self.lock_piece()
            self.current_piece = self.next_piece
            self.next_piece = self.new_piece()
            self.clear_rows()
            if self.check_lost():
                self.__init__()

    def lock_piece(self):
        for pos in self.convert_shape_format(self.current_piece):
            self.locked_positions[(pos[0], pos[1])] = self.current_piece.color

    def clear_rows(self):
        rows_to_clear = [y for y in range(20) if (0, 0, 0) not in [self.grid[y][x] for x in range(10)]]
        for y in rows_to_clear:
            for x in range(10):
                del self.locked_positions[(x, y)]
            for x, y in sorted(self.locked_positions.keys(), key=lambda k: k[1])[::-1]:
                if y < min(rows_to_clear):
                    self.locked_positions[(x, y + 1)] = self.locked_positions.pop((x, y))
        self.score += len(rows_to_clear) * 10

    def check_lost(self):
        for pos in self.locked_positions:
            if pos[1] < 1:
                return True
        return False

    def convert_shape_format(self, piece):
        positions = []
        shape_format = piece.shape[piece.rotation % len(piece.shape)]

        for i, line in enumerate(shape_format):
            row = list(line)
            for j, column in enumerate(row):
                if column == '0':
                    positions.append((piece.x + j, piece.y + i))

        for i, pos in enumerate(positions):
            positions[i] = (pos[0] - 2, pos[1] - 4)

        return positions

    def valid_space(self, piece, grid):
        accepted_positions = [[(j, i) for j in range(10) if grid[i][j] == (0, 0, 0)] for i in range(20)]
        accepted_positions = [j for sub in accepted_positions for j in sub]

        formatted = self.convert_shape_format(piece)

        for pos in formatted:
            if pos not in accepted_positions:
                if pos[1] > -1:
                    return False
        return True

    def draw_grid(self):
        self.grid = [[(0, 0, 0) for _ in range(10)] for _ in range(20)]
        for pos in self.locked_positions:
            self.grid[pos[1]][pos[0]] = self.locked_positions[pos]

        for y in range(20):
            for x in range(10):
                self.rects[y][x].pos = (x * 30, (19 - y) * 30)
                self.rects[y][x].color = self.grid[y][x] or (0, 0, 0)


class Piece:
    def __init__(self, x, y, shape):
        self.x = x
        self.y = y
        self.shape = shape
        self.color = shape_colors[shapes.index(shape)]
        self.rotation = 0


if __name__ == '__main__':
    TetrisApp().run()
