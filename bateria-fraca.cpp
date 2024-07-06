#include <chrono>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <thread>
using namespace std;

bool notified = false;
constexpr char BATTERY_STATUS_PATH[] = "/sys/class/power_supply/BAT1/status";
constexpr char BATTERY_CAPACITY_PATH[] =
    "/sys/class/power_supply/BAT1/capacity";
constexpr char NOTIFY_COMMAND[] =
    "notify-send -i ~/.local/share/icons/bateria.png -t 10000 "
    "--urgency=critical \"ATENÇÃO!!!\" "
    "\"Bateria fraca\"";
constexpr char HIBERNATE_COMMAND[] = "systemctl hibernate";
constexpr char LOCK_COMMAND[] = "~/.local/bin/lock";
int a = 0;
string status;

class BatteryMonitor {
public:
  void notifyBattery(int capacity) {
    if (capacity <= 30 && notified == false) {
      system(NOTIFY_COMMAND);
      notified = true;
    } else if (notified == true) {
      a += 1;
      if (a == 180) {
        notified = false;
        a = 0;
      }
    }
  }
  void hibernate() {
    for (int i = 10; i >= 2; i--) {
      stringstream ss;
      ss << "Hibernando em " << i << " segundos.";
      string notification = ss.str();
      system(("notify-send \"ATENÇÃO\" \"" + notification + "\"").c_str());
      this_thread::sleep_for(chrono::seconds(1));
    }
    system("notify-send \"ATENCÃO\" \"Hibernando em 1 segundo(ou não)\"");
    this_thread::sleep_for(chrono::seconds(1));
    string line;
    ifstream statusFile(BATTERY_STATUS_PATH);
    if (statusFile.is_open()) {
      getline(statusFile, status);
      statusFile.close();
    }
    if (status == "Discharging") {
      system(HIBERNATE_COMMAND);
      system(LOCK_COMMAND);
    }
  }
  void monitorBattery() {
    while (true) {
      string line;
      int capacity;

      // Ler status da bateria
      ifstream statusFile(BATTERY_STATUS_PATH);
      if (statusFile.is_open()) {
        getline(statusFile, status);
        statusFile.close();
      }

      // Ler capacidade da bateria
      ifstream capacityFile(BATTERY_CAPACITY_PATH);
      if (capacityFile.is_open()) {
        getline(capacityFile, line);
        capacity = stoi(line);
        capacityFile.close();
      }

      // Verificar se a bateria está descarregando
      if (status == "Discharging") {
        notifyBattery(capacity);
        if (capacity <= 10) {
          hibernate();
        }
      }

      // Esperar 1 minuto antes da próxima verificação
      this_thread::sleep_for(chrono::seconds(1));
    }
  }
};

int main() {
  BatteryMonitor monitor;
  monitor.monitorBattery();
  return 0;
}
