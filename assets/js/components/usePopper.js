import { createPopper } from "@popperjs/core";

export default (userOptions = {}) => ({
  popperInstance: null,
  options: buildOptions(userOptions),
  isShowPopper: false,
  init() {
    this.$nextTick(
      () =>
        (this.popperInstance = createPopper(
          this.$refs.popperRef,
          this.$refs.popperRoot,
          this.options
        ))
    );
    this.$watch("isShowPopper", (val) => val && this.popperInstance.update());
    
    Alpine.effect(
      () => Alpine.store("breakpoints").name && (this.isShowPopper = false)
    );
  },
});

const buildOptions = (options) => {
  const config = {
    placement: options.placement ?? "auto",
    strategy: options.strategy ?? "fixed",
    onFirstUpdate: options.onFirstUpdate ?? function () {},

    modifiers: [
      {
        name: "offset",
        options: {
          offset: [0, options.offset ?? 0],
        },
      },
    ],
  };

  if (options.modifiers) config.modifiers.push(...options.modifiers);

  return config;
};
