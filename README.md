# Arduino Nano Project

## Установка зависимостей

### Установка `avr-gcc` и `avrdude`

**Добавьте необходимые репозитории (если требуется)**:

```bash
sudo add-apt-repository ppa:arduino-ppa/stable
sudo apt-get update
sudo apt-get install gcc-avr avr-libc avrdude
```
**Если пакеты не найдены, вы можете установить их из исходников:**
```bash
sudo apt-get install build-essential cmake
git clone https://github.com/avrdudes/avrdude.git
cd avrdude
./build.sh
 ```
### Сборка и загрузка
```bash
make - Сборка проекта
make upload - Загрузка на ардуино
```