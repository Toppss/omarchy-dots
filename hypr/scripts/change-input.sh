#!/usr/bin/env -S bash --
exec jq --arg default_source_name "$(pactl get-default-source)" --from-file "$0" "$@"

map(
    select(.type == "PipeWire:Interface:Node" and .info.props["media.class"] == "Audio/Source")
    | {id: .id, name: .info.props["node.name"]}
) | sort_by(.name) as $sources
    | $sources | map(.name) | index($default_source_name) as $index
    | $sources[($index + 1) % ($sources | length)].id
```

Make it executable, then in `hyprland.conf`:
```
bind = $mainMod SHIFT, M, exec, wpctl set-default "$(pw-dump | get-next-source)"