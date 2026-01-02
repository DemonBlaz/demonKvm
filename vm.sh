#!/bin/bash

# --- COLOR SCHEME ---
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

# --- MAIN LOOP ---
while true; do
    print_banner
    echo -e "    ${W}╔══════════════════════════════════════════╗${N}"
    echo -e "    ${W}║${N}  ${R}[1]${N} ${W}LAUNCH LT3PLAYZ VPS             ${W}║${N}"
    echo -e "    ${W}║${N}  ${R}[2]${N} ${W}EXIT TERMINAL                   ${W}║${N}"
    echo -e "    ${W}╚══════════════════════════════════════════╝${N}"
    
    echo -en "\n    ${R}»${N} ${W}Select Option [1-2]: ${Y}"
    read op

    case $op in
        1)
            clear
            print_banner
            echo -e "    ${R}»${N} ${W}BOOTING VPS AS root@lt3playz...${N}"
            echo -e "${D}    ──────────────────────────────────────────${N}"
            
            # Configuration
            RAM=15000
            CPU=4
            DISK_SIZE=100G
            CONTAINER_NAME="lt3playz_vps"
            IMAGE_NAME="hopingboyz/debain12"
            VMDATA_DIR="$PWD/lt3playz_data"
            BRAND_NAME="lt3playz"

            mkdir -p "$VMDATA_DIR"
            
            echo -e "    ${G}✔${N} ${W}HOSTNAME:${N} ${Y}$BRAND_NAME${N}"
            echo -e "    ${G}✔${N} ${W}PASSWORD:${N} ${Y}$BRAND_NAME${N}"
            echo -e "${D}    ──────────────────────────────────────────${N}"
            
            # Docker execution with branding overrides
            docker run -it --rm \
                --name "$CONTAINER_NAME" \
                --hostname "$BRAND_NAME" \
                -h "$BRAND_NAME" \
                --device /dev/kvm \
                -v "$VMDATA_DIR":/vmdata \
                -e RAM="$RAM" \
                -e CPU="$CPU" \
                -e DISK_SIZE="$DISK_SIZE" \
                -e HOSTNAME="$BRAND_NAME" \
                -e USER="$BRAND_NAME" \
                -e PASSWORD="$BRAND_NAME" \
                "$IMAGE_NAME"

            echo -e "\n    ${W}Session ended. Press Enter to return...${N}"
            read
            ;;
        2)
            echo -e "\n    ${Y}Goodbye, LT3PLAYZ!${N}"
            exit 0
            ;;
        *)
            echo -e "    ${R}Error:${N} ${W}Invalid Selection!${N}"
            sleep 1
            ;;
    esac
done

