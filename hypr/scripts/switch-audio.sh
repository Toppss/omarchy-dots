executable: chmod +x ~/.config/hypr/scripts/switch-audio.sh

# This script cycles through available audio output devices using PipeWire

get_current_sink() {
    pactl get-default-sink
}

get_sinks() {
    pactl list short sinks | awk '{print $2}'
}

get_sink_description() {
    local sink=$1
    pactl list sinks | grep -A 50 "Name: $sink" | grep "Description:" | head -1 | sed 's/.*Description: //'
}

switch_to_sink() {
    local sink=$1
    pactl set-default-sink "$sink"
    
    # Move all currently playing streams to the new sink
    for input in $(pactl list short sink-inputs | awk '{print $1}'); do
        pactl move-sink-input "$input" "$sink"
    done
    
    local description=$(get_sink_description "$sink")
    notify-send -u low "Audio Output" "Switched to: $description" -t 2000
}

# Get all sinks and find the next one
readarray -t sinks < <(get_sinks)
current=$(get_current_sink)

# Find index of current sink
current_index=0
for i in "${!sinks[@]}"; do
    if [[ "${sinks[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

# Calculate next sink index (cycle back to first if at end)
next_index=$(( (current_index + 1) % ${#sinks[@]} ))

switch_to_sink "${sinks[$next_index]}"
