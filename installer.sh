#!/bin/bash

# installer - A script to install packages from various languages via curl
# Usage: ./installer [options] <packages>

# Default settings
SILENT=false
NODEJS=false
PYTHON=false
RUBY=false
RUST=false
GO=false
PHP=false
ALL=false
DRY_RUN=false

# Function to display usage information
show_usage() {
    echo "Usage: ./installer [options] <packages>"
    echo "Options:"
    echo "  -n, --nodejs     Install Node.js packages via npm"
    echo "  -p, --python     Install Python packages via pip"
    echo "  -r, --ruby       Install Ruby gems"
    echo "  -u, --rust       Install Rust crates"
    echo "  -g, --go         Install Go packages"
    echo "  -h, --php        Install PHP packages via composer"
    echo "  -a, --all        Install for all supported languages"
    echo "  -s, --silent     Silent mode (no output except errors)"
    echo "  -d, --dry-run    Show what would be installed without installing"
    echo "  -h, --help       Show this help message"
    exit 1
}

# Function to log messages (respects silent mode)
log() {
    if [ "$SILENT" = false ]; then
        echo "$1"
    fi
}

# Function to install Node.js packages
install_nodejs() {
    for pkg in "$@"; do
        log "Installing Node.js package: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                npm install -g "$pkg" > /dev/null 2>&1
            else
                npm install -g "$pkg"
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed Node.js package: $pkg"
            else
                echo "✗ Failed to install Node.js package: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install Node.js package: $pkg"
        fi
    done
}

# Function to install Python packages
install_python() {
    for pkg in "$@"; do
        log "Installing Python package: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                pip install "$pkg" > /dev/null 2>&1
            else
                pip install "$pkg"
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed Python package: $pkg"
            else
                echo "✗ Failed to install Python package: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install Python package: $pkg"
        fi
    done
}

# Function to install Ruby gems
install_ruby() {
    for pkg in "$@"; do
        log "Installing Ruby gem: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                gem install "$pkg" > /dev/null 2>&1
            else
                gem install "$pkg"
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed Ruby gem: $pkg"
            else
                echo "✗ Failed to install Ruby gem: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install Ruby gem: $pkg"
        fi
    done
}

# Function to install Rust crates
install_rust() {
    for pkg in "$@"; do
        log "Installing Rust crate: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                cargo install "$pkg" > /dev/null 2>&1
            else
                cargo install "$pkg"
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed Rust crate: $pkg"
            else
                echo "✗ Failed to install Rust crate: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install Rust crate: $pkg"
        fi
    done
}

# Function to install Go packages
install_go() {
    for pkg in "$@"; do
        log "Installing Go package: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                go install "$pkg"@latest > /dev/null 2>&1
            else
                go install "$pkg"@latest
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed Go package: $pkg"
            else
                echo "✗ Failed to install Go package: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install Go package: $pkg"
        fi
    done
}

# Function to install PHP packages
install_php() {
    for pkg in "$@"; do
        log "Installing PHP package: $pkg"
        if [ "$DRY_RUN" = false ]; then
            if [ "$SILENT" = true ]; then
                composer require "$pkg" > /dev/null 2>&1
            else
                composer require "$pkg"
            fi
            
            if [ $? -eq 0 ]; then
                log "✓ Successfully installed PHP package: $pkg"
            else
                echo "✗ Failed to install PHP package: $pkg" >&2
            fi
        else
            log "[DRY RUN] Would install PHP package: $pkg"
        fi
    done
}

# Function to download and install via curl
download_and_install() {
    local url="$1"
    local output_file="$2"
    
    log "Downloading from: $url"
    if [ "$DRY_RUN" = false ]; then
        if [ "$SILENT" = true ]; then
            curl -s -L -o "$output_file" "$url"
        else
            curl -L -o "$output_file" "$url"
        fi
        
        if [ $? -eq 0 ]; then
            log "✓ Successfully downloaded to: $output_file"
            
            # Make the file executable if it's a script
            if [[ "$output_file" == *.sh ]]; then
                chmod +x "$output_file"
                log "Made $output_file executable"
            fi
            
            # If it's a tar/zip file, extract it
            if [[ "$output_file" == *.tar.gz ]]; then
                log "Extracting $output_file..."
                tar -xzf "$output_file"
            elif [[ "$output_file" == *.zip ]]; then
                log "Extracting $output_file..."
                unzip -q "$output_file"
            fi
        else
            echo "✗ Failed to download from: $url" >&2
        fi
    else
        log "[DRY RUN] Would download from: $url to $output_file"
    fi
}

# Parse command line arguments
PACKAGES=()
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--nodejs)
            NODEJS=true
            ;;
        -p|--python)
            PYTHON=true
            ;;
        -r|--ruby)
            RUBY=true
            ;;
        -u|--rust)
            RUST=true
            ;;
        -g|--go)
            GO=true
            ;;
        -h|--php)
            PHP=true
            ;;
        -a|--all)
            ALL=true
            ;;
        -s|--silent)
            SILENT=true
            ;;
        -d|--dry-run)
            DRY_RUN=true
            ;;
        -h|--help)
            show_usage
            ;;
        -*)
            echo "Unknown option: $1" >&2
            show_usage
            ;;
        *)
            PACKAGES+=("$1")
            ;;
    esac
    shift
done

# If no language flags are set, show usage
if [ "$NODEJS" = false ] && [ "$PYTHON" = false ] && [ "$RUBY" = false ] && [ "$RUST" = false ] && [ "$GO" = false ] && [ "$PHP" = false ] && [ "$ALL" = false ] && [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "Error: No installation options specified." >&2
    show_usage
fi

# If --all is set, set all languages to true
if [ "$ALL" = true ]; then
    NODEJS=true
    PYTHON=true
    RUBY=true
    RUST=true
    GO=true
    PHP=true
fi

# Check if we have packages to install
if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "Error: No packages specified." >&2
    show_usage
fi

# Display configuration if not in silent mode
if [ "$SILENT" = false ]; then
    echo "======== Installer Configuration ========"
    echo "Installing packages: ${PACKAGES[*]}"
    echo "Node.js: $NODEJS"
    echo "Python: $PYTHON"
    echo "Ruby: $RUBY"
    echo "Rust: $RUST"
    echo "Go: $GO"
    echo "PHP: $PHP"
    echo "Silent mode: $SILENT"
    echo "Dry run: $DRY_RUN"
    echo "========================================"
fi

# Install packages based on the selected languages
for pkg in "${PACKAGES[@]}"; do
    # Check if it's a URL for direct download
    if [[ "$pkg" == http* ]]; then
        # Extract filename from URL
        filename=$(basename "$pkg")
        download_and_install "$pkg" "$filename"
        continue
    fi
    
    # Install for selected languages
    if [ "$NODEJS" = true ]; then
        install_nodejs "$pkg"
    fi
    
    if [ "$PYTHON" = true ]; then
        install_python "$pkg"
    fi
    
    if [ "$RUBY" = true ]; then
        install_ruby "$pkg"
    fi
    
    if [ "$RUST" = true ]; then
        install_rust "$pkg"
    fi
    
    if [ "$GO" = true ]; then
        install_go "$pkg"
    fi
    
    if [ "$PHP" = true ]; then
        install_php "$pkg"
    fi
done

log "Installation complete!"
exit 0
