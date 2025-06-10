const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0300", /* black   */
  [1] = "#32433B", /* red     */
  [2] = "#544E32", /* green   */
  [3] = "#8D3208", /* yellow  */
  [4] = "#AC5413", /* blue    */
  [5] = "#A05618", /* magenta */
  [6] = "#C7701B", /* cyan    */
  [7] = "#c1c0bf", /* white   */

  /* 8 bright colors */
  [8]  = "#655852",  /* black   */
  [9]  = "#32433B",  /* red     */
  [10] = "#544E32", /* green   */
  [11] = "#8D3208", /* yellow  */
  [12] = "#AC5413", /* blue    */
  [13] = "#A05618", /* magenta */
  [14] = "#C7701B", /* cyan    */
  [15] = "#c1c0bf", /* white   */

  /* special colors */
  [256] = "#0a0300", /* background */
  [257] = "#c1c0bf", /* foreground */
  [258] = "#c1c0bf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
