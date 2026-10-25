# Embedded systems labs

Zynq 보드로 진행한 임베디드시스템 실험. Verilog, C, 보드 제약 파일을 담았습니다.

| 폴더 | 내용 |
| --- | --- |
| [week2_source](week2_source) | 버튼, 스위치, LED |
| [Week3 source](Week3%20source) | 시계와 7-segment 표시 |
| [week5_source](week5_source) | TFT LCD 타이밍, 색상, BRAM |
| [week11](week11) | AHB/APB 주변장치, 버튼 인터럽트, GIC |
| [report-fragments](report-fragments) | 15주차 LED·8-byte 전송 부분 코드 |

## Build

실습용 Zynq 보드와 Vivado/SDK가 필요합니다. 각 주차를 별도 프로젝트로 구성하고, 해당 보드의 블록 디자인·생성 IP·BSP를 연결해야 합니다. `system_wrapper`, BRAM IP, `xparameters.h` 등은 이 저장소만으로 생성되지 않습니다.

핀 배치는 포함된 `.xdc`를 참고하세요. 다른 보드에서는 핀과 전압 설정을 바꿔야 합니다.

HUINS·Xilinx 보드 예제와 수업 제공 코드를 기반으로 합니다. 라이선스는 각 파일의 원래 헤더를 따릅니다.
