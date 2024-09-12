import pyautogui
from pynput import mouse, keyboard

# Имя файла для сохранения координат
output_file = 'cursor_movements.txt'
coordinates = []
stop_program = False  # Переменная для остановки программы

def mode_menu():
    print("Выберите режим:")
    print("1. Проверять положение мыши (по Y X)")
    print("2. Ставить мышку по координатам (по Y X)")
    mode = input("Ввод (1/2): ")
    return int(mode)

# Установите курсор в центр экрана и отобразите координаты центра
def set_cursor_to_center():
    screen_width, screen_height = pyautogui.size()
    center_x, center_y = screen_width // 2, screen_height // 2
    print(f'Центр экрана: ({center_x}, {center_y})')
    pyautogui.moveTo(center_x, center_y)
    return center_x, center_y

# Режим 1: Запись движения курсора в файл и вывод в консоль
def on_move(x, y):
    if stop_program:
        return False
    print(f'Cursor moved to ({x}, {y})')
    coordinates.append((x, y))

# Режим 2: Установка курсора в заданные координаты
def set_cursor_position():
    while not stop_program:
        x = int(input("Введите координату X: "))
        y = int(input("Введите координату Y: "))
        mouse_controller.position = (x, y)

# Функция для завершения программы при нажатии Enter
def on_press(key):
    global stop_program
    if key == keyboard.Key.tab:
        save_and_exit()

# Сохранение координат в файл и выход
def save_and_exit():
    global stop_program
    stop_program = True
    with open(output_file, 'w') as file:
        for x, y in coordinates:
            file.write(f'{x}, {y}')
    print("Coordinates saved. Exiting program.")
    listener_mouse.stop()
    if listener_keyboard.running:
        listener_keyboard.stop()

# Настройка контроллера мыши и клавиатуры
mouse_controller = mouse.Controller()
keyboard_controller = keyboard.Controller()

# Выбор режима работы
mode = mode_menu()

if mode == 1:
    # Установка курсора в центр экрана при запуске режима проверки положения мыши
    center_x, center_y = set_cursor_to_center()
    coordinates.append((center_x, center_y))

    # Запуск отслеживания положения мыши
    listener_mouse = mouse.Listener(on_move=on_move)
    listener_keyboard = keyboard.Listener(on_press=on_press)

    listener_mouse.start()
    listener_keyboard.start()

    listener_mouse.join()
    listener_keyboard.join()

elif mode == 2:
    # Запуск режима установки курсора по координатам
    listener_keyboard = keyboard.Listener(on_press=on_press)
    listener_keyboard.start()
    set_cursor_position()