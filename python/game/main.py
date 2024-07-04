import pygame
import random

# 初始化Pygame
pygame.init()

# 屏幕大小
SCREEN_WIDTH = 300
SCREEN_HEIGHT = 600
GRID_SIZE = 30

# 颜色定义
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
YELLOW = (255, 255, 0)
CYAN = (0, 255, 255)
MAGENTA = (255, 0, 255)
ORANGE = (255, 165, 0)
PURPLE = (255, 65, 0)

# 形状定义
SHAPES = [
    [[1, 1, 1, 1]],  # I
    [[1, 1], [1, 1]],  # O
    [[0, 1, 0], [1, 1, 1]],  # T
    [[1, 0, 0], [1, 1, 1]],  # L
    [[0, 0, 1], [1, 1, 1]],  # J
    [[0, 1, 1], [1, 1, 0]],  # S
    [[1, 1, 0], [0, 1, 1]]  # Z
]

# 形状颜色
SHAPE_COLORS = [CYAN, YELLOW, PURPLE, ORANGE, BLUE, GREEN, RED]

# 游戏屏幕
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("俄罗斯方块")

# 时钟
clock = pygame.time.Clock()


class Tetris:
    def __init__(self):
        self.board = [[0 for _ in range(SCREEN_WIDTH // GRID_SIZE)] for _ in range(SCREEN_HEIGHT // GRID_SIZE)]
        self.current_shape = self.get_new_shape()
        self.next_shape = self.get_new_shape()
        self.score = 0
        self.game_over = False

    def get_new_shape(self):
        shape = random.choice(SHAPES)
        color = SHAPE_COLORS[SHAPES.index(shape)]
        return [shape, color]

    def draw_board(self):
        for y, row in enumerate(self.board):
            for x, cell in enumerate(row):
                if cell != 0:
                    pygame.draw.rect(screen, cell, (x * GRID_SIZE, y * GRID_SIZE, GRID_SIZE, GRID_SIZE))

    def draw_shape(self, shape, offset):
        for y, row in enumerate(shape[0]):
            for x, cell in enumerate(row):
                if cell:
                    pygame.draw.rect(screen, shape[1], ((x + offset[0]) * GRID_SIZE, (y + offset[1]) * GRID_SIZE, GRID_SIZE, GRID_SIZE))

    def check_collision(self, shape, offset):
        off_x, off_y = offset
        for y, row in enumerate(shape[0]):
            for x, cell in enumerate(row):
                if cell:
                    if x + off_x < 0 or x + off_x >= SCREEN_WIDTH // GRID_SIZE or y + off_y >= SCREEN_HEIGHT // GRID_SIZE:
                        return True
                    if self.board[y + off_y][x + off_x]:
                        return True
        return False

    def merge_shape(self, shape, offset):
        off_x, off_y = offset
        for y, row in enumerate(shape[0]):
            for x, cell in enumerate(row):
                if cell:
                    self.board[y + off_y][x + off_x] = shape[1]

    def clear_lines(self):
        lines_cleared = 0
        for y in range(len(self.board)):
            if all(self.board[y]):
                del self.board[y]
                self.board.insert(0, [0 for _ in range(SCREEN_WIDTH // GRID_SIZE)])
                lines_cleared += 1
        self.score += lines_cleared ** 2

    def move(self, direction):
        if not self.check_collision(self.current_shape, (self.current_x + direction, self.current_y)):
            self.current_x += direction

    def drop(self):
        if not self.check_collision(self.current_shape, (self.current_x, self.current_y + 1)):
            self.current_y += 1
        else:
            self.merge_shape(self.current_shape, (self.current_x, self.current_y))
            self.clear_lines()
            self.current_shape = self.next_shape
            self.next_shape = self.get_new_shape()
            self.current_x, self.current_y = SCREEN_WIDTH // GRID_SIZE // 2 - len(self.current_shape[0][0]) // 2, 0
            if self.check_collision(self.current_shape, (self.current_x, self.current_y)):
                self.game_over = True

    def rotate(self):
        rotated_shape = [list(row) for row in zip(*self.current_shape[0][::-1])]
        if not self.check_collision((rotated_shape, self.current_shape[1]), (self.current_x, self.current_y)):
            self.current_shape = (rotated_shape, self.current_shape[1])

    def update(self):
        if not self.game_over:
            self.drop()

    def draw(self):
        screen.fill(BLACK)
        self.draw_board()
        self.draw_shape(self.current_shape, (self.current_x, self.current_y))
        pygame.display.update()


def main():
    game = Tetris()
    game.current_x, game.current_y = SCREEN_WIDTH // GRID_SIZE // 2 - len(game.current_shape[0][0]) // 2, 0

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                return
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    game.move(-1)
                elif event.key == pygame.K_RIGHT:
                    game.move(1)
                elif event.key == pygame.K_DOWN:
                    game.drop()
                elif event.key == pygame.K_UP:
                    game.rotate()

        game.update()
        game.draw()
        clock.tick(5)


if __name__ == "__main__":
    main()
