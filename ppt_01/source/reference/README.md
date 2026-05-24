# Reference Assets

Files required by the current examples:

```text
background.png
ppt插图/*.png
ppt插图/*.jpeg
ppt插图/*.svg
```

Ignored local-only reference exports:

```text
百态冬韵.pdf
百态冬韵_无文字.pdf
百态冬韵/
百态冬韵_无文字/
ppt插图/*.mp4
```

The ignored files are useful when comparing against the original PPT, preserving original video sources, or regenerating `assets/hybrid/`, but they are not required for normal template compilation. Static video frames used by LaTeX live in `../assets/worldmodel/`.
