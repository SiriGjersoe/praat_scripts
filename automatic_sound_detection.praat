
# ==============================
# AUTOMATIC VOWEL SEGMENTATION
# USING EXISTING TEXTGRID (SAFE VERSION)
# ==============================

# ---------- FILE PATHS ----------
soundPath$ = "C:/Users/SIRI/Documents/S/Praat/files-scripts/sound-files/14072016-Lu-VObst-bone-pl-a-1.wav"
textgridPath$ = "C:/Users/SIRI/Documents/S/Praat/files-scripts/sound-files/14072016-Lu-VObst-bone-pl-a-1.TextGrid"
outputFolder$ = "C:/Users/SIRI/Documents/S/Praat/files-scripts/results/"

# ---------- READ FILES ----------
Read from file: soundPath$
sound$ = selected$("Sound")

Read from file: textgridPath$
textgrid$ = selected$("TextGrid")

# ---------- SAFE INTENSITY (NO PITCH ERROR) ----------
select Sound 'sound$'
To Intensity: 75, 0.01, "yes"

# ---------- MODIFY EXISTING TEXTGRID ----------
select TextGrid 'textgrid$'
n = Get number of intervals: 1

for i from 1 to n
    label$ = Get label of interval: 1, i

    if label$ = "V"
        Set interval text: 1, i, "V"
    else
        Set interval text: 1, i, "C"
    endif
endfor

# CRITICAL FIX: FORCE TextGrid SELECTION BEFORE SAVE 
select TextGrid 'textgrid$'

# ---------- SAVE ----------
outputName$ = outputFolder$ + sound$ + "_VowelSegmentation.TextGrid"
Save as TextGrid file: "'outputName$'"

printline ("DONE! Saved as: " + outputName$)


