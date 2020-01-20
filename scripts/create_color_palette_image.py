import matplotlib.patches as patches
import matplotlib.pyplot as plt

redl = '#cc241d'
redd = '#9d0006'
greenl = '#98971a'
bluel = '#458588'
blued = '#076678'
purplel = '#b16286'
purpled = '#8f3f71'
aqual = '#689d6a'
aquad = '#427b58'
grayd = '#7c6f64'
grayl1 = '#928374'
grayl2 = '#928374'
orangel = '#d65d0e'
oranged = '#af3a03'
yellowl = '#d79921'
yellowd = '#b57614'
bg2 = '#d5c4a1'
mybg = '#ffecb6'
fgl = '#3c3836'
bgl = '#f2e5bc'
blackl = '#fbf1c7'
blackd = '#928374'
whitel = '#3c3836'

colors = (mybg, yellowl, yellowd, orangel, oranged)
colors = (mybg, purplel, purpled, orangel, oranged)
colors = (mybg, aqual, aquad, orangel, oranged)
colors = (mybg, orangel, oranged, orangel, oranged)
colors = (mybg, orangel, oranged, redl, redd)
colors = (mybg, bluel, blued, orangel, oranged)
colors = (mybg, mybg, mybg, orangel, oranged)
colors = (yellowd, orangel, oranged, oranged, oranged)
colors = (grayl2, orangel, oranged, oranged, oranged)
colors = (orangel, orangel, oranged, oranged, oranged)
colors = (grayl2, grayl2, purpled, purpled, purpled)
colors = (blued, blued, oranged, oranged, oranged)
colors = (bluel, bluel, blued, blued, blued)
colors = (bgl, bgl, blackd, blackd, blackd)

width = 1680/100
height = 1050/100
fig, ax = plt.subplots(figsize=(width, height))
for i, c in enumerate(colors):
    rect = patches.Rectangle((0+i, 0), 1, 1, facecolor=c)
    ax.add_patch(rect)

ax.set_xlim((0, len(colors)))
ax.axis('off')

plt.savefig('/Users/arvidbjurklint/Dropbox/dotfiles/scripts/gruvbox_colors_3.png',
        bbox_inches='tight', pad_inches=0)
