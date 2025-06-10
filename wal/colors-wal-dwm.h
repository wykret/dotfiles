static const char norm_fg[] = "#c1c0bf";
static const char norm_bg[] = "#0a0300";
static const char norm_border[] = "#655852";

static const char sel_fg[] = "#c1c0bf";
static const char sel_bg[] = "#32433B";
static const char sel_border[] = "#c1c0bf";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
