#!/bin/bash

# --- COLOR SCHEME (Professional Red & White) ---
R="\e[1;31m"   # Bold Red
W="\e[1;37m"   # Bold White
Y="\e[1;33m"   # Bold Yellow
G="\e[1;32m"   # Bold Green
D="\e[2m"      # Dim/Gray
N="\e[0m"      # Reset

# --- UI COMPONENTS ---
print_banner() {
    clear
    echo -e "${R}  ██╗     ████████╗██████╗ ██████╗ ██╗      █████╗ ██╗   ██╗███████╗${N}"
    echo -e "${R}  ██║     ╚══██╔══╝╚════██╗██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝╚══███╔╝${N}"
    echo -e "${R}  ██║        ██║    █████╔╝██████╔╝██║     ███████║ ╚████╔╝   ███╔╝ ${N}"
    echo -e "${R}  ██║        ██║    ╚═══██╗██╔═══╝ ██║     ██╔══██║  ╚██╔╝   ███╔╝  ${N}"
    echo -e "${R}  ███████╗   ██║   ██████╔╝██║     ███████╗██║  ██║   ██║   ███████╗${N}"
    echo -e "${R}  ╚══════╝   ╚═╝   ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝${N}"
    echo -e "          ${Y}N E T W O R K   |   M A D E   B Y   L T 3 P L A Y Z${N}"
    echo -e "${D}──────────────────────────────────────────────────────────────────────${N}"
}

print_menu_card() {
    echo -e "\n    ${W}╔══════════════════════════════════════════╗${N}"
    echo -e "    ${W}║${N}  ${R}[1]${N} ${W}LAUNCH GITHUB VPS MAKER         ${W}║${N}"
    echo -e "    ${W}║${N}  ${R}[2]${N} ${W}EXIT TERMINAL                   ${W}║${N}"
    echo -e "    ${W}╚══════════════════════════════════════════╝${N}"
}

# --- MAIN LOGIC ---
while true; do
    print_banner
    echo -e "    ${Y}SYSTEM STATUS:${N} ${G}ONLINE${N}"
    print_menu_card
    
    echo -en "\n    ${R}»${N} ${W}Select Option [1-2]: ${Y}"
    read op

    case $op in
        1)
            clear
            print_banner
            echo -e "    ${R}»${N} ${W}INITIALIZING GITHUB VPS MAKER...${N}"
            echo -e "${D}    ──────────────────────────────────────────${N}"
            
            # Configuration
            RAM=15000
            CPU=4
            DISK_SIZE=100G
            CONTAINER_NAME="Lt3playz_VPS"
            IMAGE_NAME="hopingboyz/debain12"
            VMDATA_DIR="$PWD/vmdata"

            mkdir -p "$VMDATA_DIR"
            
            echo -e "    ${G}✔${N} ${W}RAM:${N}  ${Y}$RAM MB${N}"
            echo -e "    ${G}✔${N} ${W}CPU:${N}  ${Y}$CPU Cores${N}"
            echo -e "    ${G}✔${N} ${W}DISK:${N} ${Y}$DISK_SIZE${N}"
            echo -e "    ${G}✔${N} ${W}NAME:${N} ${Y}$CONTAINER_NAME${N}"
            echo -e "${D}    ──────────────────────────────────────────${N}"
            
            echo -e "    ${R}ATTENTION:${N} Starting Docker Instance..."
            
            docker run -it --rm \
                --name "$CONTAINER_NAME" \
                --device /dev/kvm \
                -v "$VMDATA_DIR":/vmdata \
                -e RAM="$RAM" \
                -e CPU="$CPU" \
                -e DISK_SIZE="$DISK_SIZE" \
                "$IMAGE_NAME"

            echo -e "\n    ${W}Session ended. Press Enter to return...${N}"
            read
            ;;
        2)
            echo -e "\n    ${Y}Thank you for using LT3PLAYZ Network!${N}"
            echo -e "    ${R}Terminating session...${N}"
            sleep 1
            exit 0
            ;;
        *)
            echo -e "    ${R}Error:${N} ${W}Invalid Selection!${N}"
            sleep 1
            ;;
    esac
done
