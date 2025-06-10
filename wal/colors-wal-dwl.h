/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x0a0300ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc1c0bfff, 0x0a0300ff, 0x655852ff },
	[SchemeSel]  = { 0xc1c0bfff, 0x544E32ff, 0x32433Bff },
	[SchemeUrg]  = { 0xc1c0bfff, 0x32433Bff, 0x544E32ff },
};
