#include <stdint.h>

struct xorwow_state {
    uint32_t x[5];
    uint32_t counter;
};

/* The state array must be initialized to not be all zero in the first four words */
uint32_t xorwow(struct xorwow_state *state)
{
    /* Algorithm "xorwow" from p. 5 of Marsaglia, "Xorshift RNGs" */
    uint32_t t  = state->x[4];
 
    uint32_t s  = state->x[0];  /* Perform a contrived 32-bit shift. */
    state->x[4] = state->x[3];
    state->x[3] = state->x[2];
    state->x[2] = state->x[1];
    state->x[1] = s;
 
    t ^= t >> 2;
    t ^= t << 1;
    t ^= s ^ (s << 4);
    state->x[0] = t;
    state->counter += 362437;
    return t + state->counter;
}

static struct xorwow_state static_state = { { 0, 1, 2, 3, 4 }, 0 };

uint32_t xrand() {
	return xorwow(&static_state);
}
